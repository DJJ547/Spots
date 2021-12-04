<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
  <head>
  <title >Spot Detail Page</title>
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=PT+Sans:ital,wght@0,400;0,700;1,400&family=Source+Sans+Pro:wght@900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href=css/index.css>
  </head>
  <input type="button" value="Back to Spotter Main Page" onclick="window.location='spotterPage.jsp'" ><br/><br/>
  <body>
  <div class="container">
  	<img src="images/castrodowntownarea.jpg" alt='Castro Downtown Area' width="600" height="400">
  </div>
  <% 
  String id = (String)session.getAttribute("spotID");
  %>
  <h1 align="center">Spot ID: <%out.println(id); %></h1><br/>
  <%
   	String db = "spots";
   	String user = "root";
   	String password = "password";
      
	try {   
		java.sql.Connection con; 
        PreparedStatement pst;
        ResultSet rs;
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?allowPublicKeyRetrieval=true&useSSL=false",user, password);
        
        pst = con.prepareStatement("select name, address, city, zipcode, description from spots where spot_id = ?");
        pst.setString(1, id);
        rs = pst.executeQuery();
        if(rs.next()){
        	out.println("Spot Name: " + rs.getString(1));
        	out.println("Spot Description: " + rs.getString(5));
        }    
    } catch(SQLException e) { 
        out.println("SQLException caught: " + e.getMessage()); 
    }%>
</body>
</html>