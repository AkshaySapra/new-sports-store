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
<title>Updating</title>
 <link href="shift.css" rel="stylesheet">
 <link href="bootstrap.css" rel="stylesheet">
 <link href="second.css" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp"%>

<% 
// Get customer information
String email = request.getParameter("email");
String fName = request.getParameter("fname");
String lName = request.getParameter("lname");
String password = request.getParameter("password");
String address = request.getParameter("adress");
String city = request.getParameter("city");
String province = request.getParameter("province");
String postalcode = request.getParameter("postalcode");



@SuppressWarnings({"unchecked"})
NumberFormat currFormat = NumberFormat.getCurrencyInstance();
try {	
			getConnection();
			String id = (String) session.getAttribute("authenticatedUser");
			String SQL2 = "UPDATE Users SET fname = ?, lname = ?, address = ?, city = ?, province = ?, postalcode = ?, email = ?, password = ? WHERE UserID = " + id;
			PreparedStatement pstmt = con.prepareStatement(SQL2);			
			pstmt.setString(1,fName);
			pstmt.setString(2,lName);
			pstmt.setString(3,address);
			pstmt.setString(4,city);
			pstmt.setString(5,province);
			pstmt.setString(6,postalcode);
			pstmt.setString(7,email);
			pstmt.setString(8,password);
			pstmt.executeUpdate();
			out.print("Update Complete");
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