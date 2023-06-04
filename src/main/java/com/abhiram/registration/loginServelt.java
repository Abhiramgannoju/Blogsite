package com.abhiram.registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class loginServelt
 */
@WebServlet("/login")
public class loginServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String uemail=request.getParameter("username");
		String upass=request.getParameter("password");
		RequestDispatcher dispacher=null;
		HttpSession session=request.getSession();
		Connection con=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db?useSSL=false","root","Abhiram@123");
			PreparedStatement pst=con.prepareStatement("select * from users where email= ? and password=?");
			pst.setString(1,uemail);
			pst.setString(2,upass);
			ResultSet rs=pst.executeQuery();
			if(rs.next())
			{
				session.setAttribute("name", rs.getString("email"));
				dispacher=request.getRequestDispatcher("index.jsp");
			}else
			{
				request.setAttribute("status","failed");
				dispacher=request.getRequestDispatcher("login.jsp");
			}
			dispacher.forward(request, response);
		}catch(Exception e) {
 		   e.printStackTrace();
 	   }

	}

}
