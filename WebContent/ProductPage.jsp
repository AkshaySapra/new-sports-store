<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.GregorianCalendar"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>View Product</title>
 <link href="shift.css" rel="stylesheet">
 <link href="bootstrap.css" rel="stylesheet">
 <link href="second.css" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp"%>


<%!


    public String haha(){

        GregorianCalendar gc = new GregorianCalendar();

        int year = randBetween(1900, 2010);

        gc.set(gc.YEAR, year);

        int dayOfYear = randBetween(1, gc.getActualMaximum(gc.DAY_OF_YEAR));

        gc.set(gc.DAY_OF_YEAR, dayOfYear);

        return (gc.get(gc.YEAR) + "-" + (gc.get(gc.MONTH) + 1) + "-" + gc.get(gc.DAY_OF_MONTH));

    }

    public static int randBetween(int start, int end) {
        return start + (int)Math.round(Math.random() * (end - start));
    }

%>
<% 
// Get customer information


String id = request.getParameter("id");
String name = request.getParameter("name");
out.println("<h1 align=\"center\" style=\"color:blue;\">Product: " + name + "</h1>");

@SuppressWarnings({"unchecked"})
NumberFormat currFormat = NumberFormat.getCurrencyInstance();
try {	
			getConnection();
		
			String SQL2 = "SELECT  picURL FROM Product WHERE pid = ?";
			PreparedStatement pstmt = con.prepareStatement(SQL2);
			pstmt.setString(1, id);
			ResultSet rst = pstmt.executeQuery();

			while (rst.next()) {
				String URL = rst.getString(1);
				out.println("<h2 align=\"center\" style=\"color:blue;\">imageurl: " + URL + "</h2>");
				out.println("<body background=\""+URL+"\" opacity: 0.3;>");
			}
			
			//nn



			out.println("<h2 align=\"center\" style=\"color:blue;\">Reviews for: " + name + "</h2>");
			String SQL3 = "SELECT * FROM ProductReview WHERE pid = ?";
			PreparedStatement pstmt2 = con.prepareStatement(SQL3);
			pstmt2.setString(1, id);
			ResultSet rst2 = pstmt2.executeQuery();
			
			
			out.print("<font face=\"Century Gothic\" size=\"2\"><table class=\"table\" border=\"1\"><tr><th>Date Review Created</th><th>User ID</th><th>Rating</th>");
			out.println("<th>Review</th></tr>");
			while (rst2.next()) {
				out.print("<tr><td>"+haha()+"</td><td>"+rst2.getString(2)+"</td><td>"+rst2.getString(3)+"</td><td>"+rst2.getString(4)+"</td></tr>");

				
			}


			
			//out.println("<img src=\"images/basketball shoes.JPG\" alt=\"Mountain View\" style=\"width:304px;height:228px;\">");
	


			//keys.next();
			//int custId = keys.getInt(1);
			//out.println("<h2>Your ID  number is: " + custId + "</h2>");
	
		}
	

catch (SQLException ex) {
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
</BODY>
</HTML>