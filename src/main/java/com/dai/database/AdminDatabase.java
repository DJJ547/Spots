package com.dai.database;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dai.bean.AdminLoginBean;

public class AdminDatabase {
	
	public String getFirstName(String id) {
		String firstName = null;
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/spots?allowPublicKeyRetrieval=true&useSSL=false", "root", "password");
			PreparedStatement pst = con.prepareStatement("select first_name from admin where admin_id = ?");
			pst.setString(1, id);
			ResultSet rs = pst.executeQuery();
			rs.next();
			firstName = rs.getString(1);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return firstName;
	}
	
	public boolean validate(AdminLoginBean loginBean) throws ClassNotFoundException {
        boolean status = false;

        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/spots?allowPublicKeyRetrieval=true&useSSL=false", "root", "password");

            // Step 2:Create a statement using connection object
            PreparedStatement preparedStatement = connection
            .prepareStatement("select * from admin where admin_id = ? and password = ? ")) {
            preparedStatement.setString(1, loginBean.getID());
            preparedStatement.setString(2, loginBean.getPassword());

            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            status = rs.next();

        } catch (SQLException e) {
            // process sql exception
            printSQLException(e);
        }
        return status;
    }

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
