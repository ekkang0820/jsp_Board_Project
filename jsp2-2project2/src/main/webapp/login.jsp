<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>로그인</title>
<style>      
    body {
        background-color: #f4f4f4; /* 밝은 갈색 계열의 배경 */
        color: #5a4233; /* 어두운 갈색 계열의 텍스트 색상 */
    }
    .navbar {
        background-color: #8b5a2b; /* 어두운 갈색 계열의 네비게이션 바 */
    }
    .navbar-brand {
        color: #fff; /* 밝은 색상의 로고 */
    }
    .btn-primary {
        background-color: #8b4513; /* 어두운 갈색 계열의 버튼 */
        border-color: #8b4513;
    }
    .btn-secondary {
        background-color: #a0522d; /* 중간 갈색 계열의 버튼 */
        border-color: #a0522d;
    }
    .footer {
        background-color: #deb887; /* 밝은 갈색 계열의 푸터 */
        color: #5a4233; /* 어두운 갈색 계열의 텍스트 */
    }
</style>
</head>
<body>    
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="main.jsp">개발자 자료 저장소</a>
        </div>
    </nav>
    <div class="container mt-5">
        <div class="row">
            <div class="col-lg-4"></div>
            <div class="col-lg-4">
                <form method="post" action="loginAction.jsp">
                    <h2 class="text-center mb-4">로그인</h2>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="이메일" name="userMail" maxlength="30">                                            
                    </div>
                    
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="비밀번호" name="userPW" maxlength="20">
                    </div>
                    <div class="form-group">
                        <div class="text-right"> <!-- 오른쪽 정렬 -->
                            <input type="submit" value="로그인" class="btn btn-primary">
                            <button type="button" class="btn btn-secondary" onclick="window.location.href='join.jsp'">회원가입</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-lg-4"></div>
        </div>
    </div>
    <footer class="footer">
        <div class="container">
            <span class="text-muted">2023 개발자 자료 저장소. 201944010 강은규!!!</span>
        </div>
    </footer>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>