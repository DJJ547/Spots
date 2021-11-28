<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
  <head>
  <title >Spotter Search Page</title>
  </head>
  <body>
  <% String email = (String)session.getAttribute("email");%>
  
  <h1 align="center">Welcome! Spotter: <%out.println(email); %></h1>
  <form id="form" method="post" action="spottersearch">
  <label>Search by Spots Name</label>
  <input type="text" name="name" class="form-control" id="name" placeholder="Enter name keyword">
  <Button class="btn btn-success" style="width: 80px;">Search</Button>
  <input type="button" value="Logout" onclick="window.location='welcomePage.jsp'" ><br/><br/>
  </form>
  <%
   String db = "spots";
   String user = "root";
   String password = "Djj@19950420";
      
	try {   
            java.sql.Connection con; 
            PreparedStatement pst;
            ResultSet rs;
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db+"?allowPublicKeyRetrieval=true&useSSL=false",user, password);
            String name = request.getParameter("name");
            if(name == null){
            	pst = con.prepareStatement("select * from spots");
            	rs = pst.executeQuery();
            	%>
            	<table border="1" align="center">
            	<tr><th>Spot ID</th><th>Name</th><th>Address</th><th>City</th><th>Zip Code</th>
            	<th>Group Size</th><th>Category1</th><th>Category2</th><th>Category3</th>
            	<th>Noise Level</th><th>Creation date</th>
            	<%
            	while(rs.next()){
            	%>
            		<tr><td align="center"><%= rs.getString(1) %></td><td align="center"><%= rs.getString(2) %></td><td align="center"><%= rs.getString(3) %></td>
            		<td align="center"><%= rs.getString(4) %></td><td align="center"><%= rs.getString(5) %></td><td align="center"><%= rs.getString(6) %></td>
            		<td align="center"><%= rs.getString(7) %></td><td align="center"><%= rs.getString(8) %></td><td align="center"><%= rs.getString(9) %></td>
            		<td align="center"><%= rs.getString(10) %></td><td align="center"><%= rs.getString(11) %></td>
              <%}%>
              </table>
            <%}else{
            	pst = con.prepareStatement("select * from spots where name like ?");
                pst.setString(1, "%" + name + "%");
                rs = pst.executeQuery();%>
                <table border="1" align="center">
            	<tr><th>Spot ID</th><th>Name</th><th>Address</th><th>City</th><th>Zip Code</th>
            	<th>Group Size</th><th>Category1</th><th>Category2</th><th>Category3</th>
            	<th>Noise Level</th><th>Creation date</th>
            	<%
            	while(rs.next()){
            	%>
            		<tr><td align="center"><%= rs.getString(1) %></td><td align="center"><%= rs.getString(2) %></td><td align="center"><%= rs.getString(3) %></td>
            		<td align="center"><%= rs.getString(4) %></td><td align="center"><%= rs.getString(5) %></td><td align="center"><%= rs.getString(6) %></td>
            		<td align="center"><%= rs.getString(7) %></td><td align="center"><%= rs.getString(8) %></td><td align="center"><%= rs.getString(9) %></td>
            		<td align="center"><%= rs.getString(10) %></td><td align="center"><%= rs.getString(11) %></td>
              <%}%>
              </table>
            <%}
    } catch(SQLException e) { 
           out.println("SQLException caught: " + e.getMessage()); 
    }%>
</body>
</html>