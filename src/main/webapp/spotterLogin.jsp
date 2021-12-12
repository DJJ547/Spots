<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%session.invalidate();%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spotter Login</title>
<link href="css/index.css?v=<%=Math.random()%>" rel="stylesheet">
</head>
<body>
	<div align="center">
	<h1>Spotter Login</h1>
	<form action="spotterlogin" method="post">
		<table>
		<tr><td>Email: </td><td><input type="text" name="email"></td></tr>
		<tr><td>Password: </td><td><input type="password" name="password"></td></tr>
		<tr><td></td><td><input type="submit" value="Login">
		<input type="button" value="Cancel" onclick="window.location='welcomePage.jsp'" >
		<input type="button" value="Sign Up" onclick="window.location='spotterRegister.jsp'" ></td></tr>
		</table>
	</form>
	<%
    if(request.getAttribute("loginResult") != null && (boolean)request.getAttribute("loginResult") == false){
	%>
 	<p style="color:red"> Incorrect email or password. Please try again. </p>
	<%
	}
	%>
	</div>
</body>
</html>