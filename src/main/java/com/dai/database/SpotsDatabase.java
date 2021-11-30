package com.dai.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SpotsDatabase {
	public Connection getCon() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/spots?allowPublicKeyRetrieval=true&useSSL=false", "root", "password");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return con;
	}
	
	
}
