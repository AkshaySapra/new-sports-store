<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="manageAuth.jsp" %>
<%@ include file="jdbc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mikey.ca | Reports</title>
 <link href="shift.css" rel="stylesheet">
 <link href="bootstrap.css" rel="stylesheet">
 <link href="second.css" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp" %>
<%
try {
	getConnection();
	String SQL = "SELECT DISTINCT TOP 5 oid, odate, sdate, UserID, fname, lname, province, TotalAmount,AfterDiscount FROM Report ORDER BY TotalAmount DESC";
	PreparedStatement pstmt = con.prepareStatement(SQL);
	ResultSet rst = pstmt.executeQuery();
	out.println("<h2>5 Largest Orders</h2>");
	out.println("<table><tr><th>Order ID&nbsp;&nbsp;&nbsp;</th><th>Order Date&nbsp;&nbsp;&nbsp;</th><th>Ship Date&nbsp;&nbsp;&nbsp;</th><th>User ID&nbsp;&nbsp;&nbsp;</th><th>Name&nbsp;&nbsp;&nbsp;</th><th>Province&nbsp;&nbsp;&nbsp;</th><th>Total Price&nbsp;&nbsp;&nbsp;</th><th>After Discount&nbsp;&nbsp;&nbsp;</th></tr>");
	while (rst.next()) {
		out.println("<tr><td>" + rst.getString("oid") + "&nbsp;&nbsp;&nbsp;</td><td>" + rst.getString("odate") + "&nbsp;&nbsp;&nbsp;</td><td>" + rst.getString("sdate") + "&nbsp;&nbsp;&nbsp;</td><td>" + rst.getString("UserID") + "&nbsp;&nbsp;&nbsp;</td><td>" + rst.getString("fname") + " " + rst.getString("lname") + "&nbsp;&nbsp;&nbsp;</td><td>"  + rst.getString("province") + "&nbsp;&nbsp;&nbsp;</td><td>" + rst.getString("TotalAmount") + "&nbsp;&nbsp;&nbsp;</td><td>" + rst.getString("AfterDiscount") + "&nbsp;&nbsp;&nbsp;</td><td></tr>");
	}
	out.println("</table><br><br><h2>5 Top Selling Products</h2>");
	SQL = "SELECT TOP 5 pid, pname, SUM(quantity) AS Total FROM Report GROUP BY pid, pname ORDER BY Total DESC";
	pstmt = con.prepareStatement(SQL);
	rst = pstmt.executeQuery();
	out.println("<table><tr><th>Product ID&nbsp;&nbsp;&nbsp;</th><th>Product Name&nbsp;&nbsp;&nbsp;</th><th>Total Sold&nbsp;&nbsp;&nbsp;</th></tr>");
	while (rst.next()) {
		out.println("<tr><td>" + rst.getString("pid") + "&nbsp;&nbsp;&nbsp;</td><td>" + rst.getString("pname") + "&nbsp;&nbsp;&nbsp;</td><td>" + rst.getString("Total") + "&nbsp;&nbsp;&nbsp;</td></tr>");
	}
	out.println("</table><br><br><h2>5 Top Discounts</h2>");
	SQL = "SELECT DISTINCT TOP 5 oid, TotalAmount, AfterDiscount, (TotalAmount - AfterDiscount) AS Difference FROM Report GROUP BY oid, TotalAmount, AfterDiscount ORDER BY Difference DESC";
	pstmt = con.prepareStatement(SQL);
	rst = pstmt.executeQuery();
	out.println("<table><tr><th>Product ID&nbsp;&nbsp;&nbsp;</th><th>Product Name&nbsp;&nbsp;&nbsp;</th><th>Total Sold&nbsp;&nbsp;&nbsp;</th></tr>");
	while (rst.next()) {
		out.println("<tr><td>" + rst.getString("oid") + "&nbsp;&nbsp;&nbsp;</td><td>" + rst.getString("TotalAmount") + "&nbsp;&nbsp;&nbsp;</td><td>" + rst.getString("AfterDiscount") + "&nbsp;&nbsp;&nbsp;</td><td>" + rst.getString("Difference") + "&nbsp;&nbsp;&nbsp;</td></tr>");
	}
	
	
	closeConnection();
}
catch (Exception E) {
	out.println("Exception: " + E);
}

%>

</body>
</html>