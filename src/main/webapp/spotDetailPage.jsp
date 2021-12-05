<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.dai.database.SpotsDatabase"%>
<!DOCTYPE html>
<html>
  <head>
  <title >Spot Detail Page</title>
  <link href="css/index.css" rel="stylesheet">
  </head>
  <input type="button" value="Back to Spotter Main Page" onclick="window.location='spotterPage.jsp'" ><br/><br/>
  <body>
  <%
  String id = request.getParameter("spotID");
  String name = request.getParameter("name");
  %>
  <h1 align="center"><%=name%></h1><br/>
  <p style="text-align:center;"><img src="images/<%=name%>.jpg" alt=<%=name%> width="600" height="400"></p><br/><br/>
  <%     
try {   
   SpotsDatabase spot = new SpotsDatabase();
   Connection con = spot.getCon();
   PreparedStatement pst;
   ResultSet rs;
        
        pst = con.prepareStatement("select name, address, city, zipcode, description from spots where spot_id = ?");
        pst.setString(1, id);
        rs = pst.executeQuery();
        if(rs.next()){
        	out.println(rs.getString(5)); //spot description
        }    
    } catch(SQLException e) { 
        out.println("SQLException caught: " + e.getMessage()); 
    }%>
    <div class="comment">
    	<h1 align="center">Comment Section:</h1><br/>
    	<%     
		try {   
   			SpotsDatabase spot = new SpotsDatabase();
   			Connection con = spot.getCon();
   			PreparedStatement pst;
   			ResultSet rs;
      		pst = con.prepareStatement("select comments.comment_id, comment_text, time_stamp from comments inner join has on comments.comment_id = has.comment_id and has.spot_id = ?");
      		pst.setString(1,id);
      		rs = pst.executeQuery();
			%>
      		<table border="1" class="center">
      		<tr><th>comment ID</th><th>Text</th><th>Time Stamp</th>
      		<%
      		while(rs.next()){
      		%>
          		<tr><td align="center"><%= rs.getString(1) %></td><td align="center"><%= rs.getString(2) %></td><td align="center"><%= rs.getString(3) %></td></tr>
      	  <%}%>
      		</table>
		<%
		} catch(SQLException e) { 
    		out.println("SQLException caught: " + e.getMessage()); 
		}%>
    </div>
</body>
</html>