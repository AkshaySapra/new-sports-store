<%@ include file="jdbc.jsp"%>
<%@ include file="auth.jsp"%>
<% 
// Get customer information
String rating = request.getParameter("rating");
String review = request.getParameter("Review");
String userid = (String)session.getAttribute("authenticatedUser");
String Productid = request.getParameter("pid");

if (review == null || review.equals("") || rating == null || rating.equals(""))
	response.sendRedirect("AddReview.jsp?id=" + Productid);
else {
	try {	
				getConnection();
				int ProdID=Integer.parseInt(Productid);
				String SQL2 = "INSERT INTO ProductReview VALUES (?,?,?,?,?)";
				PreparedStatement pstmt = con.prepareStatement(SQL2);			
				pstmt.setInt(1,ProdID);
				pstmt.setInt(2,Integer.parseInt(userid));
				pstmt.setInt(3,Integer.parseInt(rating));
				pstmt.setString(4,review);
				//String date=java.sql.Timestamp;
				pstmt.setTimestamp(5, new java.sql.Timestamp(System.currentTimeMillis()));
				pstmt.executeUpdate();
	
				closeConnection();
				response.sendRedirect("ProductPage.jsp?id=" + ProdID);
			}
		
	
	catch (SQLException ex) {
		out.println(ex);
		out.println(" <br>... </br>");
		out.println(" <br>... </br>");
		out.println(" <br>wait a second. that means </br>");
		out.println(" <br>... </br>");

		out.println(" <br>YOU HAVE ALREADY INSERTED A REVIEW FOR THIS PRODUCT </br>");
		out.println(" <br>nice try tho </br>");

	}
}
%>