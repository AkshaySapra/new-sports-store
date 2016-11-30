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
	 out.print("<table border = \"1\" width = \"1000px\"><tr>");
	 while(rst.next()){ 
    	   out.print("<td><input type =button OnClick=\"location.href='product.jsp?catid=" + rst.getInt(1) + "'\" value =\"" + rst.getString(2) + "\" button style= \"background: url(" + rst.getString(3) + ");width:464px;height:301px;\"/></td>");
	  count++;
	  if(count == 3){
	   out.print("</tr><tr>");
	   count = 0;
	  }
 	 }
	 
	out.print("</tr>");
	}catch(SQLException E){
	  out.println("Les Exception");
	}
 %>
 </body>
</html>