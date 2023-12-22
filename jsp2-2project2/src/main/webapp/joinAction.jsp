	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
 
<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userMail"/>
<jsp:setProperty name="user" property="userPW"/>
<jsp:setProperty name="user" property="userNick"/>

<head>
<meta http-equiv="Content-Type" content="text/html" charset=UTF-8">
<title>회원가입 처리</title>
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
			script.println("location.href ='main.jsp'");
			script.println("</script>");
		}
    	if (user.getUserMail()==null||user.getUserPW()==null||user.getUserNick()==null){
    		PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('모든항목을 입력해주세요.')");
            script.println("history.back()");    // 이전 페이지로 사용자를 보냄
            script.println("</script>");
    	}    
    	else{
    		String userMail = request.getParameter("userMail");
    		UserDAO userDAO = new UserDAO();
            int result = userDAO.join(user);
            
            String emailRegex = "^[A-Za-z0-9+_.-]+@(.+)$";

            if (!userMail.matches(emailRegex)) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('올바른 이메일 형식이 아닙니다.');");
                script.println("history.back();"); 
                script.println("</script>");
            }
             
            else if (result == -1){ // 회원가입 실패시
            	PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('이미 존재하는 이메일 입니다.')");
                script.println("history.back()"); 
                script.println("</script>");
            }
            
            else if(result == 1){// 회원가입 성공시
            	session.setAttribute("userMail",user.getUserMail());
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("location.href = 'main.jsp'");    // 메인 페이지로 이동
                script.println("</script>");            
    		}
    }
    %>
 
</body>
</html>