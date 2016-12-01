<%@ include file="auth.jsp" %>
<%
String GROUP = (String) session.getAttribute("groupID");
int num = -1;
try {
	num = Integer.parseInt(GROUP);
	if (num != 1)
		response.sendRedirect("Home.jsp");
}
catch (Exception E) {
	session.setAttribute("authenticatedUser", null);
	response.sendRedirect("login.jsp");
}
%>