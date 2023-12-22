<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "user.UserDAO" %>
<%@ page import = "board.BoardDAO" %>
<%@ page import = "board.Board"%>
<%@ page import = "reply.Reply"%>
<%@ page import = "reply.ReplyDAO"%>
<jsp:useBean id="ReplyDAO" class="reply.ReplyDAO"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device=width",initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<meta charset="UTF-8">
<title>게시글</title>
<style>      
    body {
        padding-top: 20px;
        background-color: #f4f4f4; /* 밝은 갈색 계열의 배경 */
    }
    .navbar {
        background-color: #8b5a2b; /* 어두운 갈색 계열의 네비게이션 바 */
    }
    .navbar-brand {
        font-weight: bold;
        color: #fff; /* 밝은 색상의 로고 */
    }
    .btn {
        background-color: #8b4513; /* 어두운 갈색 계열의 버튼 */
        color: #fff;
    }
    .footer {
        padding: 20px 0;
        background-color: #deb887; /* 밝은 갈색 계열의 푸터 */
    }
    .table {
        background-color: #fff;
        border: 1px solid #ddd;
    }
    .table th {
        background-color: #f5f5f5;
    }
</style>
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
		int bd_num = 0;
		if (request.getParameter("bd_num") != null)
		{
			bd_num = Integer.parseInt(request.getParameter("bd_num"));
		}
		if(bd_num == 0 )
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href ='board.jsp'");
			script.println("</script>");
		}
		Board board = new BoardDAO().gettxt(bd_num);
		String writerMail = new BoardDAO().gettxt(bd_num).getUserMail();
		String nickname = new BoardDAO().Nick(writerMail);
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			
			<a class="navbar-brand" href="main.jsp" style="color: white;">개발자 자료 저장소</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-exapmple-navbar-collapse-1">
			<%if(userMail == null){ %>
			<ul class="nav navbar-nav navbar-right" >
				<li><a href="login.jsp" style="color: white;">로그인</a></li>
				<li><a href="join.jsp" style="color: white;">회원가입</a></li>				
			</ul>
			<%}else{ %>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="logout.jsp" >로그아웃</a></li>
			</ul>
			<%} %>	
			</div>	
	</nav>
			
			
		<div class="container">
			<div class="row">
			<form method="post" action="writeAction.jsp">
			<table class="table" style="text-align: center;border: 1px solid gray;">
				<thead >
					<tr>
						<th colspan="3" style="background-color: #eeeeee; text-align:center"></th>
					</tr>
				</thead>	
					<tbody>
						<tr>
							<td style="width: 20%";>제목</td>
							<td colspan="2"><%= board.getBd_title().replaceAll(" ","&nbsp;").replaceAll(" ","&lt;").replaceAll(" ","&rt;").replaceAll("\n","<br>;") %></td>
						</tr>
						<tr>
							<td style="width: 20%";>닉네임</td>
							<td colspan="2"><%= nickname.replaceAll(" ","&nbsp;").replaceAll(" ","&lt;").replaceAll(" ","&rt;").replaceAll("\n","<br>;")%></td>
						</tr>
						<tr>
							<td style="width: 20%";>작성일자</td>
							<td colspan="2"><%= board.getBd_date()%></td>
						</tr>
						<tr>
							<td colspan="2" style="width: 20% ;border: 1px solid gray;">내용</td>
							</tr>
							<tr>							
							<td colspan="2	" style="min-height:200px ; text-align: left;"><%= board.getBd_txt().replaceAll(" ","&nbsp;").replaceAll(" ","&lt;").replaceAll(" ","&rt;").replaceAll("\n","<br>")%></td>
						</tr>
						<tr>
						    <td colspan="2" style="width: 20% ;border: 1px solid gray;">이미지</td>
						</tr>
						<tr>
						    <td colspan="2" style="text-align: center;">						         
						        <img src="<%= board.getBd_img() %>" alt="이미지" style="max-width: 100%; height: auto;"onerror="this.src='fileSave/no.jpg';">
						    </td>
						</tr>
							
					</tbody>
					
											
				</table>			
					<a href="board.jsp"  style="margin-left: 85%">목록으로 이동</a>	
					<%
						if(userMail != null && userMail.equals(board.getUserMail()))
						{
					%>
						<a href="update.jsp?bd_num=<%=bd_num %>"> | 수정 |</a>
						<a href="delete.jsp?bd_num=<%=bd_num %>"> 삭제</a>
					<%
						}

					%>
				
			</form>
													
			</div>
			<%if(userMail != null){ %>	
			<form method="post" action="reply.jsp?replyUserMail=<%= userMail %>&bd_num=<%=bd_num %>">
			<textarea type="text" class="form-controll" placeholder="댓글 작성" name="re_txt" maxlength="300" style="margin-top: 50px; height: 100px; width: 100%"></textarea>
			<input style="margin-left: 95%" type="submit" class="btn btn" value="확인">
			</form>
			<%} %>
			</div>

			<div class = "row">
			<table class="table" style="text-align: center;border: 1px solid gray;">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">닉네임</th>
							<th style="background-color: #eeeeee; text-align: left;">댓글내용</th>
							<th style="background-color: #eeeeee; text-align: center;">작성일</th>
							<th style="background-color: #eeeeee; text-align: center;"></th>
							
														
						</tr>
					</thead>
					<%
						
						ArrayList li = new ArrayList();
						li = ReplyDAO.replytxt(bd_num);
						String NICKNAME = new String();
						String Ninkresult = new String();
						SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
						
						for (int i = 0; i < li.size();i++)
						{
							
							Reply re = (Reply)li.get(i);
							NICKNAME = re.getUserMail();
							Ninkresult = ReplyDAO.Nick(NICKNAME); 
						
					%>
					<tbody>
						<tr>							
							<td><%= Ninkresult.replaceAll(" ","&nbsp;").replaceAll(" ","&lt;").replaceAll(" ","&rt;").replaceAll("\n","<br>;") %></td>
							<td style="text-align: left; width: 80%;"><%= re.getRe_txt().replaceAll(" ","&nbsp;").replaceAll(" ","&lt;").replaceAll(" ","&rt;").replaceAll("\n","<br>;") %></td>
							<td><%= sd.format(re.getRe_date()) %></td>
							
							<%
								if(NICKNAME.equals(userMail))
								{
							%>
							<td><a href="replydelete.jsp?re_num=<%=re.getRe_num()%>">삭제</a></td>
							<%} %>
						</tr>
						<%
							}
						%>
					</tbody>
												
				</table>
			</div>	
		</div>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		

</body>
</html>