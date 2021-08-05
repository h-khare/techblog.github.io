package com.blog.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.dao.LikeDao;
import com.blog.helper.MyConnection;

/**
 * Servlet implementation class LikeServlet
 */
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			
			String operation=request.getParameter("operation");
			int uid=Integer.parseInt(request.getParameter("uid"));
			int pid =Integer.parseInt(request.getParameter("pid"));
			
			PrintWriter out= response.getWriter();
			out.println(operation);
			out.println(uid);
			out.println(pid);
			
			LikeDao ldao= new LikeDao(MyConnection.getConnetion());
			
			if(operation.equals("like"));
			{
				boolean f= ldao.insertLike(pid, uid);
				out.println(f);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			
			e.printStackTrace();
		}
	}

}
