<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF8"%>
<%@ include file="jdbc.jsp"%>
<%@ include file="auth.jsp"%>

<html>
<head>
<title>Mikey.ca | Update Profile Information</title>
 <link href="shift.css" rel="stylesheet">
 <link href="bootstrap.css" rel="stylesheet">
 <link href="second.css" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp"%>

<%
String id = (String) session.getAttribute("authenticatedUser");
String SQL = "SELECT email, fname, lname, password, address, city, postalcode FROM Users WHERE UserID = " + id;
ResultSet rst;
try{
	getConnection();
	PreparedStatement pstmt = con.prepareStatement(SQL);
	rst = pstmt.executeQuery();
	if(rst.next()){
		 out.print("<h1>Your information:</h1>");
		 out.print("<form method=\"post\" action=\"CustomerUpdate.jsp\">");
		 out.print("<h2>Email:</h2>");
		 out.print("<input type=\"text\" name=\"email\" size=\"50\" value =" + rst.getString("email") + " >");
		 out.print("<h2>First Name:</h2>");
		 out.print("<input type=\"text\" name=\"fname\" size=\"50\" value = " + rst.getString("fname") + ">");
		 out.print("<br>");
		 out.print("<h2>Last Name:</h2>");
		 out.print("<input type=\"text\" name=\"lname\" size=\"50\" value = " + rst.getString("lname") + ">");
		 out.print("<br>");
		 out.print("<h2>Password:</h2>");
		 out.print("<input type=\"password\" name=\"password\" size=\"50\" value = " + rst.getString("password") + ">");
		 out.print("<br>");
		 out.print("<h2>Address:</h2>");
		 out.print("<input type=\"text\" name=\"adress\" size=\"50\" value = " + rst.getString("address") + ">");
		 out.print("<br>");
		 out.print("<h2>City:</h2>");
		 out.print("<input type=\"text\" name=\"city\" size=\"50\" value = " + rst.getString("city") + "><br>");
		 out.print("<h2>Postal Code:</h2>");
		 out.print("<input type=\"text\" name=\"postalcode\" size=\"50\" value = " + rst.getString("postalcode") + "><br>");
		 out.print("<h2>Province:</h2>");
		 out.print("<select size=\"1\" name=\"province\">");
		 out.print("<option>AB</option><option>BC</option><option>MB</option><option>NB</option><option>NL</option><option>NS</option><option>NWT</option><option>NU</option><option>ON</option><option>PEI</option><option>QC</option><option>SK</option><option>YT</option>");
		 out.print("</select>");
		 out.print("<br><br>");
		 out.print("<input type=\"submit\" value=\"Submit\"><input type=\"reset\" value=\"Reset\">");
		 out.print("</form>");
		}else{
			out.print("Error");
		}
}catch(Exception E){
	out.println("Exception: " + E);
}
%>
</body>
</html>