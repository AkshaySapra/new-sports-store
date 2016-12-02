<%@ include file="manageAuth.jsp" %>
<%@ include file="jdbc.jsp" %>
<% 

String pid = request.getParameter("pid");
String pname = request.getParameter("pname");
String catName = request.getParameter("catName");
String price = request.getParameter("price");
String currentlySelling = request.getParameter("currentlySelling");
String Ainventory = request.getParameter("Ainventory");
String Binventory = request.getParameter("Binventory");

if (pid == null || pid.equals("") || pname == null || pname.equals("") || catName == null || catName.equals("") || price == null || price.equals("") || currentlySelling == null || currentlySelling.equals("") || Ainventory == null || Ainventory.equals("") || Binventory == null || Binventory.equals(""))
	response.sendRedirect("productManage.jsp");

try {
	int pidVal = Integer.parseInt(pid);
	double priceVal = Double.parseDouble(price);
	int Ainv = Integer.parseInt(Ainventory);
	int Binv = Integer.parseInt(Binventory);
	int sell;
	
	if (currentlySelling.equals("true"))
		sell = 1;
	else if (currentlySelling.equals("false"))
		sell = 0;
	else
		throw new Exception();
	
	int catID;
	getConnection();
	PreparedStatement cat = con.prepareStatement("SELECT catID FROM ProductCategory WHERE catName = ?");
	cat.setString(1, catName);
	ResultSet rst = cat.executeQuery();
	
	if (rst.next())
		catID = rst.getInt("catID");
	else {
		cat = con.prepareStatement("INSERT INTO ProductCategory (catName) VALUES (?)", Statement.RETURN_GENERATED_KEYS);
		cat.setString(1, catName);
		cat.execute();
		ResultSet keys = cat.getGeneratedKeys();
		keys.next();
		catID = keys.getInt(1);
	}
	
	String sql = "UPDATE Product SET pname = ?, catID = ?, price = ?, currentlySelling = ? WHERE pid = ?";
	PreparedStatement update = con.prepareStatement(sql);
	update.setString(1, pname);
	update.setInt(2, catID);
	update.setDouble(3, priceVal);
	update.setInt(4, sell);
	update.setInt(5, pidVal);
	update.execute();
	
	sql = "UPDATE Stores SET inventory = ? WHERE pid = ? AND wname = 'Warehouse A'";
	update = con.prepareStatement(sql);
	update.setInt(1, Ainv);
	update.setInt(2, pidVal);
	update.execute();
	
	sql = "UPDATE Stores SET inventory = ? WHERE pid = ? AND wname = 'Warehouse B'";
	update = con.prepareStatement(sql);
	update.setInt(1, Binv);
	update.setInt(2, pidVal);
	update.execute();
		
	closeConnection();
}
catch (Exception E) {

}
finally {
	response.sendRedirect("productManage.jsp");
}

%>