<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "reply.Reply"%>
<%@ page import = "reply.ReplyDAO"%>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "user.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
 


<head>
<meta http-equiv="Content-Type" content="text/html" charset=UTF-8">
<title>글작성 처리</title>
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
		
		int re_num = 0;
		if (request.getParameter("re_num") != null)
		{
			
			re_num = Integer.parseInt(request.getParameter("re_num")) ;
		}
		
	
		
		if(re_num == 0 )
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 이동입니다.')");	
			script.println("location.href ='board.jsp'");
			script.println("</script>");
		}
		else{
				ReplyDAO replyDAO = new ReplyDAO();
				int result = replyDAO.delete(re_num);
				if(result == -1)
				{
					PrintWriter script = response.getWriter();
		            script.println("<script>");
		            script.println("alert('삭제 실패.')");
		            script.println("history.back()");  
		            script.println("</script>");
				}
				else
				{
	    		PrintWriter script = response.getWriter();	    		
	            script.println("<script>");
	            script.println("alert('삭제가 완료 되었습니다.')");
	            script.println("location.href = document.referrer;");	            
	            script.println("</script>");
				}
	    	
		}
    	
    
    %>
 
</body>
</html>