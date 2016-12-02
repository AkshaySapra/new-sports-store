<%@ include file ="manageAuth.jsp"%>
<%@ include file ="jdbc.jsp"%>

<%
	try {
		getConnection();
		PreparedStatement pstmt = con.prepareStatement("INSERT INTO Product (pname) VALUES ('NewProduct')");
		pstmt.execute();
		closeConnection();
		response.sendRedirect("productManage.jsp");
	}
	catch (Exception E) {
		response.sendRedirect("productManage.jsp");
	}
%>
