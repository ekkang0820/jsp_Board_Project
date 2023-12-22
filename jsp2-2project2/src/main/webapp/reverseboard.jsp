<%@page import="reply.ReplyDAO"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.Board"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="BoardDAO" class="board.BoardDAO"/>
<jsp:useBean id="ReplyDAO" class="reply.ReplyDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device=width",initial-scale="1"><!--부트스트랩 반응형 웹-->
<link rel="stylesheet" href="css/bootstrap.css">
<meta charset="UTF-8">
<title>게시글</title>
 <style>      
    body {
        padding-top: 20px;
        background-color: #f4f2ec; /* 배경 색상을 갈색 계열로 변경 */
    }
    .navbar-brand {
        font-weight: bold;
        color: #8b4513; /* 네비게이션 바 브랜드 색상 변경 */
    }
    .footer {
        padding: 20px 0;
        background-color: #a0522d; /* 푸터 색상 변경 */
        text-align: center;
        color: white; /* 푸터 텍스트 색상 변경 */
    }
    .table-responsive {
        margin-top: 20px;
    }
    .navbar-default {
        background-color: #a0522d; /* 네비게이션 바 색상 변경 */
        border-color: #8b4513; /* 네비게이션 바 테두리 색상 변경 */
    }
    .navbar-default .navbar-nav>li>a {
        color: white; /* 네비게이션 바 아이템 색상 변경 */
    }
    .table {
        border: 1px solid #8b4513; /* 테이블 테두리 색상 변경 */
    }
    .table thead {
        background-color: #a0522d; /* 테이블 헤더 배경 색상 변경 */
        color: #8b4513; /* 테이블 헤더 텍스트 색상 변경 */
    }
    a, a:hover {
        color: #8b4513; /* 링크 및 링크 호버 색상 변경 */
    }
    .btn-primary {
        background-color: #8b4513; /* 버튼 색상 변경 */
        border-color: #8b4513; /* 버튼 테두리 색상 변경 */
    }
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		int pagenumber = 1;
		String keyword = new String();		
		String searchoption = new String();	
		keyword = "";
		searchoption = "all";
		if(request.getParameter("keyword") != null)
		{
			keyword = request.getParameter("keyword");
		}
		if(request.getParameter("searchoption") != null)
		{
			searchoption = request.getParameter("searchoption");
		}
		 	 	
	
	    int totalpage = BoardDAO.selectCnt(keyword);
		String userMail = null;
		if(session.getAttribute("userMail") != null){
			userMail = (String) session.getAttribute("userMail");
		}
		
		if(request.getParameter("pagenumber") != null)
		{
			pagenumber = Integer.parseInt(request.getParameter("pagenumber"));
		}
		
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			
			<a class="navbar-brand" href="main.jsp" style="color: white;">개발자 자료 저장소</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-exapmple-navbar-collapse-1">
			<%if(userMail == null){ %>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="login.jsp">로그인</a></li>
				<li><a href="join.jsp">회원가입</a></li>				
			</ul>
			<%}else{ %>
		
							
			<ul class="nav navbar-nav navbar-right">
				<li><a href="write.jsp" class="btn pull-right">글작성</a></li>
				<li><a href="logout.jsp">로그아웃</a></li>				
			</ul>
			<%}
			
			%>
				
			</div>
			<div class="nav navbar-nav navbar-right">
			
        	</div>
			<form method="post" action="board.jsp?pagenumber=1" class="navbar-form navbar-right" role="search">
			    <div class="form-group">
			        <select class="form-control" name="searchoption" id="searchoption">		        
			            <option value="all">전체</option>
			            <option value="title">제목</option>
			            <option value="txt">내용</option>
			            <option value="reply">댓글</option>
			        </select>   	        
			        <input type="text" class="form-control" name="keyword" placeholder="검색어">
			    </div>
			    <button type="submit" class="btn btn-default">검색</button>
			</form>
			       		
       		
   	
	</nav>
			
			
		<div class="container">
			<div class="row">
				<table class="table" style="text-align: center;border: 1px solid gray; background-color: white;">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">제목</th>
							<th style="background-color: #eeeeee; text-align: center;">닉네임</th>
							<th style="background-color: #eeeeee; text-align: center;">댓글 수 </th>
							<th style="background-color: #eeeeee; text-align: center;"><a href="board.jsp">작성일▼</a></th>							
						</tr>
					</thead>
					<%
						
						ArrayList li = new ArrayList();
						if(searchoption.equals("title"))
						{
							li = BoardDAO.rgetListtitle(pagenumber, keyword);
						}
						else if(searchoption.equals("txt"))
						{
							li = BoardDAO.rgetListtxt(pagenumber, keyword);
						}
						else if(searchoption.equals("reply"))
						{
							li = BoardDAO.rgetListreply(pagenumber, keyword);
						}
						else
						{
						li = BoardDAO.rgetList(pagenumber, keyword);
						}
						String NICKNAME = new String();
						String Ninkresult = new String();
						int bd_num = 0;
						SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
						
						for (int i = 0; i < li.size();i++)
						{
							
							Board bd = (Board)li.get(i);
							bd_num = bd.getBd_num();
							NICKNAME = bd.getUserMail();
							Ninkresult = BoardDAO.Nick(NICKNAME); 
						
					%>
					
					<tbody>
						<tr>
							<td><a href = "view.jsp?bd_num=<%= bd.getBd_num() %>"><%= bd.getBd_title().replaceAll(" ","&nbsp;").replaceAll(" ","&lt;").replaceAll(" ","&rt;").replaceAll("\n","<br>;") %></a></td>
							<td><%= Ninkresult.replaceAll(" ","&nbsp;").replaceAll(" ","&lt;").replaceAll(" ","&rt;").replaceAll("\n","<br>;") %></td>
							<td><%= ReplyDAO.replycount(bd_num) %></td>
							<td><%= sd.format(bd.getBd_date()) %></td>
						</tr>
						<%
							}
						%>
					</tbody>
												
				</table>
				<div style="background-color: white" align="center"><h4>
				<%
					
					if(pagenumber != 1)
					{
				%>
				<a href="reverseboard.jsp?pagenumber=<%=pagenumber - 1%>&keyword=<%=keyword %>&searchoption=<%=searchoption %>" class="btn btn-primary">이전</a>
				<%
					}
				%>
				<%
					
					
					if(pagenumber == 2)
					{
						%>
						<a href="reverseboard.jsp?pagenumber=1&keyword=<%=keyword %>&searchoption=<%=searchoption %>" >1 | </a>
						<%
					}
					else if(pagenumber >= 3)
					{
					int prepageindex = 3;
					int prepageflag = 0;
					for(int i = pagenumber;i <= totalpage ; i++)
					{
						prepageflag = prepageflag + 1;
						if(prepageflag>=prepageindex)
						{
							break;
						}
				%>
				<a href="reverseboard.jsp?pagenumber=<%=i-2  %>&keyword=<%=keyword %>&searchoption=<%=searchoption %>" ><%= i-2 %> | </a>
				<%
					
					}
					if(pagenumber == totalpage){
					
				%>				
				 	<a href="reverseboard.jsp?pagenumber=<%=pagenumber-1 %>&keyword=<%=keyword %>&searchoption=<%=searchoption %>" ><%= pagenumber-1 %> | </a>
				<%
					}
					}
				%>
				<a href="reverseboard.jsp?pagenumber=<%=pagenumber%>&keyword=<%=keyword %>&searchoption=<%=searchoption %>" class="btn btn-primary"><%=pagenumber%></a>
				<%
					int nextpageindex = 3;
					int nextpageflag = 0;
					if(totalpage > 3 ){
					for(int i = pagenumber;i < totalpage ; i++)
					{
						nextpageflag = nextpageflag + 1;
						if(nextpageflag >= nextpageindex)
						{
							break;
						}
				%>
				<a href="reverseboard.jsp?pagenumber=<%=i+1  %>&keyword=<%=keyword %>&searchoption=<%=searchoption %>" > | <%= i+1 %></a>
				
				<%
					}
				
					}
				else if(totalpage == 2 && pagenumber != 2){
				%>
				<a href="reverseboard.jsp?pagenumber=2&keyword=<%=keyword %>&searchoption=<%=searchoption %>" > | 2</a>
				<%
					}
				if(BoardDAO.nextPage(pagenumber + 1 )&& totalpage != pagenumber){
				%>
			    
				<a href="reverseboard.jsp?pagenumber=<%=pagenumber + 1%>&keyword=<%=keyword %>&searchoption=<%=searchoption %>" class="btn btn-primary">다음</a>
				<%
					
				}
					
				%>
				
				</h4>
				</div>


									
			</div>	
		</div>

</body>
</html>