package com.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class MyConnection {
	
	private static Connection con;
	
	public static Connection getConnetion()
	{
		try {
			
			if(con==null)
			{
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://remotemysql.com:3306/QjKAXqhcoK","QjKAXqhcoK","7ley8CbaN8");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return con;
	}

}
