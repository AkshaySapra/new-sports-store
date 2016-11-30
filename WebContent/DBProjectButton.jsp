<%@ include file="jdbc.jsp"%>
<!DOCTYPE html>
<html>
 <body>
 <%	
	String SQL = "SELECT catID, catName, catURL FROM ProductCategory";
	try{
	 int count = 0;
	 getConnection();
	 PreparedStatement pstmt = con.prepareStatement(SQL); 
	 ResultSet rst = pstmt.executeQuery();
	 out.print("<table border = \"0\" width = \"100px\"><tr>");
	 while(rst.next()){ 
	  out.println("<form action=\"product.jsp?catid=" + rst.getInt(1) + ">");
    	   out.print("<td><input type = \"submit\" value =" + rst.getString(2) + "style: \"background: url(" + rst.getString(3) + ");width:464px;height:301px;\"/></td>");
	  out.println("</form>");
	  count++;
	  if(count == 4)
	   out.print("</tr><tr>");
 	 }
	 out.print("<p>sADSADsa</p>");
	out.print("</tr>");
	}catch(SQLException E){
	  out.println("Les Exception");
	}
 %>
 </body>
</html>