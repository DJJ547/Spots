<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.dai.database.SpotsDatabase"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Manage Spotter Page</title>
<link href="css/index.css" rel="stylesheet">
</head>
<body>
<%
request.getSession();
String id = (String)session.getAttribute("adminID");
String firstName = (String)session.getAttribute("firstName");
%>
<h1 align="center">Welcome! Admin #<%out.println(id); %>: <%out.println(firstName); %></h1>
<form id="form" method="post" action="adminSearchSpotter">
<label>Search by Spotter Name: </label>
<input type="text" name="spotterName" class="form-control" id="spotterName" placeholder="Enter name keyword">
<input type="submit" value="Search">
</form>

<form id="form" method="post" action="adminRemoveSpotter">
<label>Remove By Spotter Email: </label>
<input type="text" name="spotterEmail" class="form-control" id="spotterName" placeholder="Enter spotter email">
<input type="submit" value="Remove">
</form>

<form id="form" method="post" action="adminManageSpotter">
<input type="submit" value="Manage Spot Host">
</form>
<input type="button" value="Logout" onclick="window.location='welcomePage.jsp'" ><br/><br/>
<%     
try {   
   SpotsDatabase spot = new SpotsDatabase();
   Connection con = spot.getCon();
   PreparedStatement pst;
   ResultSet rs;
   String name = request.getParameter("spotterName");
   if(name == null){
      	pst = con.prepareStatement("select spotter_email, first_name, last_name from spotter");
      	rs = pst.executeQuery();
%>
      	<table border="1" class="center">
      	<tr><th>Spotter Email</th><th>First Name</th><th>Last Name</th>
      	<%
      	while(rs.next()){
      	%>
          	<tr><td align="center"><%= rs.getString(1) %></td><td align="center"><%= rs.getString(2) %></td><td align="center"><%= rs.getString(3) %></td></tr>
      <%}%>
      </table>
<%
   } else{
       	pst = con.prepareStatement("select spotter_email, first_name, last_name from spotter where first_name like ? or last_name like ?");
       	pst.setString(1, "%" + name + "%");
       	pst.setString(2, "%" + name + "%");
       	rs = pst.executeQuery();
%>
       	<table border="1" class="center">
       	<tr><th>Spotter Email</th><th>First Name</th><th>Last Name</th>
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