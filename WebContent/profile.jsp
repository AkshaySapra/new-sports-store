<%@ page import="java.sql.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp"%>

<html>
<head>
<title>Mikey.ca | Profile</title>
 <link href="shift.css" rel="stylesheet">
 <link href="bootstrap.css" rel="stylesheet">
 <link href="second.css" rel="stylesheet">
</head>
<body>
 <%@ include file="header.jsp"%>
 <a href="Update.jsp">Update Information</a><br><br>
 <a href="AddCreditCard.jsp">Change Credit Card Information</a><br><br>
 <a href="DeleteAccount.jsp">Delete Account</a>
 <a href="ViewOrder.jsp">View Orders</a>
</body>
</html>