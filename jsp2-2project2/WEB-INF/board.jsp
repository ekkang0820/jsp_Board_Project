<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device=width",initial-scale="1"><!--부트스트랩 반응형 웹-->
<link rel="stylesheet" href="css/bootstrap.css">
<meta charset="UTF-8">
<title>게시글</title>
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
			
			<a class="navbar-brand" href="main.jsp">고해성사 웹 사이트</a>
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
			<div class="row">
				<table class="table" style="text-align: center;border: 1px solid gray;">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">제목</th>
							<th style="background-color: #eeeeee; text-align: center;">닉네임</th>
							<th style="background-color: #eeeeee; text-align: center;">댓글 수</th>
							<th style="background-color: #eeeeee; text-align: center;">작성일</th>							
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>테스트 게시글입니다.</td>
							<td>ㅇㅇ</td>
							<td>0</td>
							<td>2023-9-30</td>
						</tr>
					</tbody>							
				</table>
				<%if(userMail != null){ %>
					<a href="write.jsp" class="btn btn-primary pull-right">글작성</a>	
				<%} %>
									
			</div>	
		</div>

</body>
</html>