package com.blog.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.blog.dao.PostDao;
import com.blog.entities.Post;
import com.blog.entities.User;
import com.blog.helper.Helper;
import com.blog.helper.MyConnection;

/**
 * Servlet implementation class AddPosts
 */
@MultipartConfig
public class AddPosts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPosts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid=Integer.parseInt(request.getParameter("cid"));
		String ptitle=request.getParameter("ptitle");
		String pcontent=request.getParameter("pcontent");
		String pcode=request.getParameter("pcode");
		Part part=request.getPart("image");
		String imageName=part.getSubmittedFileName();
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("us");
		
		Post p= new Post(ptitle,pcontent,pcode,imageName,null,cid,user.getId());
		PostDao pd= new PostDao(MyConnection.getConnetion());
		if(pd.savePost(p))
		{

			String path1 =request.getRealPath("/")+"blog_pics"+File.separator+imageName;
			Helper.saveFile(part.getInputStream(), path1);
			out.println("done");
		}
		else
		{
			out.println("error");
		}
	}

}
