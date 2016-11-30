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
	%>

<form method="post" action="order.jsp"><td><input type="submit" value="Submit"></td></form>
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

