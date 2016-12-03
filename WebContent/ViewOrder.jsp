<%@ include file="jdbc.jsp"%>
<!DOCTYPE html>
<html>
<HEAD>
<TITLE>Mikey.ca | View Products</TITLE>
 <link href="shift.css" rel="stylesheet">
 <link href="bootstrap.css" rel="stylesheet">
 <link href="main.css" rel="stylesheet">
</HEAD>
  <body>
 <%@ include file="header.jsp"%>
 <%	
 	String id = (String) session.getAttribute("authenticatedUser");
 	String SQL = "SELECT oid, odate, sdate, TotalAmount, GETDATE() AS date FROM Orders WHERE UserID = " + id;
 	try{
 		getConnection();
 		PreparedStatement pstmt1 = con.prepareStatement(SQL);
 		PreparedStatement pstmt2 = con.prepareStatement(SQL);
 		ResultSet rst1 = pstmt1.executeQuery();
 		ResultSet rst2 = pstmt2.executeQuery();
 		
 		
 		out.println("<h1>All orders</h1><br><br>");
 		out.println("<h2>Current Orders</h2><br>");
 		
 		out.println("<table style=\"width:100%\">");
 		out.print("<tr><th>OrderID</th><th>OrderDate</th><th>ShippingDate</th><th>TotalAmount</th><tr>");
 		
 		while(rst1.next()){
 			if((rst1.getDate("date")).compareTo(rst1.getDate("sdate")) < 0){
 				out.println("<tr><td>" + rst1.getInt("oid") +"</td><td>" + rst1.getDate("odate") + "</td><td>" + rst1.getDate("sdate") + "</td><td>" + rst1.getDouble("TotalAmount") + "</td></tr>");
 			}
 		}
 		
 		out.println("</table><br>");
 		
 		out.println("<h2>Previous Orders</h2><br>");
 		
 		out.println("<table style=\"width:100%\">");
 		out.print("<tr><th>OrderID</th><th>OrderDate</th><th>ShippingDate</th><th>TotalAmount</th><tr>");
 		
 		while(rst2.next()){
 			if((rst2.getDate("date")).compareTo(rst2.getDate("sdate")) > 0){
 				out.println("<tr><td>" + rst2.getInt("oid") +"</td><td>" + rst2.getDate("odate") + "</td><td>" + rst2.getDate("sdate") + "</td><td>" + rst2.getDouble("TotalAmount") + "</td></tr>");
 			}
 		}
 		
 		out.println("</table><br>");
 		
 	}catch(Exception E){
 		out.println("An error occured" + E);
 	}
 %>
</body>
</html>