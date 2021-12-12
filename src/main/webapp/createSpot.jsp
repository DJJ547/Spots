<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create New Spot Form</title>
<link href="css/index.css?v=<%=Math.random()%>" rel="stylesheet">
</head>
<body>
 <div align="center">
  <h1>Create New Spot Form</h1>
  <form action="createSpot" method="post">
   <table style="with: 80%">
    <tr>
     <td>Spot Name: </td>
     <td><input type="text" name="spotName" placeholder="Enter spot name"/></td>
    </tr>
    <tr>
     <td>Address: </td>
     <td><input type="text" name="address" placeholder="Enter address"/></td>
    </tr>
    <tr>
     <td>City: </td>
     <td><input type="text" name="city" placeholder="Enter city"/></td>
    </tr>
    <tr>
     <td>Zipcode: </td>
     <td><input type="text" name="zipcode" placeholder="Enter zipcode"/></td>
    </tr>
   </table>
   <input type="submit" value="Register" />
  </form>
 </div>
</body>
</html>