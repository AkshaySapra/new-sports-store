<%@ page import="Demo.MyClass"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
  
  <%
   MyClass tc = new MyClass();
   out.print(tc.testMethod());
  %>
</body>
</html>