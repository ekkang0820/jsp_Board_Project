<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset=UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1" >
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>회원가입</title>
<style>      
    body {
        padding-top: 20px;
        background-color: #f4f4f4; /* 로그인 페이지와 유사한 배경 색상 */
    }
    .navbar {
        background-color: #8b5a2b; /* 로그인 페이지와 유사한 네비게이션 바 색상 */
    }
    .navbar-brand {
        font-weight: bold;
        color: #fff; /* 로그인 페이지와 유사한 로고 색상 */
    }
    .btn-primary, .btn-secondary {
        width: 100%; /* 버튼의 너비를 전체로 설정 */
        margin-top: 10px; /* 버튼 간격 */
    }
    .footer {
        padding: 20px 0;
        background-color: #deb887; /* 로그인 페이지와 유사한 푸터 색상 */
    }
</style>
</head>
<body>
    <nav class="navbar navbar-expand-lg">
        <div class="navbar-header">            
            <a class="navbar-brand" href="main.jsp">개발자 자료 저장소</a>
        </div>      
    </nav>
   
    <div class="container">
        <div class="row">
            <div class="col-lg-4"></div>
            <div class="col-lg-4">
            <br>
                <form method="post" action="joinAction.jsp">
                
                    <h2 class="text-center text-navy mb-4">회원가입</h2>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="이메일" name="userMail" maxlength='30'>
                    </div>
                    <div class="form-group">
                        <input type="button" class="btn btn-secondary" value="중복확인" onclick='return submit2(this.form)';>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="비밀번호" name="userPW" maxlength='20'>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="닉네임" name="userNick" maxlength='20'>
                    </div>
                    <div class="form-group">
                        <input type="button" class="btn btn-primary" value="회원가입" onclick='return submit1(this.form)'>
                    </div>
                </form>
            </div>
            <div class="col-lg-4"></div>
        </div>
    </div>
    <script> 
        function submit1(frm) { 
            frm.action='joinAction.jsp'; 
            frm.submit(); 
            return true; 
        } 
    </script> 
    <script> 
        function submit2(frm) { 
            frm.action='checkEmail.jsp'; 
            frm.submit(); 
            return true; 
        } 
    </script> 
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>