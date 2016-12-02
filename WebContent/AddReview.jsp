

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="auth.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mikey.ca | Create Account</title>
 <link href="shift.css" rel="stylesheet">
 <link href="bootstrap.css" rel="stylesheet">
 <link href="main.css" rel="stylesheet">
</head>
<body>


<%@ include file="header.jsp"%>
<h1>Enter your review:</h1>
<form method="post" action="insertReview.jsp">
<%
String id = request.getParameter("id");
out.println("<input type=\"hidden\" name=\"pid\" value=\"" + id + "\">");
%>
<h2>Rating (1-5):</h2>
<input type="number" name="rating" min="1" max="5">
<br>
<h2>Review:</h2>
<input type="text" name="Review" size="50">
<br><br>
<input type="submit" value="Submit"><input type="reset" value="Reset">
</form>


</body>
</html>