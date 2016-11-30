<%@ page import="java.sql.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.text.NumberFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp"%>

<html>
<head>
<title>Ray's Grocery</title>
</head>
<body>

	<h1>Enter your customer id and password to complete the
		transaction:</h1>

	<%
		out.print("Welcome to Mikey");
		String authenticatedUser = (String) session.getAttribute("authenticatedUser");
		if (authenticatedUser == null || authenticatedUser == "") {
			out.print("You are not logged in properly.");
			response.sendRedirect("login.jsp");
		}

		else {
			out.print("You are logged in as " + authenticatedUser);
		}

		String sql = "SELECT TypeName FROM ShippingOption;";
		out.print("<form action=\"post\">");
		StringBuilder shipOptionBuilder = new StringBuilder("");
		try {
			getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rst = pstmt.executeQuery();
			while(rst.next()){
				  out.print("<input type=\"radio\" name=\"TypeName\" value=\"" + rst.getString(1) + "\">" + rst.getString(1) + "<br>");
			}
			out.print("</form>");
				
			closeConnection();
		} catch (SQLException ex) {
			out.println(ex);
		}
		
		
		
	%>
	<form method="post" action="order.jsp">
		<td><input type="submit" value="Submit"></td>
	</form>
	<!-- <form method="post" action="order.jsp">
		<table>
			<tr>
				<td>Customer ID:</td>
				<td><input type="text" name="customerId" size="20"></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password" size="20"></td>
			</tr>
			<tr>
				<td><input type="submit" value="Submit"></td>
				<td><input type="reset" value="Reset"></td>
			</tr>
		</table>
	</form> -->

</body>
</html>

