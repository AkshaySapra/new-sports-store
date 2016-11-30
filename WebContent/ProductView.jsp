<%@ include file="jdbc.jsp"%>
<!DOCTYPE html>
<html>
<HEAD>
<TITLE>Mikey.ca | View Products</TITLE>
 <link href="shift.css" rel="stylesheet">
 <link href="bootstrap.css" rel="stylesheet">
 <link href="second.css" rel="stylesheet">
</HEAD>
  <body>
 <%@ include file="header.jsp"%>
 <%	
  String SQL = "SELECT pid, pname, picURL, price FROM Product WHERE currentlySelling = 1 and catId = ";
  SQL = SQL + request.getParameter("catid");
  try{
		 int count = 0;
		 getConnection();
		 PreparedStatement pstmt = con.prepareStatement(SQL); 
		 ResultSet rst = pstmt.executeQuery();
		 out.print("<table border = \"1\" width = \"1000px\"><tr>");
		 while(rst.next()){ 
	    	   out.print("<td><input type =button OnClick=\"location.href='addcart.jsp?id=" + rst.getInt("pid") + "&name=" + rst.getString("pname") + "&price=" + rst.getDouble("price") + "'\" value =\"" + rst.getString("pname") + "\" button style= \"background: url(" + rst.getString("PicURL") + ");width:400px;height:320px;\"/></td>");
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