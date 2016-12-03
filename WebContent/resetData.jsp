<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
</head>
<body>

<%

   
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
 
 String url = "jdbc:sqlserver://sql04.ok.ubc.ca:1433;DatabaseName=db_kneubaue;";
	String uid = "kneubaue";
	String pw = "34742149";
	
	System.out.println("Connecting to database.");
	
	
//	
	String fileName = correct_path;
	
 try
 {
     // Create statement
     Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	 Connection con = DriverManager.getConnection(url, uid, pw);
     Statement stmt = con.createStatement();
     
     Scanner scanner = new Scanner(new File(fileName));
     // Read commands separated by ;
     scanner.useDelimiter(";");
     while (scanner.hasNext())
     {
         String command = scanner.next();
         if (command.trim().equals(""))
             continue;
         //System.out.println(command);        // Uncomment if want to see commands executed
         try
         {
         	stmt.execute(command);
         }
         catch (Exception e)
         {	// Keep running on exception.  This is mostly for DROP TABLE if table does not exist.
         	System.out.println(e);
         }
     }	 
     scanner.close();
     
     System.out.println("Database loaded.");
 }
 catch (Exception e)
 {
     System.out.println(e);
 }   

   
  %>
</body>
</html>