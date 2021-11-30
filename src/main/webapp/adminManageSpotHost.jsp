<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Manage Spot Host Page</title>
</head>
<body>
<%
String id = (String)session.getAttribute("adminID");
String firstName = (String)session.getAttribute("firstName");
%>
<h1 align="center">Welcome! Admin #<%out.println(id); %>: <%out.println(firstName); %></h1>
<form id="form" method="post" action="adminSearchSpotHost">
<label>Search by Spot Host Name: </label>
<input type="text" name="spotHostName" class="form-control" id="spotHostName" placeholder="Enter name keyword">
<Button class="btn btn-success" style="width: 80px;">Search</Button>
</form>
<form id="form" method="post" action="adminManageSpotHost">
<input type="button" value="Manage Spots" onclick="window.location='adminManageSpots.jsp'" >
<input type="button" value="Logout" onclick="window.location='welcomePage.jsp'" ><br/><br/>
</form>
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
   String name = request.getParameter("spotHostName");
   if(name == null){
      	pst = con.prepareStatement("select host_email, first_name, last_name from spothost");
      	rs = pst.executeQuery();
%>
      	<table border="1">
      	<tr><th>Spot Host Email</th><th>First Name</th><th>Last Name</th>
      	<%
      	while(rs.next()){
      	%>
          	<tr><td align="center"><%= rs.getString(1) %></td><td align="center"><%= rs.getString(2) %></td><td align="center"><%= rs.getString(3) %></td>
      		<td align="center"><input type="button" name="Delete" value="Delete"></input></td>
      <%}%>
      </table>
<%
   } else{
       	pst = con.prepareStatement("select host_email, first_name, last_name from spothost where first_name like ? or last_name like ?");
       	pst.setString(1, "%" + name + "%");
       	pst.setString(2, "%" + name + "%");
       	rs = pst.executeQuery();
%>
       	<table border="1">
       	<tr><th>Spot Host Email</th><th>First Name</th><th>Last Name</th>
       	<%
       	while(rs.next()){
       	%>
       		<tr><td align="center"><%= rs.getString(1) %></td><td align="center"><%= rs.getString(2) %></td><td align="center"><%= rs.getString(3) %></td>
      		<td align="center"><input type="button" name="Delete" value="Delete"></input></td>
      <%}%>
      	</table>
  <%}
} catch(SQLException e) { 
    out.println("SQLException caught: " + e.getMessage()); 
}%>
</body>
</html>