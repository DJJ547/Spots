package com.dai.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import com.dai.bean.CreateSpotBean;

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
	
	String s1 = null;
	public String insertSpot(CreateSpotBean csb) {
		SpotsDatabase sd = new SpotsDatabase();
		Connection con = sd.getCon();
		try {
			Statement st = con.createStatement();
			st.executeUpdate("insert into spots(name, address, city, zipcode) values('"+csb.getName()+"','"+csb.getAddress()+"','"+csb.getCity()+"','"+csb.getZipcode()+"')");
			s1 = "Spot successfully inserted into table spots.";
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return s1;
	}
}
