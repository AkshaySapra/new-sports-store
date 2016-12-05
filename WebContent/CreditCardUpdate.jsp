<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp"%>
<%@ include file="auth.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Mikey.ca | Updating Credit Card Information</title>
 <link href="shift.css" rel="stylesheet">
 <link href="bootstrap.css" rel="stylesheet">
 <link href="main.css" rel="stylesheet">
</head>
<body>
	<%@ include file="header.jsp"%>
	
	<%
	
	String CreditCardNumberTemp = request.getParameter("CreditCardNumber");
	long CreditCardNumber = Long.parseLong(CreditCardNumberTemp);
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
			pstmt3.setLong(1, CreditCardNumber);
			pstmt3.setString(2,CreditCardCompany);
			pstmt3.executeUpdate();
		}
		
		String SQL4 = "SELECT * FROM HasPaymentMethod WHERE UserID = " + id;
		PreparedStatement pstmt4 = con.prepareStatement(SQL4);
		ResultSet rst4 = pstmt4.executeQuery();
		if(rst4.next()){
			String SQL5 = "UPDATE HasPaymentMethod SET creditnumber = ? WHERE UserID = " + id;
			PreparedStatement pstmt5 = con.prepareStatement(SQL5);
			pstmt5.setLong(1,CreditCardNumber);
			pstmt5.executeUpdate();
		}else{
			String SQL6 = "INSERT INTO HasPaymentMethod (UserID, creditnumber) VALUES (?,?)";
			PreparedStatement pstmt6 = con.prepareStatement(SQL6);
			pstmt6.setInt(1, idInt);
			pstmt6.setLong(2,CreditCardNumber);
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