package com.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.blog.helper.MyConnection;

public class Hk {
	
	public static void main(String[] args) throws SQLException {
		
		Connection con= MyConnection.getConnetion();
		String query="insert into categories(cname,cdiscription) values(?,?)";
		PreparedStatement pd = con.prepareStatement(query);
		pd.setString(1, "Android Development");
		pd.setString(2, "It is Used to Android Development");
		int i=pd.executeUpdate();
		if(i>0)
		{
		    System.out.println("Dal gya");
		}
	}

}
