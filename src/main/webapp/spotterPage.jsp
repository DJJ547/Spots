<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.dai.database.SpotsDatabase"%>
<!DOCTYPE html>
<html>
  <head>
  <title >Spotter Search Page</title>
  <link href="css/index.css" rel="stylesheet">
  </head>
  <body>
  <%
  request.getSession();
  String email = (String)session.getAttribute("email");
  String firstName = (String)session.getAttribute("firstName");
  %>
  <%out.println(email); %>
  <h1 align="center">Welcome! Spotter: <%out.println(firstName); %></h1><br/>
  <form id="form" method="post" action="spottersearch">
  <label>Search by Spots Name</label>
  <input type="text" name="name" id="name" placeholder="Enter name keyword"/>
  <input type="submit" value="Search">
  </form>
  <input type="button" value="Logout" onclick="window.location='welcomePage.jsp'" ><br/><br/>
<%     
try {   
   SpotsDatabase spot = new SpotsDatabase();
   Connection con = spot.getCon();
   PreparedStatement pst;
   ResultSet rs;
            String name = request.getParameter("name");
            if(name == null){
            	pst = con.prepareStatement("select spot_id, name, address, city, zipcode, group_size, category_1, category_2, category_3, noise_level, creation_date from spots");
            	rs = pst.executeQuery();
            	%>
            	<table border="1">
            	<tr><th>Spot ID</th><th>Name</th><th>Address</th><th>City</th><th>Zip Code</th>
            	<th>Group Size</th><th>Category1</th><th>Category2</th><th>Category3</th>
            	<th>Noise Level</th><th>Creation date</th>
            	<%
            	while(rs.next()){
            	%>
            		<tr><td align="center"><%= rs.getString(1) %></td><td align="center"><a href="spotDetailPage.jsp?spotID=<%=rs.getString(1)%>&name=<%=rs.getString(2)%>"><%= rs.getString(2) %></a></td><td align="center"><%= rs.getString(3) %></td>
            		<td align="center"><%= rs.getString(4) %></td><td align="center"><%= rs.getString(5) %></td><td align="center"><%= rs.getString(6) %></td>
            		<td align="center"><%= rs.getString(7) %></td><td align="center"><%= rs.getString(8) %></td><td align="center"><%= rs.getString(9) %></td>
            		<td align="center"><%= rs.getString(10) %></td><td align="center"><%= rs.getString(11) %></td></tr>
              		<%
              	}
              	%>
              </table>
            <%}else{
            	pst = con.prepareStatement("select spot_id, name, address, city, zipcode, group_size, category_1, category_2, category_3, noise_level, creation_date from spots where name like ?");
                pst.setString(1, "%" + name + "%");
                rs = pst.executeQuery();%>
                <table border="1">
            	<tr><th>Spot ID</th><th>Name</th><th>Address</th><th>City</th><th>Zip Code</th>
            	<th>Group Size</th><th>Category1</th><th>Category2</th><th>Category3</th>
            	<th>Noise Level</th><th>Creation date</th>
            	<%
            	while(rs.next()){
            	%>
            		<tr><td align="center"><%= rs.getString(1) %></td><td align="center"><%= rs.getString(2) %></td><td align="center"><%= rs.getString(3) %></td>
            		<td align="center"><%= rs.getString(4) %></td><td align="center"><%= rs.getString(5) %></td><td align="center"><%= rs.getString(6) %></td>
            		<td align="center"><%= rs.getString(7) %></td><td align="center"><%= rs.getString(8) %></td><td align="center"><%= rs.getString(9) %></td>
            		<td align="center"><%= rs.getString(10) %></td><td align="center"><%= rs.getString(11) %></td></tr>
              <%}
            }
            %></table>
    <%
    } catch(SQLException e) { 
           out.println("SQLException caught: " + e.getMessage()); 
    }%>
</body>
</html>