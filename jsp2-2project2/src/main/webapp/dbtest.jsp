
<%@ page import="java.sql.*"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0" charset="UTF-8"/>

<h2>JDBCtest.jsp </h2>

<%
  Connection conn=null;

  try{
	  String jdbcUrl = "jdbc:mysql://localhost:3306/";
	     String dbId = "root";
	     String dbPass = "";
	
	 Class.forName("com.mysql.jdbc.Driver");
	 conn = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	 out.println("connect.");
  }catch(Exception e){ 
	 e.printStackTrace();
	 out.println("fail");
  }
%>