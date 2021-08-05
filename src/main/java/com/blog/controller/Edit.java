package com.blog.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.blog.dao.UserDao;
import com.blog.entities.Message;
import com.blog.entities.User;
import com.blog.helper.Helper;
import com.blog.helper.MyConnection;

/**
 * Servlet implementation class Edit
 */
@MultipartConfig
public class Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Edit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			String name=request.getParameter("username");
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			String about = request.getParameter("about");
			Part part=request.getPart("image");
			String imageName=part.getSubmittedFileName();
			
			HttpSession session = request.getSession();
			User u=(User)session.getAttribute("us");
			
			UserDao ud= new UserDao(MyConnection.getConnetion());
			u.setName(name);
			u.setEmail(email);
			u.setPassword(password);
			u.setAbout(about);
			String oldFile=u.getProfile();
			u.setProfile(imageName);
			boolean b=ud.updateUser(u);
			if(b)
			{

				String path =request.getRealPath("/")+"pics"+File.separator+u.getProfile();
				String path1 =request.getRealPath("/")+"pics"+File.separator+oldFile;
				
				if(!oldFile.equals("default.png"))
					if(!oldFile.equals(u.getProfile()))
				Helper.deleteFile(path1);
					if(Helper.saveFile(part.getInputStream(), path))
					{
						System.out.println("Chala gya");
						Message m = new Message("Profile Details Updated...","success","alert-success");
						session.setAttribute("msg", m);
						response.sendRedirect("profile.jsp");
					}
					else
					{
						Message m = new Message("Something went wrong...","error","alert-danger");
						session.setAttribute("msg", m);
						response.sendRedirect("profile.jsp");
					}
				
			}
			else
			{
				System.err.println("NI gya");
				Message m = new Message("Something went wrong...","error","alert-danger");
				session.setAttribute("msg", m);
				response.sendRedirect("profile.jsp");
			}
	}

}
