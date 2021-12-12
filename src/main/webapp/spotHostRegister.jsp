<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Spot Host Register Form</title>
<link href="css/index.css?v=<%=Math.random()%>" rel="stylesheet">
</head>
<body>
 <div align="center">
  <h1>Spot Host Register Form</h1>
  <form action="spotHostRegister" method="post">
   <table style="with: 80%">
    <tr>
     <td>First Name: </td>
     <td><input type="text" name="firstName" placeholder="Enter your first name"/></td>
    </tr>
    <tr>
     <td>Last Name: </td>
     <td><input type="text" name="lastName" placeholder="Enter your last name"/></td>
    </tr>
    <tr>
     <td>Spot Host Email: </td>
     <td><input type="text" name="spotterEmail" placeholder="Enter your spot host email"/></td>
    </tr>
    <tr>
     <td>Password: </td>
     <td><input type="password" name="password" placeholder="Enter your password"/></td>
    </tr>
   </table>
   <input type="submit" value="Register" />
  </form>
 </div>
</body>
</html>