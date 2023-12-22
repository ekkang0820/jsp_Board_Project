<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>로그인</title>
</head>
<body>	
	
	<nav class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="main.jsp">고해성사 웹 사이트</a>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<form method="post" action="loginAction.jsp">
					<h2 style="text-align:center; color:navy;">로그인</h2>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="이메일" name="userMail" maxlength="30">											
					</div>
					
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호" name="userPW" maxlength="20">
					</div>
					<div class="form-group">
						<div class="text-right"> <!-- 오른쪽 정렬 -->
							<input type="submit" value="로그인" class="btn btn-primary">
							<button type="button" class="btn btn-success" onclick="window.location.href='join.jsp'">회원가입</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>