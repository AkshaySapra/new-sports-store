
<% 
/* session.removeAttribute("authenticatedUser"); */
session.invalidate();
response.sendRedirect(request.getContextPath() + "/Home.jsp");

%>

