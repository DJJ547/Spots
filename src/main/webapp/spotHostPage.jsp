<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spot Host Page</title>
</head>
<body>
<%String spotHostEmail = (String)request.getAttribute("email"); %>
<%= spotHostEmail%>
<h1 align="center">Spot Host Page</h1>
   	<%
   	String db = "spots";
   	String user = "root";
   	String password = "Djj@19950420";
      
	try {   
            java.sql.Connection con; 
            PreparedStatement pst;
            ResultSet rs;
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?allowPublicKeyRetrieval=true&useSSL=false",user, password);
            pst = con.prepareStatement("select * from spots where spot_id = (select spot_id from create where host_email = ?)");
            pst.setString(1, spotHostEmail);
            rs = pst.executeQuery();
    %>
            <table border="1" align="center">
           	<tr><th>Spot ID</th><th>Name</th><th>Address</th><th>City</th><th>Zip Code</th>
            <th>Group Size</th><th>Category1</th><th>Category2</th><th>Category3</th>
            <th>Noise Level</th><th>Creation date</th>
            <%
            while(rs.next()){
            %>
            	<tr><td align="center"><%= rs.getString(1) %></td><td align="center"><%= rs.getString(2) %></td><td align="center"><%= rs.getString(3) %></td>
            	<td align="center"><%= rs.getString(4) %></td><td align="center"><%= rs.getString(5) %></td><td align="center"><%= rs.getString(6) %></td>
            	<td align="center"><%= rs.getString(7) %></td><td align="center"><%= rs.getString(8) %></td><td align="center"><%= rs.getString(9) %></td>
            	<td align="center"><%= rs.getString(10) %></td><td align="center"><%= rs.getString(11) %></td>
            <%}%>
            </table>
    <%} catch(SQLException e) { 
           out.println("SQLException caught: " + e.getMessage()); 
    }%>
</body>
</html>