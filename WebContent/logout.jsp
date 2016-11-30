<html>
<head>
<title>logout</title>
</head>
<body>

<% 
System.out.println("logging out");
request.getSession().invalidate();


%>

