<%@ include file="jdbc.jsp"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="manageAuth.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mikey.ca | Manage</title>
 <link href="shift.css" rel="stylesheet">
 <link href="bootstrap.css" rel="stylesheet">
 <link href="second.css" rel="stylesheet">
</head>
<body>

<%@ include file="header.jsp" %>

<% 
try               
{
	getConnection();
	PreparedStatement pstmt = con.prepareStatement("SELECT * FROM stores");
 	ResultSet rst = pstmt.executeQuery();
        while (rst.next()) 
        {
        	if (rst.getInt(3)<50)
		out.println("<br>NOTICE: Inventory for "+rst.getString(1)+", product number "+rst.getString(2)+" is low");
        }
}
catch (SQLException ex)
{       out.println(ex);
}

%>
<h2><a href="productManage.jsp">Manage Current Products</a></h2>


<h2><a href="resetData.jsp">Reset Data to Original</a></h2>

<h2><a href="report.jsp">View Reports</a></h2>

</body>
</html>