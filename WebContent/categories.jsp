<%@ include file="jdbc.jsp"%>
<!DOCTYPE html>
<html>
<HEAD>
<TITLE>Mikey.ca | View Categories</TITLE>
 <link href="shift.css" rel="stylesheet">
 <link href="bootstrap.css" rel="stylesheet">
 <link href="main.css" rel="stylesheet">
</HEAD>
  <body>
 <%@ include file="header.jsp"%>
 <%	
	String SQL = "SELECT catID, catName, catURL FROM ProductCategory";
	try{
	 int count = 0;
	 getConnection();
	 PreparedStatement pstmt = con.prepareStatement(SQL); 
	 ResultSet rst = pstmt.executeQuery();
	 out.print("<table border = \"0\" width = \"1000px\"><tr>");
	 while(rst.next()){ 
    	   out.print("<td><input type =button OnClick=\"location.href='ProductView.jsp?catid=" + rst.getInt("catID") + "'\" value =\"" + rst.getString("catName") + "\" button style= \"background: url(" + rst.getString("catURL") + ");width:464px;height:301px;\"/></td>");
	  count++;
	  if(count == 3){
	   out.print("</tr><tr>");
	   count = 0;
	  }
 	 }
	 
	out.print("</tr>");
	}catch(SQLException E){
	  out.println("Exception: " + E);
	}
 %>
 </body>
</html>