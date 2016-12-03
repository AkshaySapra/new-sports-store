<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="manageAuth.jsp" %>
<%@ page import="java.util.HashMap" %>
<%@ include file="jdbc.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mikey.ca | Product Management</title>
 <link href="shift.css" rel="stylesheet">
 <link href="bootstrap.css" rel="stylesheet">
 <link href="second.css" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp" %>

<h2>Browse Products By Category and Search by Product Name:</h2>

<form method="get" action="productManage.jsp">
  <p align="left">
  <select size="1" name="categoryName">
  <option>All</option>

<%
try               
{
	getConnection();
	PreparedStatement pstmt = con.prepareStatement("SELECT DISTINCT catName FROM ProductCategory");
 	ResultSet rst = pstmt.executeQuery();
        while (rst.next()) 
		out.println("<option>"+rst.getString(1)+"</option>");
}
catch (SQLException ex)
{       out.println(ex);
}

%>

  <input type="text" name="productName" size="50">    
  </select><input type="submit" value="Submit"><input type="reset" value="Reset"></p>
</form>

<%
// Colors for different item categories
HashMap colors = new HashMap();		// This may be done dynamically as well, a little tricky...
colors.put("Soccer", "#0000FF");
colors.put("Rugby", "#FF0000");
colors.put("Basketball", "#008000");
colors.put("Curling", "#6600CC");
colors.put("Baseball", "#55A5B3");
colors.put("Hockey", "#FF9900");
%>

<%
	// Get product name to search for
String name = request.getParameter("productName");
String category = request.getParameter("categoryName");


boolean hasNameParam = name != null && !name.equals("");
boolean hasCategoryParam = category != null && !category.equals("") && !category.equals("All");
String filter = "", sql = "";

if (hasNameParam && hasCategoryParam)
{
	filter = "<h3>Products containing '"+name+"' in category: '"+category+"'</h3>";
	name = '%'+name+'%';
	sql = "SELECT P.pid, P.pname, P.price, PC.catName, picURL, currentlySelling FROM Product P LEFT OUTER JOIN ProductCategory PC ON P.catID = PC.catID WHERE P.pname LIKE ? AND PC.catName = ?";
}
else if (hasNameParam)
{
	filter = "<h3>Products containing '"+name+"'</h3>";
	name = '%'+name+'%';
	sql = "SELECT P.pid, P.pname, P.price, PC.catName, picURL, currentlySelling FROM Product P LEFT OUTER JOIN ProductCategory PC ON P.catID = PC.catID WHERE P.pname LIKE ?";
}
else if (hasCategoryParam)
{
	filter = "<h3>Products in category: '"+category+"'</h3>";
	sql = "SELECT P.pid, P.pname, P.price, PC.catName, picURL, currentlySelling FROM Product P, ProductCategory PC WHERE P.catID = PC.catID AND PC.catName = ?";
}
else
{
	filter = "<h3>All Products</h3>";
	sql = "SELECT P.pid, P.pname, P.price, PC.catName, picURL, currentlySelling FROM Product P LEFT OUTER JOIN ProductCategory PC ON P.catID = PC.catID";
}

out.println(filter);

try 
{
	getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	if (hasNameParam)
	{
		pstmt.setString(1, name);	
		if (hasCategoryParam)
		{
			pstmt.setString(2, category);
		}
	}
	else if (hasCategoryParam)
	{
		pstmt.setString(1, category);
	}
	
	ResultSet rst = pstmt.executeQuery();
	out.println("<h2><a href=\"newProduct.jsp\">Add a new product</a></h2>");	
	
	out.print("<font face=\"Century Gothic\" size=\"2\"><table border=\"1\"><tr><th></th><th>Product ID&nbsp;&nbsp;&nbsp;</th><th>Product Name</th>");
	out.println("<th>Category</th><th>Price</th><th>Currently Selling&nbsp;&nbsp;&nbsp;</th><th>Warehouse A&nbsp;&nbsp;&nbsp;</th><th>Warehouse B&nbsp;&nbsp;&nbsp;</th></tr>");
	while (rst.next()) 
	{
		out.println("<form method=\"get\" action=\"changeProduct.jsp\"><td><input type=\"submit\" value=\"Submit\">&nbsp;<input type=\"reset\" value=\"Reset\">&nbsp;</td>");
		out.println("<input type=\"hidden\" name=\"pid\" value=\"" + rst.getInt("pid") + "\" />");
		
		String itemCategory = rst.getString(4);
		String URL = rst.getString(5);
		String color = (String) colors.get(itemCategory);
		if (color == null)
			color = "#000000";
		
		out.println("<td>" + rst.getInt("pid") + "</td><td><INPUT TYPE=\"text\" name=\"pname\" size=\"50\" value=\""
				+rst.getString("pname")+"\" Style='color=" + color + "'></td>"
				+ "<td><INPUT TYPE=\"text\" name=\"catName\" size=\"50\" value=\""
				+itemCategory+"\" Style='color=" + color + "'></td>"
				+ "<td><INPUT TYPE=\"text\" name=\"price\" size=\"5\" value=\""
				+rst.getString("price")+"\" Style='color=" + color + "'></td>"
				+ "<td><select size=\"1\" name=\"currentlySelling\">"
				+ "<option");
		if (rst.getInt("currentlySelling") == 1)
			out.println(" selected>true</option><option>false</option></td>");
		else
			out.println(">true</option><option selected>false</option></td>");
		
		String invSQL = "SELECT A.inventory AS Ainventory, B.inventory AS Binventory FROM (SELECT pid, inventory FROM Stores WHERE wname = 'Warehouse A') AS A FULL OUTER JOIN (SELECT pid, inventory FROM Stores WHERE wname = 'Warehouse B') AS B ON A.pid = B.pid WHERE A.pid = ? OR B.pid = ?";
		PreparedStatement invPstmt = con.prepareStatement(invSQL);
		invPstmt.setInt(1, rst.getInt("pid"));
		invPstmt.setInt(2, rst.getInt("pid"));
		ResultSet invRst = invPstmt.executeQuery();
		invRst.next();
		out.println("<td><INPUT TYPE=\"text\" name=\"Ainventory\" size = \"10\" value=\""+ invRst.getInt("Ainventory") + "\" Style='color=" + color + "'></td><td><INPUT TYPE=\"text\" name=\"Binventory\" size = \"10\" value=\""+ invRst.getInt("Binventory") + "\" Style='color=" + color +"'></td></tr></form>");
	}
	out.println("</table></font>");
	closeConnection();
} catch (SQLException ex) {
	out.println(ex);
}
%>

</body>
</html>