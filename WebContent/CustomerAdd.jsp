<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<!DOCTYPE html>
<html>
<head>
<title>New Customer!!!</title>
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



@SuppressWarnings({"unchecked"})
String url ="jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_kneubaue";
String uid = "kneubaue";
String pwd = "34742149";
Connection con = null;
NumberFormat currFormat = NumberFormat.getCurrencyInstance();
try {	
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	con = DriverManager.getConnection(url,uid,pwd);
		
			String SQL2 = "INSERT INTO Users (fname,lname,address,city,province,postalcode,email,password) VALUES (?,?,?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(SQL2, Statement.RETURN_GENERATED_KEYS);			
			pstmt.setString(1,fName);
			pstmt.setString(2,lName);
			pstmt.setString(3,address);
			pstmt.setString(4,city);
			pstmt.setString(5,province);
			pstmt.setString(6,city);
			pstmt.setString(7,email);
			pstmt.setString(8,password);
			pstmt.executeUpdate();
			ResultSet keys = pstmt.getGeneratedKeys();
			keys.next();
			int custId = keys.getInt(1);
			out.println("<h2>Your ID  number is: " + custId + "</h2>");
	
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