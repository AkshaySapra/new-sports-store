<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ include file="jdbc.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Mikey.ca login</title>
 <link href="shift.css" rel="stylesheet">
 <link href="bootstrap.css" rel="stylesheet">
 <link href="second.css" rel="stylesheet">
</head>
<body>

<%@ include file="header.jsp"%>

<%
@SuppressWarnings({"unchecked"})
/* String authenticatedUser = (String) session.getAttribute("authenticatedUser"); */
String loginMessage = (String) session.getAttribute("loginMessage");

		if (loginMessage!=null)
			out.println(loginMessage);
		if (authenticatedUser == null || authenticatedUser.equals(""))
		{
		out.println("<h2>Enter your user id and password:</h2>");

		out.println("<form method=\"post\" action=\"validateLogin.jsp\">");
		out.println("<table>");
		out.println("	<tr>");
		out.println("		<td>User ID:</td>");
		out.println("		<td><input type=\"text\" name=\"username\" size=\"20\"></td>");
		out.println("	</tr>");
		out.println("	<tr>");
		out.println("		<td>Password:&nbsp;&nbsp;</td>");
		out.println("		<td><input type=\"password\" name=\"password\" size=\"20\"></td>");
		out.println("	</tr>");
		out.println("	<tr>");
		out.println("		<td><input type=\"submit\" value=\"Submit\"></td>");
		out.println("		<td><input type=\"reset\" value=\"Reset\"></td>");
		out.println("	</tr>");
		out.println("</table>");
		out.println("</form>");
		}
		else
		{
			getConnection();
			String SQL = "SELECT fname, lname FROM Users WHERE UserID = ?";
			PreparedStatement pstmt = con.prepareStatement(SQL);
			int num = -1;
			try 
			{
				num = Integer.parseInt(authenticatedUser);
			}
			catch (Exception e)
			{
				session.setAttribute("authenticatedUser", null);
			}
			if (num != -1)
			pstmt.setInt(1, num);
			ResultSet rst = pstmt.executeQuery();
			if (rst.next()) {
				out.println("You are currently logged in as " + rst.getString("fname") + " " + rst.getString("lname"));
			}else
				out.println("Login Failed");
		}
closeConnection();
		
%>
</body>
</html>