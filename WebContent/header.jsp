<H1 align="center">
	<font face="cursive" color="#3399FF">Mikey.ca</font>
</H1>
<div class="nav">
	<div class="container">
		<ul class="pull-left">
			<li><a href="Home.jsp">Home</a></li>
			<li><a href="About.jsp">About</a></li>
			<li><a href="listprod.jsp">List Products</a></li>
			<li><a href="categories.jsp">Choose Category</a></li>
		</ul>
		<ul class="pull-right">
			<li><a href="showcart.jsp">View Cart</a></li>
			<li><a href="createAccount.jsp">Sign Up</a></li>
			<%
				String authenticatedUser = (String) session.getAttribute("authenticatedUser");
				String groupID = (String) session.getAttribute("groupID");

				if (authenticatedUser == null || authenticatedUser.equals("")) {
					out.print("<li><a href=\"login.jsp\">Log In</a></li>");
				} else {
					if (groupID != null)
						out.print("<li><a href=\"profile.jsp\">Profile</a></li>");
					if (groupID != null && groupID.equals("1"))
						out.print("<li><a href=\"manage.jsp\">Manage</a></li>");
					out.print("<li><a href=\"destroySession.jsp\">Log Out</a></li>");
				}
				
			%>
			

		</ul>
	</div>
</div>
<hr>
