package com.blog.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.blog.entities.Category;
import com.blog.entities.Post;

public class PostDao {
	
	Connection con;
	
	public PostDao(Connection con)
	{
		this.con=con;
	}
	public ArrayList<Category> getAllCategories(){
		
		ArrayList<Category> list=new ArrayList<>();
		
		try
		{
			String query="select * from categories";
			Statement st= con.createStatement();
			ResultSet rs=st.executeQuery(query);
			
			while(rs.next())
			{
				int cid=rs.getInt("cid");
				String name =rs.getString("cname");
				String description = rs.getString("cdiscription");
				Category c= new Category(cid,name,description);
				list.add(c);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean savePost(Post p)
	{
		boolean f=false;
		try {
			
			String query="insert into post(ptitle,pcontent,pcode,ppic,catid,userid) values(?,?,?,?,?,?)";
			PreparedStatement pd = con.prepareStatement(query);
			pd.setString(1, p.getpTitle());
			pd.setString(2, p.getpContent());
			pd.setString(3, p.getpCode());
			pd.setString(4, p.getpPic());
			pd.setInt(5,p.getCatId());
			pd.setInt(6,p.getUserid());
			pd.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
	
	public List<Post> getAllPosts()
	{
		List<Post> list= new ArrayList<Post>();
		try {
			
			String query="select * from post order by pid desc";
			PreparedStatement pd = con.prepareStatement(query);
			ResultSet rs= pd.executeQuery();
			while(rs.next())
			{
				Post p = new Post();
				int id=rs.getInt("pid");
				String ptitle=rs.getString("ptitle");
				String pcontent=rs.getString("pcontent");
				String pcode=rs.getString("pcode");
				String ppic=rs.getString("ppic");
				Date date=rs.getDate("pdate");
				int catid=rs.getInt("catid");
				int userid= rs.getInt("userid");
				p.setpId(id);
				p.setpTitle(ptitle);
				p.setCatId(catid);
				p.setpContent(pcontent);
				p.setpCode(pcode);
				p.setpDate(date);
				p.setpPic(ppic);
				p.setUserid(userid);
				list.add(p);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
//		get all the post
		
		return list;
	}
	
	public List<Post> getPostByCatId(int catid)
	{
		List<Post> list= new ArrayList<Post>();
//		gett all post by id
		
		try {
			
			String query="select * from post where catid=?";
			PreparedStatement pd = con.prepareStatement(query);
			pd.setInt(1, catid);
			ResultSet rs= pd.executeQuery();
			while(rs.next())
			{
				Post p = new Post();
				int id=rs.getInt("pid");
				String ptitle=rs.getString("ptitle");
				String pcontent=rs.getString("pcontent");
				String pcode=rs.getString("pcode");
				String ppic=rs.getString("ppic");
				Date date=rs.getDate("pdate");
				int userid= rs.getInt("userid");
				p.setpId(id);
				p.setpTitle(ptitle);
				p.setCatId(catid);
				p.setpContent(pcontent);
				p.setpCode(pcode);
				p.setpDate(date);
				p.setpPic(ppic);
				p.setUserid(userid);
				list.add(p);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	public Post getPostId(int postId) throws SQLException
	{
		Post p = null;
		String query="select * from post where pid=?";
		PreparedStatement pd = con.prepareStatement(query);
		pd.setInt(1, postId);
		ResultSet rs = pd.executeQuery();
		if(rs.next())
		{
			p= new Post();
			
			int id=rs.getInt("pid");
			String ptitle=rs.getString("ptitle");
			String pcontent=rs.getString("pcontent");
			String pcode=rs.getString("pcode");
			String ppic=rs.getString("ppic");
			Date date=rs.getDate("pdate");
			int catid= rs.getInt("catid");
			int userid= rs.getInt("userid");
			
			p.setpId(id);
			p.setpTitle(ptitle);
			p.setCatId(catid);
			p.setpContent(pcontent);
			p.setpCode(pcode);
			p.setpDate(date);
			p.setpPic(ppic);
			p.setUserid(userid);
		}
		return p;
	}
	
	public List<Post> myPost(int id)
	{
		List<Post> list= new ArrayList<Post>();
		try {
			
			String query="select * from post where userid=?";
			PreparedStatement pd= con.prepareStatement(query);
			pd.setInt(1, id);
			ResultSet rs=pd.executeQuery();
			while(rs.next())
			{
				Post p = new Post();
				int iid=rs.getInt("pid");
				String ptitle=rs.getString("ptitle");
				String pcontent=rs.getString("pcontent");
				String pcode=rs.getString("pcode");
				String ppic=rs.getString("ppic");
				Date date=rs.getDate("pdate");
				int catid=rs.getInt("catid");
				p.setpId(iid);
				p.setpTitle(ptitle);
				p.setCatId(catid);
				p.setpContent(pcontent);
				p.setpCode(pcode);
				p.setpDate(date);
				p.setpPic(ppic);
				p.setUserid(id);
				list.add(p);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	public int postDelete(int id)
	{
		int i=0;
		try {
			
			String query="delete from post where pid=?";
			PreparedStatement pd= con.prepareStatement(query);
			pd.setInt(1, id);
			 i=pd.executeUpdate();
			return i;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return i;
	}

}
