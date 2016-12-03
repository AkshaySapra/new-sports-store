<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Updating</title>
 <link href="shift.css" rel="stylesheet">
 <link href="bootstrap.css" rel="stylesheet">
 <link href="main.css" rel="stylesheet">
</head>
<body>
	<%@ include file="header.jsp"%>
	
	<%
	
	String CreditCardNumberTemp = request.getParameter("CreditCardNumber");
	int CreditCardNumber = Integer.parseInt(CreditCardNumberTemp);
	String CreditCardCompany = request.getParameter("CreditCardCompany");
	
	try {	
		getConnection();
		String id = (String) session.getAttribute("authenticatedUser");
		int idInt = Integer.parseInt(id);
		String SQL = "SELECT * FROM PaymentMethod WHERE creditnumber = " + CreditCardNumber;
		PreparedStatement pstmt = con.prepareStatement(SQL);
		ResultSet rst = pstmt.executeQuery();
		if(rst.next()){
			String SQL2 = "UPDATE PaymentMethod SET creditcardcompany = ? WHERE creditnumber = " + CreditCardNumber;
			PreparedStatement pstmt2 = con.prepareStatement(SQL2);
			pstmt2.setString(1,CreditCardCompany);
			pstmt2.executeUpdate();
		}else{
			String SQL3 = "INSERT INTO PaymentMethod (creditnumber, creditcardcompany) VALUES (?,?)";
			PreparedStatement pstmt3 = con.prepareStatement(SQL3);
			pstmt3.setInt(1, CreditCardNumber);
			pstmt3.setString(2,CreditCardCompany);
			pstmt3.executeUpdate();
		}
		
		String SQL4 = "SELECT * FROM HasPaymentMethod WHERE UserID = " + id;
		PreparedStatement pstmt4 = con.prepareStatement(SQL4);
		ResultSet rst4 = pstmt4.executeQuery();
		if(rst4.next()){
			String SQL5 = "UPDATE HasPaymentMethod SET creditnumber = ? WHERE UserID = " + id;
			PreparedStatement pstmt5 = con.prepareStatement(SQL5);
			pstmt5.setInt(1,CreditCardNumber);
			pstmt5.executeUpdate();
		}else{
			String SQL6 = "INSERT INTO HasPaymentMethod (UserID, creditnumber) VALUES (?,?)";
			PreparedStatement pstmt6 = con.prepareStatement(SQL6);
			pstmt6.setInt(1, idInt);
			pstmt6.setInt(2,CreditCardNumber);
			pstmt6.executeUpdate();
		}
		
		out.print("Update Complete");
	
	}catch (SQLException ex) {
		out.println(ex);
	}
	finally {
		if (con != null) try {
		con.close(); 
	}
		catch (SQLException ex) {
		System.err.println("SQLException: " + ex);
		}
	}
	%>
	
<body>

</body>
</html>