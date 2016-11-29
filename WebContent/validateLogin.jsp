<%@page import="java.sql.SQLException"%>
<%@ page language="java" import="java.io.*"%>
<%@ include file="jdbc.jsp"%>

<%
	String authenticatedUser = null;
	session = request.getSession(true);

	try
	{
		authenticatedUser = validateLogin(out,request,session);
	}
	catch(IOException e)
	{	System.err.println(e); }

	if(authenticatedUser != null) {
		response.sendRedirect("login.jsp");	// Successful login
	}
	else {
		response.sendRedirect("login.jsp");		// Failed login - redirect back to login page with a message 
	}
%>


<%!
	String validateLogin(JspWriter out,HttpServletRequest request, HttpSession session) throws IOException
	{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String retStr = null;
		int num = -1;
		if(username == null || password == null)
				return null;
		if((username.length() == 0) || (password.length() == 0))
				return null;
		
		try {
			num = Integer.parseInt(username);
		}
		catch (Exception e)
		{
			return null;
		}
		
		try {

			getConnection();
			String SQL = "SELECT UserID FROM Users WHERE UserID = ? AND password = ?";
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setInt(1, num);
			pstmt.setString(2, password);
			ResultSet rst = pstmt.executeQuery();
			if (!rst.next()) {
				retStr = "";
			}
			else {
				retStr = username;
			}

		}
		catch(Exception e)
		{	out.println(e);}
		finally {
			try
			{
				closeConnection();
			}
			catch (SQLException e)
			{
				out.println("Exception occurred: " + e);
			}
		}

		if(retStr != null)
		{	session.removeAttribute("loginMessage");
			session.setAttribute("authenticatedUser", username);
		}
		else
			session.setAttribute("loginMessage","Username and password combination is incorrect.");

		return retStr;
	}
%>
