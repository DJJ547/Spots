package com.dai.database;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.dai.bean.SpotterRegisterBean;

public class SpotterRegisterDB {
	String s1 = null;
	public String insertUser(SpotterRegisterBean srb) {
		SpotterDatabase sdb = new SpotterDatabase();
		Connection con = sdb.getCon();
		try {
			Statement st = con.createStatement();
			st.executeUpdate("insert into spotter(first_name, last_name, spotter_email, password) values('"+srb.getFirstName()+"','"+srb.getLastName()+"','"+srb.getEmail()+"','"+srb.getPassword()+"')");
			s1 = "Successfully inserted.";
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return s1;
	}
}
