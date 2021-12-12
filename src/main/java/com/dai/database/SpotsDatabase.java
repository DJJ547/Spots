package com.dai.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dai.model.SpotModel;
import com.dai.model.AdminModel;
import com.dai.model.SpotHostModel;
import com.dai.model.SpotterModel;


public class SpotsDatabase {
	
	//Get connection for all other methods
	public Connection getCon() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/spots?allowPublicKeyRetrieval=true&useSSL=false", "root", "password");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			printSQLException(e);
		}
		
		return con;
	}
	
//=======================================================================================================================================================
//Spots
//=======================================================================================================================================================
	public String insertSpot(SpotModel spot, String email) {
		String s1 = null;
		
		try {
			Connection con = getCon();
			PreparedStatement pst1 = con.prepareStatement("insert into spots(name, address, city, zipcode) values('"+spot.getName()+"','"+spot.getAddress()+"','"+spot.getCity()+"','"+spot.getZipcode()+"')");
			pst1.executeUpdate();
			System.out.println(pst1);
			
			PreparedStatement pst2 = con.prepareStatement("select spot_id from spots where name = ?");
			pst2.setString(1, spot.getName());
			ResultSet rs = pst2.executeQuery();
			rs.next();
			System.out.println(pst2);
			
			PreparedStatement pst3 = con.prepareStatement("insert into creates(host_email, spot_id) values(?,?)");
			pst3.setString(1, email);
			pst3.setString(2, rs.getString(1));
			pst3.executeUpdate();
			System.out.println(pst3);
			
			s1 = "Spot successfully inserted into table spots and creates.";
			
		} catch (SQLException e) {
			printSQLException(e);
		}
		return s1;
	}
	
	public String removeSpot(String id) {
		String s1 = null;
		
		try {
			Connection con = getCon();
			PreparedStatement pst1 = con.prepareStatement("delete from creates where spot_id = ?");
			pst1.setString(1, id);
			pst1.executeUpdate();
			System.out.println(pst1);
			
			PreparedStatement pst2 = con.prepareStatement("delete from manage where spot_id = ?");
			pst2.setString(1, id);
			pst2.executeUpdate();
			System.out.println(pst2);
			
			PreparedStatement pst3 = con.prepareStatement("delete from rate where spot_id = ?");
			pst3.setString(1, id);
			pst3.executeUpdate();
			System.out.println(pst3);
			
			PreparedStatement pst4 = con.prepareStatement("delete from favorite where spot_id = ?");
			pst4.setString(1, id);
			pst4.executeUpdate();
			System.out.println(pst4);
			
			PreparedStatement pst5 = con.prepareStatement("delete from classify where spot_id = ?");
			pst5.setString(1, id);
			pst5.executeUpdate();
			System.out.println(pst5);
			
			PreparedStatement pst6 = con.prepareStatement("delete from spots where spot_id = ?");
			pst6.setString(1, id);
			pst6.executeUpdate();
			System.out.println(pst5);
			
			s1 = "Spot successfully removed from table creates, manage, rate, favorite, classify and spots.";
		
		} catch (SQLException e) {
			printSQLException(e);
		}
		return s1;
	}
	
//===================================================================================================================
//Admin
//===================================================================================================================
	public String getAdminFirstName(String id) {
		String firstName = null;
		try {
			Connection con = getCon();
			PreparedStatement pst = con.prepareStatement("select first_name from admin where admin_id = ?");
			pst.setString(1, id);
			
			System.out.println(pst);
			ResultSet rs = pst.executeQuery();
			rs.next();
			firstName = rs.getString(1);
		} catch (SQLException e) {
			printSQLException(e);
		}
		return firstName;
	}
	
	public boolean validateAdmin(AdminModel admin) throws ClassNotFoundException {
        boolean status = false;

        try (
        	Connection con = getCon();

            PreparedStatement pst = con.prepareStatement("select * from admin where admin_id = ? and password = ? ")) {
        	pst.setString(1, admin.getID());
        	pst.setString(2, admin.getPassword());

            System.out.println(pst);
            ResultSet rs = pst.executeQuery();
            status = rs.next();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return status;
    }
//===================================================================================================================
//Spot Host
//===================================================================================================================
	public String getSpotHostFirstName(String email) {
		String firstName = null;
		try {
			Connection con = getCon();
			PreparedStatement pst = con.prepareStatement("select first_name from spothost where host_email = ?");
			pst.setString(1, email);
			
			System.out.println(pst);
			ResultSet rs = pst.executeQuery();
			rs.next();
			firstName = rs.getString(1);
		} catch (SQLException e) {
			printSQLException(e);
		}
		return firstName;
	}
	
	public boolean validateSpotHost(SpotHostModel spothost) throws ClassNotFoundException {
        boolean status = false;
        try (
        	Connection con = getCon();

            PreparedStatement pst = con
            .prepareStatement("select * from spothost where host_email = ? and password = ? ")) {
            pst.setString(1, spothost.getEmail());
            pst.setString(2, spothost.getPassword());

            System.out.println(pst);
            ResultSet rs = pst.executeQuery();
            status = rs.next();
        } catch (SQLException e) {
            printSQLException(e);
        }
        return status;
    }
	
	public String insertSpotHost(SpotHostModel spothost) {
		String s1 = null;
		try {
			Connection con = getCon();
			PreparedStatement pst = con.prepareStatement("insert into spothost(first_name, last_name, host_email, password) values('"+spothost.getFirstName()+"','"+spothost.getLastName()+"','"+spothost.getEmail()+"','"+spothost.getPassword()+"')");
			pst.executeUpdate();
			System.out.println(pst);
			
			s1 = "spot host successfully inserted into table spothost.";
		} catch (SQLException e) {
			printSQLException(e);
		}
		return s1;
	}
	
	public String removeSpotHost(String email) {
		String s1 = null;
		try {
			Connection con = getCon();
			PreparedStatement pst1 = con.prepareStatement("delete from spothost where host_email = ?");
			pst1.setString(1, email);
			pst1.executeUpdate();
			System.out.println(pst1);
			
			PreparedStatement pst2 = con.prepareStatement("delete from creates where host_email = ?");
			pst2.setString(1, email);
			pst2.executeUpdate();
			System.out.println(pst2);
			
			s1 = "spot host successfully inserted into table spothost.";
			
		} catch (SQLException e) {
			printSQLException(e);
		}
		return s1;
	}
	
//===================================================================================================================
//Spotter
//===================================================================================================================
	public String getSpotterFirstName(String email) {
		String firstName = null;
		try {
			Connection con = getCon();
			PreparedStatement pst = con.prepareStatement("select first_name from spotter where spotter_email = ?");
			pst.setString(1, email);
			
			System.out.println(pst);
			ResultSet rs = pst.executeQuery();
			rs.next();
			firstName = rs.getString(1);
		} catch (SQLException e) {
			printSQLException(e);
		}
		return firstName;
	}
	
	public boolean validateSpotter(SpotterModel spotter) throws ClassNotFoundException {
        boolean status = false;

        try (
        	Connection con = getCon();

            PreparedStatement pst = con.prepareStatement("select * from spotter where spotter_email = ? and password = ? ")) {
        	pst.setString(1, spotter.getEmail());
        	pst.setString(2, spotter.getPassword());

            System.out.println(pst);
            ResultSet rs = pst.executeQuery();
            status = rs.next();

        } catch (SQLException e) {
            printSQLException(e);
        }
        return status;
    }
	
	public String insertSpotter(SpotterModel spotter) {
		String s1 = null;
		
		try {
			Connection con = getCon();
			
			PreparedStatement pst = con.prepareStatement("insert into spotter(first_name, last_name, spotter_email, password) values('"+spotter.getFirstName()+"','"+spotter.getLastName()+"','"+spotter.getEmail()+"','"+spotter.getPassword()+"')");
			System.out.println(pst);
			pst.executeUpdate();
			
			s1 = "Spotter successfully inserted into table spotter.";
		} catch (SQLException e) {
			printSQLException(e);
		}
		return s1;
	}
	
	public String removeSpotter(String email) {
		String s1 = null;
		
		try {
			Connection con = getCon();
			
			PreparedStatement pst1 = con.prepareStatement("delete from spotter where spotter_email = ?");
			pst1.setString(1, email);
			System.out.println(pst1);
			pst1.executeUpdate();
			
			PreparedStatement pst2 = con.prepareStatement("delete from rate where spotter_email = ?");
			pst2.setString(1, email);
			System.out.println(pst2);
			pst2.executeUpdate();
			
			PreparedStatement pst3 = con.prepareStatement("delete from favorite where spotter_email = ?");
			pst3.setString(1, email);
			System.out.println(pst3);
			pst3.executeUpdate();
			
			PreparedStatement pst4 = con.prepareStatement("delete from classify where spotter_email = ?");
			pst4.setString(1, email);
			System.out.println(pst4);
			pst4.executeUpdate();
			
			PreparedStatement pst5 = con.prepareStatement("delete from leaves where spotter_email = ?");
			pst5.setString(1, email);
			System.out.println(pst5);
			pst5.executeUpdate();
			
			PreparedStatement pst6 = con.prepareStatement("delete from ban where spotter_email = ?");
			pst6.setString(1, email);
			System.out.println(pst6);
			pst6.executeUpdate();
			
			s1 = "Spotter successfully removed from table spotter, rate, favorite, classify, leaves, and ban.";
		} catch (SQLException e) {
			printSQLException(e);
		}
		return s1;
	}
	
	public String addToFavorite(int spotID, String email) {
		String s1 = null;
		try {
			Connection con = getCon();
			PreparedStatement pst1 = con.prepareStatement("select * from favorite where spotter_email = ? and spot_id = ?");
			pst1.setString(1, email);
			pst1.setInt(2, spotID);
			ResultSet rs = pst1.executeQuery();
			if(!rs.next()) {
				PreparedStatement pst2 = con.prepareStatement("insert into favorite (spotter_email, spot_id) values('"+email+"','"+spotID+"')");
				System.out.println(pst2);
				pst2.executeUpdate();
				s1 = "Spot successfully added into favorite list.";
			}else {
				s1 = "Spot is already in the favorite list.";
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return s1;
	}
	
	public String removeFavorite(int spotID, String email) {
		String s1 = null;
		try {
			Connection con = getCon();
			PreparedStatement pst1 = con.prepareStatement("select * from favorite where spotter_email = ? and spot_id = ?");
			pst1.setString(1, email);
			pst1.setInt(2, spotID);
			ResultSet rs = pst1.executeQuery();
			if(rs.next()) {
				PreparedStatement pst2 = con.prepareStatement("delete from favorite where spotter_email = ? and spot_id = ?");
				pst2.setString(1, email);
				pst2.setInt(2, spotID);
				System.out.println(pst2);
				pst2.executeUpdate();
				s1 = "Spot successfully removed from favorite list.";
			}else {
				s1 = "Spot is not in the favorite list.";
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return s1;
	}
	
//print error
	private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
