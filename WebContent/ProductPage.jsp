<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>View Product</title>
 <link href="shift.css" rel="stylesheet">
 <link href="bootstrap.css" rel="stylesheet">
 <link href="second.css" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp"%>

<% 
// Get customer information

String id = request.getParameter("id");
String name = request.getParameter("name");
out.println("<h2 align=\"center\" style=\"color:blue;\">Product: " + name + "</h2>");

@SuppressWarnings({"unchecked"})
NumberFormat currFormat = NumberFormat.getCurrencyInstance();
try {	
			getConnection();
		
			String SQL2 = "SELECT pid FROM Product";

			//keys.next();
			//int custId = keys.getInt(1);
			//out.println("<h2>Your ID  number is: " + custId + "</h2>");
	
		}
	

catch (SQLException ex) {
	out.println(ex);
}
finally {
	if (con != null) try {
		con.close(); 
	}
	catch (SQLException ex) {
		System.err.println("SQLException: " + ex);
	}
}
%>
</BODY>
</HTML>