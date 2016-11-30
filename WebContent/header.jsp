<H1 align="center">
	<font face="cursive" color="#3399FF">Mikey.ca</font>
</H1>
<div class="nav">
	<div class="container">
		<ul class="pull-left">
			<li><a href="Home.jsp">Home</a></li>
			<li><a href="About.jsp">About</a></li>
			<li><a href="listprod.jsp">Shop</a></li>
		</ul>
		<ul class="pull-right">
			<li><a href="#">Sign Up</a></li>
			<%
				String authenticatedUser = (String) session.getAttribute("authenticatedUser");
				out.print("authenticatedUser is: " + authenticatedUser);
				if (authenticatedUser == null || authenticatedUser == "") {
					out.print("<li><a href=\"login.jsp\">Log In</a></li>");
				} else {
					out.print("<li><a href=\"logout.jsp\">Log Out</a></li>");
				}
			%>

		</ul>
	</div>
</div>
<hr>
