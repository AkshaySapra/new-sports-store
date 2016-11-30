<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mikey.ca | Create Account</title>
</head>
<body>
<h1>Enter your information:</h1>
<form method="post" action="#.jsp">
<h2>Email:</h2>
<input type="text" name="email" size="50">
<h2>First Name:</h2>
<input type="text" name="fname" size="50">
<br>
<h2>Last Name:</h2>
<input type="text" name="lname" size="50">
<br>
<h2>Password:</h2>
<input type="password" name="password" size="50">
<br>
<h2>Address:</h2>
<input type="text" name="adress" size="50">
<br>
<h2>City:</h2>
<input type="text" name="city" size="50">
<br>
<h2>Province:</h2>
<select size="1" name="province">
  <option>AB</option>
  <option>BC</option>
  <option>MB</option>
  <option>NB</option>
  <option>NL</option>
  <option>NS</option>
  <option>NWT</option>
  <option>NU</option>
  <option>ON</option>
  <option>PEI</option>
  <option>QC</option>
  <option>SK</option>
  <option>YT</option>
 </select>
<br><br>
<input type="submit" value="Submit"><input type="reset" value="Reset">
</form>


</body>
</html>