package com.abhiram.registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class create
 */
@WebServlet("/createblog")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50) // 50MB
public class create extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispacher=null;
		
        
		 Part filePart = request.getPart("image");
	         String fileName = filePart.getSubmittedFileName();
	    InputStream fileContent = filePart.getInputStream();
    	   String topicname=request.getParameter("topicname");
    	   String text=request.getParameter("text");
    	   HttpSession session=request.getSession();
    	   String username = (String) session.getAttribute("username");
    	   
    	  if (topicname == null || topicname.trim().isEmpty() || text == null || text.trim().isEmpty()) {
    	    request.setAttribute("status", "failed");
    	    request.setAttribute("message", "Please provide both the topic name and the text.");
    	    dispacher = request.getRequestDispatcher("create.jsp");
    	    dispacher.forward(request, response);
    	    return;
    	}

    	   
           Connection con=null;
    	   try {
    		   Class.forName("com.mysql.jdbc.Driver");
    		    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","Abhiram@123");
    		  
    		    String SQL=("insert into image(topic,textarea,image,username) values(?,?,?,?)");
               
    		    PreparedStatement pst1= con.prepareStatement(SQL);
    			pst1.setString(1,topicname);
    			pst1.setString(2,text);
    			pst1.setBinaryStream(3, fileContent);
    			pst1.setString(4,username);
    			
    		   int rowCount=pst1.executeUpdate();
      		   if(rowCount>0)
      		   {
      			   request.setAttribute("status", "success");
      			  dispacher=request.getRequestDispatcher("create.jsp");
      		   }
      		   else
      		   {
      			   request.setAttribute("status", "failed");
      		   }
      		  
      		   dispacher.forward(request, response);
      		   
    			
    	   }catch(Exception e) {
    		   e.printStackTrace();
    	   }
       
	}

}