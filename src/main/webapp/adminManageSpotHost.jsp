<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.dai.database.SpotsDatabase"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Manage Spot Host Page</title>
<link href="css/index.css" rel="stylesheet">
</head>

<body>
<%
request.getSession();
String id = (String)session.getAttribute("adminID");
String firstName = (String)session.getAttribute("firstName");
%>
<h1 align="center">Welcome! Admin #<%out.println(id); %>: <%out.println(firstName); %></h1>
<form id="form" method="post" action="adminSearchSpotHost">
<label>Search by Spot Host Name: </label>
<input type="text" name="spotHostName" class="form-control" id="spotHostName" placeholder="Enter name keyword">
<input type="submit" value="Search">
</form>

<form id="form" method="post" action="adminRemoveSpotHost">
<label>Remove By Spot Host Email: </label>
<input type="text" name="spotHostEmail" class="form-control" id="spotHostName" placeholder="Enter spot host email">
<input type="submit" value="Remove">
</form>

<form id="form" method="post" action="adminManageSpotHost">
<input type="submit" value="Manage Spots">
</form>
<input type="button" value="Logout" onclick="window.location='welcomePage.jsp'" ><br/><br/>
<%     
try {   
   SpotsDatabase spot = new SpotsDatabase();
   Connection con = spot.getCon();
   PreparedStatement pst;
   ResultSet rs;
   String name = request.getParameter("spotHostName");
   if(name == null){
      	pst = con.prepareStatement("select host_email, first_name, last_name from spothost");
      	rs = pst.executeQuery();
%>
      	<table border="1" class="center">
      	<tr><th>Spot Host Email</th><th>First Name</th><th>Last Name</th>
      	<%
      	while(rs.next()){
      	%>
          	<tr><td align="center"><%= rs.getString(1) %></td><td align="center"><%= rs.getString(2) %></td><td align="center"><%= rs.getString(3) %></td></tr>
      <%}%>
      	</table>
	<%
   } else{
       	pst = con.prepareStatement("select host_email, first_name, last_name from spothost where first_name like ? or last_name like ?");
       	pst.setString(1, "%" + name + "%");
       	pst.setString(2, "%" + name + "%");
       	rs = pst.executeQuery();
	%>
       	<table border="1" class="center">
       	<tr><th>Spot Host Email</th><th>First Name</th><th>Last Name</th>
       	<%
       	while(rs.next()){
       	%>
       		<tr><td align="center"><%= rs.getString(1) %></td><td align="center"><%= rs.getString(2) %></td><td align="center"><%= rs.getString(3) %></td></tr>
      <%}%>
      	</table>
  <%}
} catch(SQLException e) { 
    out.println("SQLException caught: " + e.getMessage()); 
}%>
</body>
</html>