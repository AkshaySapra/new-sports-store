<%@ page import="java.util.GregorianCalendar"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Mikey.ca | View Product</title>
 <link href="shift.css" rel="stylesheet">
 <link href="bootstrap.css" rel="stylesheet">
 <link href="second.css" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp"%>


<% 
// Get customer information


String id = request.getParameter("id");

try {	
			getConnection();
		
			String SQL2 = "SELECT picURL, pname FROM Product WHERE pid = ?";
			PreparedStatement pstmt = con.prepareStatement(SQL2);
			pstmt.setString(1, id);
			ResultSet rst = pstmt.executeQuery();

			rst.next();
			String name = rst.getString("pname");
			out.println("<h1 align=\"center\" style=\"color:#3399FF;\">Product: " + name + "</h1>");
			String URL = rst.getString("picURL");
			//out.println("<h2 align=\"center\" style=\"color:blue;\">imageurl: " + URL + "</h2>");
			//out.println("<body background=\""+URL+"\" opacity: 5.9;>");
			out.println("<center><img src=\" "+ URL +" \" alt=\"what image shows\" height=\"400\" width=\"500\"></center>");
			
			//nn

//"#3399FF"

			out.println("<h2 align=\"center\" style=\"color:#3399FF;\">Reviews for: " + name + "</h2>");
			String SQL3 = "SELECT * FROM ProductReview WHERE pid = ? ORDER BY rDate desc";
			PreparedStatement pstmt2 = con.prepareStatement(SQL3);
			pstmt2.setString(1, id);
			ResultSet rst2 = pstmt2.executeQuery();
			
			
			out.print("<font face=\"Century Gothic\" size=\"2\"><table bgcolor=\"#3399FF\" class=\"table\" border=\"2\" background=\"lebron.png\"><tr><th>Date Review Created</th><th>User ID</th><th>Rating</th>");
			out.println("<th>Review</th></tr>");
			while (rst2.next()) {
				String reviews=""; //Converts the reviews to stars
				int review=rst2.getInt(3);
				if (review==1)
					reviews=reviews+"&#9733&#9734&#9734&#9734&#9734";
				else if (review==2)	
					reviews=reviews+"&#9733&#9733&#9734&#9734&#9734";
				else if (review==3)	
					reviews=reviews+"&#9733&#9733&#9733&#9734&#9734";
				else if (review==4)	
					reviews=reviews+"&#9733&#9733&#9733&#9733&#9734";
				else if (review==5)	
					reviews=reviews+"&#9733&#9733&#9733&#9733&#9733";

				out.print("<tr><td>"+rst2.getString(5)+"</td><td>"+rst2.getString(2)+"</td><td>"+reviews+"</td><td>"+rst2.getString(4)+"</td></tr>");

				
			}

			out.println("<H2><A HREF=\"AddReview.jsp?id=" + id + "\">Leave a review for this product</A></H2>");
			out.println("<h2><a href=\"addcart.jsp?id=" + id + "&name="+name+"&price=10"+"\">Add to Cart</a>");
			
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