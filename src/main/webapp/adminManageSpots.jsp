<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.dai.database.SpotsDatabase"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Manage Spots Page</title>
<link href="css/index.css?v=<%=Math.random()%>" rel="stylesheet">
</head>
<body>
<%
request.getSession();
String id = (String)session.getAttribute("adminID");
String firstName = (String)session.getAttribute("firstName");
%>
<h1 align="center">Welcome! Admin #<%out.println(id); %>: <%out.println(firstName); %></h1>
<form id="form" method="post" action="adminSearchSpots">
<label>Search by Spot Name: </label>
<input type="text" name="spotName" class="form-control" id="spotName" placeholder="Enter name keyword">
<input type="submit" value="Search">
</form>

<form id="form" method="post" action="adminManageSpots">
<input type="submit" value="Manage Spotter">
</form>
<input type="button" value="Logout" onclick="window.location='welcomePage.jsp'" ><br/><br/>
<%     
try {   
   SpotsDatabase spot = new SpotsDatabase();
   Connection con = spot.getCon();
   PreparedStatement pst;
   ResultSet rs;
   String name = request.getParameter("spotName");
   if(name == null){
	   pst = con.prepareStatement("select spot_id, name, address, city, zipcode, group_size, category_1, category_2, category_3, noise_level, creation_date from spots");
   		rs = pst.executeQuery();
   		%>
   		<table border="1" class="center">
   		<tr><th>Remove</th><th>Spot ID</th><th>Name</th><th>Address</th><th>City</th><th>Zip Code</th>
   		<th>Group Size</th><th>Category 1</th><th>Category 2</th><th>Category 3</th>
   		<th>Noise Level</th><th>Creation Date</th></tr>
   		<%
   		while(rs.next()){
   		%>
   			<tr><td align="center"><form id="form" method="post" action="adminRemoveSpot"><button type="submit" name="getSpotID" value="<%=rs.getString(1)%>">Remove</button></form></td><td align="center"><%= rs.getString(1) %></td><td align="center"><%= rs.getString(2) %></td><td align="center"><%= rs.getString(3) %></td>
   			<td align="center"><%= rs.getString(4) %></td><td align="center"><%= rs.getString(5) %></td><td align="center"><%= rs.getString(6) %></td>
   			<td align="center"><%= rs.getString(7) %></td><td align="center"><%= rs.getString(8) %></td><td align="center"><%= rs.getString(9) %></td>
   			<td align="center"><%= rs.getString(10) %></td><td align="center"><%= rs.getString(11) %></td></tr>
     <% } %>
     </table>
   <%
   } else{
	   	pst = con.prepareStatement("select spot_id, name, address, city, zipcode, group_size, category_1, category_2, category_3, noise_level, creation_date from spots where name like ?");
       	pst.setString(1, "%" + name + "%");
       	rs = pst.executeQuery();
   %>
       	<table border="1" class="center">
   		<tr><th>Remove</th><th>Spot ID</th><th>Name</th><th>Address</th><th>City</th><th>Zip Code</th>
   		<th>Group Size</th><th>Category 1</th><th>Category 2</th><th>Category 3</th>
   		<th>Noise Level</th><th>Creation Date</th></tr>
   		<%
   		while(rs.next()){
   		%>
   			<tr><td align="center"><form id="form" method="post" action="adminRemoveSpot"><button type="submit" name="getSpotID" value="<%=rs.getString(1)%>">Remove</button></form></td><td align="center"><%= rs.getString(1) %></td><td align="center"><%= rs.getString(2) %></td><td align="center"><%= rs.getString(3) %></td>
   			<td align="center"><%= rs.getString(4) %></td><td align="center"><%= rs.getString(5) %></td><td align="center"><%= rs.getString(6) %></td>
   			<td align="center"><%= rs.getString(7) %></td><td align="center"><%= rs.getString(8) %></td><td align="center"><%= rs.getString(9) %></td>
   			<td align="center"><%= rs.getString(10) %></td><td align="center"><%= rs.getString(11) %></td>
      		<td align="center"><input type="submit" name="Delete" value="Delete"></input></td></tr>
      <%}%>
     	</table>
  <%}
} catch(SQLException e) { 
    out.println("SQLException caught: " + e.getMessage()); 
}%>

<%
	
%>
</body>
</html>