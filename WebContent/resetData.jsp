<%@ page import="Demo.MyClass"%>
<%@ page import="Demo.ResetData"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>

	<%@page import="java.io.*"%>
	<%@page import="java.util.*"%>

	<%
   MyClass tc = new MyClass();
   out.print(tc.testMethod());
   /* ResetData rd = new ResetData(); */
   
   String this_file_path = request.getSession().getServletContext().getRealPath(request.getServletPath());
   out.println(this_file_path);
   
   
  File jsp = new File(request.getSession().getServletContext().getRealPath(request.getServletPath()));
File dir = jsp.getParentFile();
out.println(dir.toString());
String correct_path = dir.toString() + "/data/order_sql.ddl";
out.println(correct_path);
File[] list = dir.listFiles();


/* 	
   out.print("file path is: " + list[0]);
  for(int i = 0; i < list.length; i++){
	  out.println(list[i]);
  } */
   out.print(", Data is being reloaded.");
 ResetData.loadData(correct_path); 
   
  %>
</body>
</html>