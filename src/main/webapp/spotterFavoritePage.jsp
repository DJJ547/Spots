<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.dai.database.SpotsDatabase"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spotter Favorite Page</title>
<link href="css/index.css?v=<%=Math.random()%>" rel="stylesheet">
</head>
<body>
<form id="form" method="post" action="spotterfavoritesearch">
<label>Search by Spots Name</label>
<input type="text" name="name" id="name" placeholder="Enter name keyword"/>
<input type="submit" value="Search">
<input type="button" value="Back to Spotter Main Page" onclick="window.location='spotterPage.jsp'" ><br/><br/>
</form>
<%
request.getSession();
String email = (String)session.getAttribute("email");
try {   
   	SpotsDatabase spot = new SpotsDatabase();
  	Connection con = spot.getCon();
   	PreparedStatement pst;
   	ResultSet rs;
            String name = request.getParameter("name");
            if(name == null){
            	pst = con.prepareStatement("select spot_id, name, address, city, zipcode, group_size, category_1, category_2, category_3, noise_level, creation_date from spots where spot_id in (select spot_id from favorite where spotter_email = ?)");
            	pst.setString(1, email);
            	rs = pst.executeQuery();
            	%>
            	<table border="1">
            	<tr><th>Unfavorite</th><th>Spot ID</th><th>Name</th><th>Address</th><th>City</th><th>Zip Code</th>
            	<th>Group Size</th><th>Category1</th><th>Category2</th><th>Category3</th>
            	<th>Noise Level</th><th>Creation date</th>
            	<%
            	while(rs.next()){
            	%>
            		<tr><td align="center"><form id="form" method="post" action="removefavorite"><button type="submit" name="getSpotID" value="<%=rs.getString(1)%>">Unfavorite</button></form></td><td align="center"><%= rs.getString(1) %></td>
            		<td align="center"><a href="spotDetailPage.jsp?spotID=<%=rs.getString(1)%>&name=<%=rs.getString(2)%>"><%= rs.getString(2) %></a></td><td align="center"><%= rs.getString(3) %></td>
            		<td align="center"><%= rs.getString(4) %></td><td align="center"><%= rs.getString(5) %></td><td align="center"><%= rs.getString(6) %></td>
            		<td align="center"><%= rs.getString(7) %></td><td align="center"><%= rs.getString(8) %></td><td align="center"><%= rs.getString(9) %></td>
            		<td align="center"><%= rs.getString(10) %></td><td align="center"><%= rs.getString(11) %></td></tr>
              	<%
              	}
              	%>
              </table>
            <%}else{
            	pst = con.prepareStatement("select spot_id, name, address, city, zipcode, group_size, category_1, category_2, category_3, noise_level, creation_date from spots where name like ? and spot_id in (select spot_id from favorite where spotter_email = ?)");
            	pst.setString(1, "%" + name + "%");
            	pst.setString(2, email);
                rs = pst.executeQuery();%>
                <table border="1">
            	<tr><th>Unfavorite</th><th>Spot ID</th><th>Name</th><th>Address</th><th>City</th><th>Zip Code</th>
            	<th>Group Size</th><th>Category1</th><th>Category2</th><th>Category3</th>
            	<th>Noise Level</th><th>Creation date</th>
            	<%
            	while(rs.next()){
            	%>
            		<tr><td align="center"><form id="form" method="post" action="removefavorite"><button type="submit" name="getSpotID" value="<%=rs.getString(1)%>">Unfavorite</button></form></td><td align="center"><%= rs.getString(1) %></td>
            		<td align="center"><a href="spotDetailPage.jsp?spotID=<%=rs.getString(1)%>&name=<%=rs.getString(2)%>"><%= rs.getString(2) %></a></td><td align="center"><%= rs.getString(3) %></td>
            		<td align="center"><%= rs.getString(4) %></td><td align="center"><%= rs.getString(5) %></td><td align="center"><%= rs.getString(6) %></td>
            		<td align="center"><%= rs.getString(7) %></td><td align="center"><%= rs.getString(8) %></td><td align="center"><%= rs.getString(9) %></td>
            		<td align="center"><%= rs.getString(10) %></td><td align="center"><%= rs.getString(11) %></td></tr>
              	<%
              	}
            }
            %></table>
    <%
    } catch(SQLException e) { 
           out.println("SQLException caught: " + e.getMessage()); 
    }%>
</body>
</html>