<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.dai.database.SpotsDatabase"%>
<!DOCTYPE html>
<html>
<head>
<title >Spot Detail Page</title>
<link href="css/index.css?v=<%=Math.random()%>" rel="stylesheet">
</head>

  <input type="button" value="Back to Spotter Main Page" onclick="window.location='spotterPage.jsp'" ><br/><br/>
  <body>
  <%
  String id = request.getParameter("spotID");
  String name = request.getParameter("name");
  %>
  <h1 align="center"><%=name%></h1><br/>
  <p style="text-align:center;"><img src="images/<%=name%>.jpg" alt=<%=name%> width="600" height="400"></p><br/>
<%     
try {   
   	SpotsDatabase spot = new SpotsDatabase();
   	Connection con = spot.getCon();
   	PreparedStatement pst1;
   	PreparedStatement pst2;
   	ResultSet rs1;
   	ResultSet rs2;
        
    pst1 = con.prepareStatement("select address, city, zipcode, group_size, category_1, category_2, category_3, noise_level, creation_date, description from spots where spot_id = ?");
    pst1.setString(1, id);
    rs1 = pst1.executeQuery();
    
    pst2 = con.prepareStatement("select cast(avg(rating) as decimal(10, 2)) from rate where spot_id = ?");
    pst2.setString(1, id);
    rs2 = pst2.executeQuery();
%>
	<h1 align="center">Details:</h1><br/>
    <table align="center" border="1">
    <tr><th>Address</th><th>City</th><th>Zip Code</th><th>Group Size</th><th>Category 1</th><th>Category 2</th>
    <th>Category 3</th><th>Noise Level</th><th>Creation Date</th><th>Average Rating</th>
<%
    while(rs1.next() && rs2.next()){
%>
    	<tr><td align="center"><%= rs1.getString(1) %></td><td align="center"><%= rs1.getString(2) %></td><td align="center"><%= rs1.getString(3) %></td>
    	<td align="center"><%= rs1.getString(4) %></td><td align="center"><%= rs1.getString(5) %></td><td align="center"><%= rs1.getString(6) %></td>
    	<td align="center"><%= rs1.getString(7) %></td><td align="center"><%= rs1.getString(8) %></td><td align="center"><%= rs1.getString(9) %></td>
    	<td align="center"><%= rs2.getString(1) %></td></tr>
  <%}%>
  </table>
  	<%
    if(rs1.next()){
    %>
    	<p>
    	<%
        out.println(rs1.getString(5)); //spot description
        %>
        </p><br/><br/>
        <%
    }    
} catch(SQLException e) { 
    out.println("SQLException caught: " + e.getMessage()); 
}%>


<div class="comment">
<h1 align="center">Reviews:</h1><br/>
<%     
try {   
   	SpotsDatabase spot = new SpotsDatabase();
   	Connection con = spot.getCon();
   	PreparedStatement pst;
   	ResultSet rs;
    pst = con.prepareStatement("select spotter.first_name, comments.comment_text, leaves.time_stamp from comments inner join has on comments.comment_id = has.comment_id and has.spot_id = ? inner join leaves on leaves.comment_id = comments.comment_id inner join spotter on leaves.spotter_email = spotter.spotter_email");
    pst.setString(1,id);
    rs = pst.executeQuery();
%>
    <table border="1">
    <tr><th>Spotter Name</th><th>Text</th>
<%
    while(rs.next()){
%>
    	<tr><td align="center"><%= rs.getString(1) %></td><td align="center"><%= rs.getString(2) %></td></tr>
  <%}%>
  </table>
<%
} catch(SQLException e) { 
    out.println("SQLException caught: " + e.getMessage()); 
}%>
</div>
</body>
</html>