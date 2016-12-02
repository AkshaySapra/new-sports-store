<%@ page import="java.sql.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp"%>

<html>
<head>
<title>Checkout</title>
 <link href="shift.css" rel="stylesheet">
 <link href="bootstrap.css" rel="stylesheet">
 <link href="second.css" rel="stylesheet">
</head>
<body>
	<%@ include file="header.jsp"%>

	<%
	 
	 getConnection();
	 String SQL = "DELETE FROM Users WHERE UserId = ?";
	 try{
		 String id = (String) session.getAttribute("authenticatedUser");
		 PreparedStatement pstmt = con.prepareStatement(SQL);
		 int num = Integer.parseInt(id);
		 if (num != -1){
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				out.print("Account Successfully Deleted");
				request.getSession().invalidate(); 
				response.sendRedirect("Home.jsp");
		 }else{
			 out.println("An issue was encountered when attempting to delete your account");
		 }
	 }catch(Exception E){
		 out.println("Error: " + E);
	 }
	%>
</body>
</html>