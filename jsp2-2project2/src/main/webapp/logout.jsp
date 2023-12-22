<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>

<head>
<meta http-equiv="Content-Type" content="text/html" charset=UTF-8">
<title>로그아웃 처리</title>
</head>
<body>
    <%
    	session.invalidate();
    	response.sendRedirect("main.jsp");
    %>
 
</body>
</html>