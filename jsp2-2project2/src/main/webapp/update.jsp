<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "user.UserDAO" %>
<%@ page import = "board.BoardDAO" %>
<%@ page import = "board.Board"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device=width",initial-scale="1"><!--부트스트랩 반응형 웹-->
<link rel="stylesheet" href="css/bootstrap.css">
<meta charset="UTF-8">
<title>게시글 작성</title>
<style>      
    body {
        padding-top: 20px;
        background-color: #f4f4f4; /* 밝은 갈색 계열의 배경 */
    }
    .navbar {
        background-color: #8b5a2b; /* 어두운 갈색 계열의 네비게이션 바 */
        border-radius: 15px; /* 라운드 디자인 적용 */
    }
    .navbar-brand {
        font-weight: bold;
        color: #fff; /* 밝은 색상의 로고 */
    }
    .btn {
        background-color: #8b4513; /* 어두운 갈색 계열의 버튼 */
        color: #fff;
        border-radius: 10px; /* 라운드 디자인 적용 */
    }
    .footer {
        padding: 20px 0;
        background-color: #deb887; /* 밝은 갈색 계열의 푸터 */
        border-radius: 15px; /* 라운드 디자인 적용 */
    }
    .table {
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 15px; /* 라운드 디자인 적용 */
    }
    .form-control {
        border-radius: 10px; /* 라운드 디자인 적용 */
    }
</style>
</head>
<body>
	<%
		String userMail = null;
		if(session.getAttribute("userMail") != null){
			userMail = (String) session.getAttribute("userMail");				
		}
		int bd_num = 0;
		if (request.getParameter("bd_num") != null)
		{
			bd_num = Integer.parseInt(request.getParameter("bd_num"));
		}
		
		if(userMail == null )
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 이동입니다.')");	
			script.println("location.href ='board.jsp'");
			script.println("</script>");
		}
		Board board = new BoardDAO().gettxt(bd_num);
		if(bd_num == 0 )
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 이동입니다.')");	
			script.println("location.href ='board.jsp'");
			script.println("</script>");
		}
		if(!userMail.equals(board.getUserMail()))
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 이동입니다.')");	
			script.println("location.href ='board.jsp'");
			script.println("</script>");
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">			
			<a class="navbar-brand" href="main.jsp" style="color: white;">개발자 자료 저장소</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-exapmple-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="logout.jsp">로그아웃</a></li>
			</ul>
		</div>	
	</nav>
			
			
		<div class="container">
			<div class="row">
			<form method="post" action="updateAction.jsp?bd_num=<%=bd_num %>">
			<table class="table" style="text-align: center;border: 1px solid gray;">
				<thead >
					<td></td>
				</thead>	
					<tbody>
						<tr>
							<td>제목</td>	
							<td><input type="text" class="form-controll" placeholder="글 제목" name="bd_title" maxlength="100" style="width: 100%" value="<%=board.getBd_title() %>"></td>							
						</tr>
						<tr>
							<td>내용</td>							
							<td><textarea type="text" class="form-controll" placeholder="글 내용" name="bd_txt" maxlength="2000" style="height: 500px; width: 100%"><%=board.getBd_txt() %></textarea></td>
						</tr>
					</tbody>							
				</table>			
					<input type="submit" href="write.jsp" class="btn pull-right" value="확인">
				
			</form>
				
									
			</div>	
		</div>

</body>
</html>