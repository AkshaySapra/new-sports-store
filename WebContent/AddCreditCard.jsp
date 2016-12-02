<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp"%>

<html>
<head>
<title>Checkout</title>
 <link href="shift.css" rel="stylesheet">
 <link href="bootstrap.css" rel="stylesheet">
 <link href="main.css" rel="stylesheet">
</head>
<body>
  <%@ include file="header.jsp"%>
  
  <%
  	String id = (String) session.getAttribute("authenticatedUser");
  	String SQL = "SELECT creditnumber FROM HasPaymentMethod WHERE UserID = " + id;
  	int creditNumber;
    getConnection();
    try{
    	PreparedStatement pstmt = con.prepareStatement(SQL);
    	ResultSet rst = pstmt.executeQuery();
    	if(!rst.next()){
    		out.print("<h1>Your default credit card information:</h1>");
        	out.print("<form method=\"post\" action=\"CreditCardUpdate.jsp\">");
        	out.print("<br><h2>Credit Card Number:</h2>");
        	out.print("<input type=\"text\" name=\"CreditCardNumber\" size=\"50\" >");
        	out.print("<br><h2>Credit Card Company:</h2>");
        	out.print("<input type=\"text\" name=\"CreditCardCompany\" size=\"50\" >");
        	out.print("<br><br>");
        	out.print("<input type=\"submit\" value=\"Submit\"><input type=\"reset\" value=\"Reset\">");
        	out.print("</form>");
    	}else{
    		creditNumber = rst.getInt("creditnumber");
    		String SQL2 = "SELECT creditcardcompany FROM PaymentMethod WHERE creditnumber = " + creditNumber;
    		PreparedStatement pstmt2 = con.prepareStatement(SQL2);
        	ResultSet rst2 = pstmt2.executeQuery();
        	rst2.next();
        	
        	out.print("<h1>Your default credit card information:</h1>");
        	out.print("<form method=\"post\" action=\"CreditCardUpdate.jsp\">");
        	out.print("<br><h2>Credit Card Number:</h2>");
        	out.print("<input type=\"number\" name=\"CreditCardNumber\" size=\"50\" value =" + creditNumber + " >");
        	out.print("<br><h2>Credit Card Company:</h2>");
        	out.print("<input type=\"text\" name=\"CreditCardCompany\" size=\"50\" value =\"" + rst2.getString("creditcardcompany") + "\" >");
        	out.print("<br><br>");
        	out.print("<input type=\"submit\" value=\"Submit\"><input type=\"reset\" value=\"Reset\">");
        	out.print("</form>");
    	}
    }catch(Exception E){
    	out.println("Error " + E);
    }
    
    
    
  %>
</body>
</html>