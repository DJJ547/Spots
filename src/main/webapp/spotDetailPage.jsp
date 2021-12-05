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
  <h1 align="center">Spot ID: <%=id%></h1><br/>
  <img src="images/<%=name%>.jpg" alt=<%=name%> width="600" height="400">
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
        	out.println("Spot Description: " + rs.getString(5));
        }    
    } catch(SQLException e) { 
        out.println("SQLException caught: " + e.getMessage()); 
    }%>
</body>
</html>