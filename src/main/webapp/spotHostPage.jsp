<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.dai.database.SpotsDatabase"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spot Host Page</title>
<link href="css/index.css" rel="stylesheet">
</head>
<body>
<%
request.getSession();
String email = (String)session.getAttribute("email");
String firstName = (String)session.getAttribute("firstName");
%>
<%out.println(email); %>
<h1 align="center">Welcome! Spot Host: <%out.println(firstName); %></h1>
<form id="form" method="post" action="spothostsearch">
<label>Search by Spots Name</label>
<input type="text" name="name" class="form-control" id="name" placeholder="Enter name keyword">
<input type="submit" value="Search">
</form>
<input type="button" value="Create New Spot" onclick="window.location='createSpot.jsp'" >
<input type="button" value="Logout" onclick="window.location='welcomePage.jsp'" ><br/><br/>
<%     
try {   
   SpotsDatabase spot = new SpotsDatabase();
   Connection con = spot.getCon();
   PreparedStatement pst;
   ResultSet rs;
   String name = request.getParameter("name");
   if(name == null){
      	pst = con.prepareStatement("select spot_id, name, address, city, zipcode, creation_date from spots where spot_id in (select spot_id from creates where host_email = ?)");
      	pst.setString(1, email);
      	rs = pst.executeQuery();
%>
      	<table border="1">
      	<tr><th>Spot ID</th><th>Name</th><th>Address</th><th>City</th><th>Zip Code</th>
      	<th>Creation Date</th>
      	<%
      	while(rs.next()){
      	%>
          	<tr><td align="center"><%= rs.getString(1) %></td><td align="center"><%= rs.getString(2) %></td><td align="center"><%= rs.getString(3) %></td>
          	<td align="center"><%= rs.getString(4) %></td><td align="center"><%= rs.getString(5) %></td><td align="center"><%= rs.getString(6) %></td></tr>
      <%}%>
      </table>
<%
   } else{
       	pst = con.prepareStatement("select spot_id, name, address, city, zipcode, creation_date from spots where spot_id in (select spot_id from creates where host_email = ?) and name like ?");
       	pst.setString(1, email);
       	pst.setString(2, "%" + name + "%");
       	rs = pst.executeQuery();
%>
       	<table border="1">
       	<tr><th>Spot ID</th><th>Name</th><th>Address</th><th>City</th><th>Zip Code</th>
       	<th>Creation Date</th>
       	<%
       	while(rs.next()){
       	%>
       		<tr><td align="center"><%= rs.getString(1) %></td><td align="center"><%= rs.getString(2) %></td><td align="center"><%= rs.getString(3) %></td>
       		<td align="center"><%= rs.getString(4) %></td><td align="center"><%= rs.getString(5) %></td><td align="center"><%= rs.getString(6) %></td></tr>
      <%}%>
      	</table>
  <%}
} catch(SQLException e) { 
    out.println("SQLException caught: " + e.getMessage()); 
}%>
</body>
</html>