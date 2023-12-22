	

<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.File" %>

<%@ page import="board.Board" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="board" class="board.Board" scope="page"></jsp:useBean>
<jsp:setProperty name="board" property="*"/>

<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>글작성 처리</title>
</head>
<body>
    <%
	    String fileSave = "fileSave";
		String real = application.getRealPath(fileSave);
        String loguserMail = null;
        if (session.getAttribute("userMail") != null) {
            loguserMail = (String) session.getAttribute("userMail");
        }

        if (loguserMail == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인을 하세요.');");
            script.println("location.href ='login.jsp';");
            script.println("</script>");
        } else {
            // 이미지 처리
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);
            if (isMultipart) {
                DiskFileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);

                try {
                	List<FileItem> items = upload.parseRequest(request);
                	String bd_title = null;
                	String bd_txt = null;
                	String fileName = null; // 파일 이름을 저장할 변수 선언

                	for (FileItem item : items) {
                	    if (!item.isFormField()) {
                	        // 이미지 파일 처리
                	        fileName = item.getName();
                	        
                	        // 파일명이 null이거나 비어있으면 기본 이미지 파일명으로 설정
                	        if (fileName == null || fileName.trim().equals("")) {
                	            fileName = "no.jpg";
                	        }

                	        String contentType = item.getContentType();
                	        boolean isInMemory = item.isInMemory();
                	        long sizeInBytes = item.getSize();
                	        
                	        // 파일을 저장할 경로 설정
                	        String filePath = real + "/" + fileName;
                	        File uploadedFile = new File(filePath);
                	        item.write(uploadedFile);

                	        // 이미지 경로를 Board 객체에 설정
                	        board.setBd_img(fileSave + "/" + fileName);
                	    } else {
                	        // 다른 폼 필드 처리
                	        String fieldName = item.getFieldName();
                	        String fieldValue = item.getString("UTF-8"); // UTF-8로 설정
                	        if (fieldName.equals("bd_title")) {
                	            bd_title = fieldValue;
                	        } else if (fieldName.equals("bd_txt")) {
                	            bd_txt = fieldValue;
                	        }
                        }
                    }
                    
                    // 제목과 내용이 비어 있지 않을 경우에만 데이터베이스에 삽입
                    if (bd_title != null && bd_txt != null && !bd_title.isEmpty() && !bd_txt.isEmpty()) {
                    	
                        BoardDAO boardDAO = new BoardDAO();
                        int result = boardDAO.write(bd_title, loguserMail, bd_txt, board.getBd_img());

                        if (result == -1) { // 작성 실패시
                            PrintWriter script = response.getWriter();
                            script.println("<script>");
                            script.println("alert('작성에 실패했습니다...');");
                            script.println("history.back();");
                            script.println("</script>");
                        } else if (result == -2) { // 불러오기 실패시
                            PrintWriter script = response.getWriter();
                            script.println("<script>");
                            script.println("alert('불러오기에 실패했습니다...');");
                            script.println("history.back();");
                            script.println("</script>");
                        } else {
                            PrintWriter script = response.getWriter();
                            script.println("<script>");
                            script.println("location.href = 'board.jsp';");
                            script.println("</script>");
                        }
                    } else {
                        // 제목 또는 내용이 비어있을 때 사용자에게 알림
                        PrintWriter script = response.getWriter();
                        script.println("<script>");
                        script.println("alert('제목과 내용을 입력해주세요.');");
                        script.println("history.back();");
                        script.println("</script>");
                    }
                    
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</body>
</html>