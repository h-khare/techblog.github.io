package com.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {
	
	Connection con=null;
	public LikeDao(Connection con)
	{
		this.con=con;
	}
	
	public boolean insertLike(int pid,int uid)
	{
		
		boolean f=false;
		try {
			
			String query="insert into liked(pid,uid) values(?,?)";
			PreparedStatement pd = con.prepareStatement(query);
			pd.setInt(1, pid);
			pd.setInt(2, uid);
			pd.executeUpdate();
			f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public int countLike(int pid)
	{
		int count=0;
		try {
		String query="select count(*) from liked where pid=?";
		PreparedStatement pd = con.prepareStatement(query);
		pd.setInt(1, pid);
		ResultSet rs= pd.executeQuery();
		if(rs.next())
		{
			count=rs.getInt("count(*)");
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return count;
	}

	public boolean isLiked(int pid,int uid)
	{
		boolean f=false;
		
		try {
			
			String query="select * from liked where pid=? and uid=?";
			PreparedStatement pd = con.prepareStatement(query);
			pd.setInt(1, pid);
			pd.setInt(2, uid);
			
			ResultSet rs =pd.executeQuery();
			if(rs.next())
			{
				f=true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return f;
	}

	public boolean deleteLike(int pid,int uid)
	{
		boolean b= false;
		
		try {
			
			PreparedStatement pd = con.prepareStatement("delete from liked where pid=?and uid=?");
			pd.setInt(1, pid);
			pd.setInt(2, uid);
			pd.executeUpdate();
			b=true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return b;
	}
}
