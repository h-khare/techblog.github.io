package com.blog.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.dao.UserDao;
import com.blog.entities.Message;
import com.blog.entities.User;
import com.blog.helper.MyConnection;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		UserDao ud= new UserDao(MyConnection.getConnetion());
		User user= new User();
		user=ud.getUserByEmail(email, password);
		if(user==null)
		{
			Message m = new Message("Invalid Details try with another...","","alert-danger");
			HttpSession session=req.getSession();
			session.setAttribute("msg", m);
			res.sendRedirect("login.jsp");
			
		}
		else
		{
			HttpSession session=req.getSession();
			session.setAttribute("us", user);
			res.sendRedirect("profile.jsp");
		}

	}
}
