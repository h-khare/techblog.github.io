package com.blog.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.dao.UserDao;
import com.blog.entities.User;
import com.blog.helper.MyConnection;

/**
 * Servlet implementation class Register
 */
@MultipartConfig
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		String check=request.getParameter("check");
		
		if(check==null) {
		out.println(check);
		}
		else
		{
			String name=request.getParameter("user_name");
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			String gender=request.getParameter("gender");
			String about=request.getParameter("about");
			
			UserDao ud= new UserDao(MyConnection.getConnetion());
			User use= new User();
			use.setName(name);
			use.setEmail(email);
			use.setPassword(password);
			use.setGender(gender);
			use.setAbout(about);
			
			if(ud.insertUser(use))
			{
				out.println("Done!");
			}
			else
			{
				out.println("Error");
			}
		}
		
	}

}
