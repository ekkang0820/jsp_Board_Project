<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "reply.Reply" %>
<%@ page import = "reply.ReplyDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "user.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
 


<head>
<meta http-equiv="Content-Type" content="text/html" charset=UTF-8">
<title>댓글 처리</title>
</head>
<body>
    <%
    	int bd_num = Integer.parseInt(request.getParameter("bd_num"));
    	String re_txt = request.getParameter("re_txt");
    	String replyuserMail = request.getParameter("replyUserMail");
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
		if(bd_num == 0 )
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 이동입니다.')");	
			script.println("location.href ='board.jsp'");
			script.println("</script>");
		}
		else{
			if (request.getParameter("re_txt")==null|| request.getParameter("re_txt")=="")
			{
	    		PrintWriter script = response.getWriter();
	            script.println("<script>");
	            script.println("alert('댓글을 입력해주세요.')");
	            script.println("history.back()");    // 이전 페이지로 사용자를 보냄
	            script.println("</script>");
	    	}    
	    	else{
	    		
	    		ReplyDAO replDAO = new ReplyDAO();
	    		
	            int result = replDAO.replywrite(replyuserMail, bd_num, re_txt);
	            %>
	           
	            <%
	 			if (result == -1){ // 작성 실패시
	            	PrintWriter script = response.getWriter();
	                script.println("<script>");
	                script.println("alert('댓글 작성에 실패했습니다...')");
	                script.println("history.back()"); 
	                script.println("</script>");
	            }
	 				            
	            else {
	            	
	                PrintWriter script = response.getWriter();
	                script.println("<script>");
	                script.println("alert('댓글 작성 성공!')");
	                script.println("location.href = document.referrer;");  
	                script.println("</script>");     
	                
	    		} 
	       
	    	}
    	
    }
    %>
 
</body>
</html>