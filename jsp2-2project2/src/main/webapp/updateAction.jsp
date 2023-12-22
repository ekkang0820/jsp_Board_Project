<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board.Board"%>
<%@ page import = "board.BoardDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "user.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
 


<head>
<meta http-equiv="Content-Type" content="text/html" charset=UTF-8">
<title>글수정 처리</title>
</head>

<body>
    <%
		String loguserMail = null;
		if(session.getAttribute("userMail")!=null){
			
			loguserMail = (String)session.getAttribute("userMail");
		}
		if(loguserMail == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href ='login.jsp'"); 
			script.println("</script>");
		}		
		int bd_num = 0;
		if (request.getParameter("bd_num") != null)
		{
			bd_num = Integer.parseInt(request.getParameter("bd_num"));
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
		else{
			if (request.getParameter("bd_title")==null|| request.getParameter("bd_txt")==null
					||request.getParameter("bd_title").equals("")|| request.getParameter("bd_txt").equals("")){
	    		PrintWriter script = response.getWriter();
	            script.println("<script>");
	            script.println("alert('모든항목을 입력해주세요.')");
	            script.println("history.back()");    // 이전 페이지로 사용자를 보냄
	            script.println("</script>");
	    	}    
	    	else{
	    		
	    		BoardDAO boardDAO = new BoardDAO();
	            int result = boardDAO.update(bd_num,request.getParameter("bd_title"),request.getParameter("bd_txt"));	           	             
	 			if (result == -1){ // 작성 실패시
	            	PrintWriter script = response.getWriter();
	                script.println("<script>");
	                script.println("alert('수정에 실패했습니다...')");
	                script.println("history.back()"); 
	                script.println("</script>");
	            }
	 			if (result == -2){ // 불러오기 실패시
	            	PrintWriter script = response.getWriter();
	                script.println("<script>");
	                script.println("alert('불러오기에 실패했습니다...')");
	                script.println("history.back()"); 
	                script.println("</script>");
	            }
	            
	            else {
	            	
	                PrintWriter script = response.getWriter();
	                script.println("<script>");
	                script.println("location.href = 'board.jsp'"); 
	                script.println("</script>");            
	    		}
		}
    	
    }
    %>
 
</body>
</html>