<%@ include file="manageAuth.jsp" %>
<%@ include file="jdbc.jsp" %>
<% 

String pid = request.getParameter("pid");
String pname = request.getParameter("pname");
String catName = request.getParameter("catName");
String price = request.getParameter("price");
String currentlySelling = request.getParameter("currentlySelling");
String Ainventory = request.getParameter("Ainventory");
String Binventory = request.getParameter("Binventory");

if (pid == null || pid.equals("") || pname == null || pname.equals("") || catName == null || catName.equals("") || price == null || price.equals("") || currentlySelling == null || currentlySelling.equals("") || Ainventory == null || Ainventory.equals("") || Binventory == null || Binventory.equals(""))
	response.sendRedirect("productManage.jsp");

try {
	int pidnum = Integer.parseInt(pid);
	int Ainv = Integer.parseInt(Ainventory);
	int Binv = Integer.parseInt(Binventory);
	int sell;
	if (currentlySelling.equals("true"))
		sell = 1;
	else if (currentlySelling.equals("false"))
		sell = 0;
	else throw new Exception();
	
	
	
}
catch (Exception E) {
	response.sendRedirect("productManage.jsp");
}

%>