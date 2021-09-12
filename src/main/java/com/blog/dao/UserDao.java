package com.blog.dao;

import java.sql.Connection;

import com.blog.entities.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
	
	private Connection con;
	
	public UserDao(Connection con)
	{
		this.con=con;
	}
	
	public boolean insertUser(User u)
	{
		boolean f=false;
		try {
			

			
			String query="insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
		 PreparedStatement pd= this.con.prepareStatement(query);
		 
		 pd.setString(1, u.getName());
		 pd.setString(2, u.getEmail());
		 pd.setString(3,u.getPassword());
		 pd.setString(4,u.getGender());
		 pd.setString(5, u.getAbout());
		 
		 pd.executeUpdate();
		 f=true;
		 
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return f;
	}
	
	public User getUserByEmail(String email,String password)
	{
		User user=null;
		try
		{
			String query="select * from user where email=? and password=?";
			PreparedStatement pd = con.prepareStatement(query);
			pd.setString(1, email);
			pd.setString(2, password);
			
			ResultSet rs = pd.executeQuery();
			
			if(rs.next())
			{
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setDate(rs.getDate("reg_date"));
				user.setProfile(rs.getString("profile"));
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return user;
	}
	
	public boolean updateUser(User user)
	{
		boolean b=false;
		try {
			
			String query="update user set name=?,email=?,password=?,about=?,profile=? where id=?";
			PreparedStatement pd= con.prepareStatement(query);
			pd.setString(1, user.getName());
			pd.setString(2, user.getEmail());
			pd.setString(3, user.getPassword());
			pd.setString(4, user.getAbout());
			pd.setString(5, user.getProfile());
			pd.setInt(6,user.getId());
			pd.executeUpdate();
			b=true;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return b;
	}
	
	public User getUserByUserId(int userid)
	{
		
		User user= null;

		try {
			
			String query="select * from user where id=?";
			PreparedStatement pd = con.prepareStatement(query);
			pd.setInt(1, userid);
			ResultSet rs= pd.executeQuery();
			if(rs.next())
			{
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setDate(rs.getDate("reg_date"));
				user.setProfile(rs.getString("profile"));
				return user;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return user;
	}

}
