<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<%  request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name = "user" property = "userMail"/>
<jsp:setProperty name = "user" property = "userPW"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고해성사 로그인 처리 페이지</title>
</head>
<body>
	<%
		String loguserMail = null;
		if(session.getAttribute("userMail")!=null){
			
			loguserMail = (String)session.getAttribute("userMail");
		}
		if(loguserMail != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어 있습니다.')");
			script.println("location.href ='main.jsp'"); //나중에 게시글 페이지로 이동할것 board.jsp
			script.println("</script>");
		}
		
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserMail(),user.getUserPW());
		if(result == 1){
			session.setAttribute("userMail",user.getUserMail());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href ='main.jsp'"); //나중에 게시글 페이지로 이동할것 board.jsp
			script.println("</script>");
		}
		else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 이메일입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스에 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>