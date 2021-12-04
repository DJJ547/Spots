<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%session.invalidate();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
<link href="css/index.css" rel="stylesheet">
</head>
<body>
	<div align="center">
	<h1>Admin Login</h1>
	<form action="adminlogin" method="post">
		<table>
		<tr><td>AdminID: </td><td><input type="number" name="adminID"></td></tr>
		<tr><td>Password: </td><td><input type="password" name="password"></td></tr>
		<tr><td></td><td><input type="submit" value="Login">
		<input type="button" value="Cancel" onclick="window.location='welcomePage.jsp'" ></td></tr>
		</table>
	</form>
	<%
    if(request.getAttribute("loginResult") != null && (boolean)request.getAttribute("loginResult") == false){
	%>
 	<p style="color:red"> Incorrect admin ID or password. Please try again. </p>
	<%
	}
	%>
	</div>
</body>
</html>