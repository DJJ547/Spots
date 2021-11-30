package com.dai.database;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.dai.bean.CreateSpotBean;

public class NewSpotRegisterDB {
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
