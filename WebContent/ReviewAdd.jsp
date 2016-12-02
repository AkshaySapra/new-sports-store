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
<title>Review add!!!</title>
 <link href="shift.css" rel="stylesheet">
 <link href="bootstrap.css" rel="stylesheet">
 <link href="second.css" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp"%>

<% 
// Get customer information
String rating = request.getParameter("rating");
String review = request.getParameter("Review");
String userid = (String)request.getAttribute("authenticatedUser");
String Productid = (String)request.getParameter("pid");




@SuppressWarnings({"unchecked"})
NumberFormat currFormat = NumberFormat.getCurrencyInstance();
try {	
			getConnection();
		int ProdID=Integer.parseInt(Productid);
			String SQL2 = "INSERT INTO ProductReview VALUES (?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(SQL2);			
			pstmt.setInt(1,ProdID);
			pstmt.setInt(2,Integer.parseInt(userid));
			pstmt.setInt(3,Integer.parseInt(rating));
			pstmt.setString(4,review);
			pstmt.executeUpdate();

			out.println("<h2>Your Review has been added! </h2>");
	
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