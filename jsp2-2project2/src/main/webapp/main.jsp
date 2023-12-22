<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="BoardDAO" class="board.BoardDAO"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device=width",initial-scale="1"><!--부트스트랩 반응형 웹-->
<link rel="stylesheet" href="css/bootstrap.css">
<meta charset="UTF-8">
<%@ page import = "java.io.PrintWriter" %>
<title>메인페이지</title>
 <style>
        
        body {
            padding-top: 20px;
        }
        .navbar-brand {
            font-weight: bold;
            color: #0056b3;
        }
        .footer {
            padding: 20px 0;
            background-color: #f5f5f5;
            text-align: center;
        }
    </style>
</head>
<body>
	<%
	String userMail = null;
	if(session.getAttribute("userMail") != null){
		userMail = (String) session.getAttribute("userMail");
	}
	
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			
			<a class="navbar-brand" href="main.jsp">개발자 자료 저장소</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-exapmple-navbar-collapse-1">
			<%if(userMail == null){ %>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="join.jsp">회원가입</a></li>				
			</ul>
			<%}else{ %>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="logout.jsp">로그아웃</a></li>
			</ul>
			<%} %>
			
		</div>
		
		
		
	</nav>
	<div class="container">
		<h2>저장소 가는길</h2>
		<a href="board.jsp"><img src="Main.png" class="bd-placeholder-img card-img-top img-fluid" width="100%" height="50%"></a>		
	</div>	
	
		<h4 style="margin-left: 60%">현재 게시글 수 : <%=BoardDAO.boardcount() %>개&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp	현재 가입자 수 : <%=BoardDAO.usercount() %>명</h4>
		<h4 style="margin-left: 60%"></h4>
		
	
<div class="footer">
        <p>&copy; 2023 개발자 자료 저장소. 201944010 강은규!!!</p>
</div>

</body>
</html>