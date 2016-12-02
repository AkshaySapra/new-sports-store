<%@ page import="Demo.MyClass"%>
<%@ page import="Demo.ResetData"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
  <c:set var="context" value="${pageContext.request.contextPath}" />
<script src="${context}/themes/js/jquery.js"></script>


  <%
   MyClass tc = new MyClass();
   out.print(tc.testMethod());
   /* ResetData rd = new ResetData(); */
   out.print(", Data is being reloaded.");
   ResetData.loadData();
   
  %>
</body>
</html>