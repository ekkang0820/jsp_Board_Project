<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userMail"/>
<jsp:setProperty name="user" property="userPW"/>
<jsp:setProperty name="user" property="userNick"/>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이메일 중복 확인</title>
</head>
<body>
<%
    String userMail = request.getParameter("userMail"); // 파라미터로 전달된 이메일 값 가져오기

    UserDAO userDAO = new UserDAO();
    int result = userDAO.checkDuplication(userMail); // 가져온 이메일로 중복 확인 수행
	
    String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$";

    if (!userMail.matches(emailRegex)) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('올바른 이메일 형식이 아닙니다.');");
        script.println("history.back();"); 
        script.println("</script>");
    }
    else if (result == -1) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('이미 존재하는 이메일 입니다.');");
        script.println("history.back();"); 
        script.println("</script>");
    } else if (result == 1) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('사용 가능한 이메일입니다.');");  
        script.println("history.back();"); 
        script.println("</script>");            
    }

  
%>
</body>
</html>