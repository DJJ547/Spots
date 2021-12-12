<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Comment and Rate</title>
<link href="css/index.css?v=<%=Math.random()%>" rel="stylesheet">
</head>
<body>
 <div align="center">
  <h1>Review and Rate</h1>
  <form action="spotterReviewSpot" method="post">
   <table style="with: 80%">
    <tr>
     <td>Review: </td>
     <td><input type="text" name="review" placeholder="Enter your review"/></td>
    </tr>
    <tr>
     <td>Rating(from 0 to 10): </td>
     <td><input type="text" name="rating" placeholder="Enter your rating"/></td>
    </tr>
    <tr>
     <td>Suggest Group Size: </td>
     <td><input type="text" name="groupsize" placeholder="Enter group size"/></td>
    </tr>
    <tr>
     <td>Category 1: </td>
     <td><input type="text" name="category1" placeholder="Enter category1"/></td>
    </tr>
    <tr>
     <td>Category 2: </td>
     <td><input type="text" name="category2" placeholder="Enter category2"/></td>
    </tr>
    <tr>
     <td>Category 3: </td>
     <td><input type="text" name="category3" placeholder="Enter category3"/></td>
    </tr>
    <tr>
     <td>Noise Level: </td>
     <td><input type="text" name="noiselevel" placeholder="Enter noiselevel"/></td>
    </tr>
   </table>
   <input type="submit" value="Register" />
  </form>
 </div>
</body>
</html>