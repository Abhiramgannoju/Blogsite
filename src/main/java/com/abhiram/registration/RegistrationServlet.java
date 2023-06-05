package com.abhiram.registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class RegistrationServlet
 */
@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		RequestDispatcher dispacher=null;
		
       
    	   String uname=request.getParameter("name");
    	   String unemail=request.getParameter("email");
    	   String upassword=request.getParameter("pass");
    	   String repass=request.getParameter("re_pass");
    	   String ucontact=request.getParameter("contact");
    	   String data = "Hello from the first servlet";
    	

    	
   		   if (!upassword.equals(repass)) {
      			// Password and re-entered password do not match
      			request.setAttribute("status", "failedpass");
      			dispacher = request.getRequestDispatcher("registration.jsp");
      			dispacher.forward(request, response);
      			return;
      		}

    	   
           Connection con=null;
    	   try {
    		   Class.forName("com.mysql.jdbc.Driver");
    		    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","Abhiram@123");
    		    PreparedStatement pst1=con.prepareStatement("select * from users where email= ?");
    			pst1.setString(1,unemail);
    			
    			ResultSet rs=pst1.executeQuery();
    			if(rs.next())
    			{
    				request.setAttribute("status", "email already exists");
    				dispacher = request.getRequestDispatcher("registration.jsp");
     	            dispacher.forward(request, response);
     	            return;
    			}

    	        if (rs.next()) {
    	            // Email already exists
    	           request.setAttribute("status", "Email already exists");
    	            dispacher = request.getRequestDispatcher("registration.jsp");
    	            dispacher.forward(request, response);
    	            return;
    	        }
    		   PreparedStatement pst=con.prepareStatement("insert into users(username,password,email,mobile) values(?,?,?,?)");
    		   pst.setString(1, uname);
    		   pst.setString(2, upassword);
    		   pst.setString(3, unemail);
    		   pst.setString(4, ucontact);
    		   dispacher=request.getRequestDispatcher("registration.jsp");
 
    		   int rowCount=pst.executeUpdate();
    		   if(rowCount>0)
    		   {
    			   request.setAttribute("status", "success");
    			  dispacher=request.getRequestDispatcher("login.jsp");
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