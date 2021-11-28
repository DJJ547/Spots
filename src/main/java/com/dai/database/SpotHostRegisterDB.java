package com.dai.database;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.dai.bean.SpotHostRegisterBean;

public class SpotHostRegisterDB {
	String s1 = null;
	public String insertUser(SpotHostRegisterBean srb) {
		SpotHostDatabase sdb = new SpotHostDatabase();
		Connection con = sdb.getCon();
		try {
			Statement st = con.createStatement();
			st.executeUpdate("insert into spothost(first_name, last_name, host_email, password) values('"+srb.getFirstName()+"','"+srb.getLastName()+"','"+srb.getEmail()+"','"+srb.getPassword()+"')");
			s1 = "Successfully inserted.";
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return s1;
	}
}
