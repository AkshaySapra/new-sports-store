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
			authenticatedUser = (String) session.getAttribute("authenticatedUser");
			if (authenticatedUser == null || authenticatedUser.equals("")) {
				out.print("You are not logged in properly.");
				response.sendRedirect("login.jsp");
			}

			else {
				try {
					getConnection();
					String sql = "SELECT fname, lname FROM Users WHERE UserID = ?";
					int num = -1;
					try {
						num = Integer.parseInt(authenticatedUser);
					}
					catch (Exception e) {}
					if (num != -1) {
						PreparedStatement pstmt = con.prepareStatement(sql);
						pstmt.setInt(1,num);
						ResultSet rst = pstmt.executeQuery();
						if (rst.next())
							out.println("You are logged in as " + rst.getString("fname") + " " + rst.getString("lname"));
					}
					closeConnection();
				}
				catch (SQLException e) {
					out.println(e);
				}
			}
			out.println("<br>\n Select your shipping option below:");
		%>

	<form method="post" action="order.jsp">
	<table>
	<th>Shipping Method</th><th>Discount</th>
		<%
			String sql = "SELECT TypeName, TypeID, discount FROM ShippingOption;";
			/* 		out.print("<form action=\"post\" action=\"order.jsp\">"); */
			StringBuilder shipOptionBuilder = new StringBuilder("");
			try {
				getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rst = pstmt.executeQuery();
				while (rst.next()) {
					out.println("<tr><td><input type=\"radio\" name=\"TypeID\" value=\"" + rst.getString("TypeID") + "\">"
							+ rst.getString("TypeName") + "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td><td>%" + rst.getString("discount") + "</td></tr>");
				}
				out.println("</table");
				out.println("<br><br>");
				out.println("<input type=\"submit\" value=\"Submit\">");
				/* 		out.print("</form>"); */

				closeConnection();
			} catch (SQLException ex) {
				out.println(ex);
			}
		%>
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

