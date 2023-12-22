


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device=width",initial-scale="1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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
<script>
    // 이미지 필드의 변경 이벤트를 감지하고 이미지 및 name 속성 값을 설정합니다.
    function handleImageSelection() {
        var imageInput = document.getElementById("image");
        var imagePreview = document.getElementById("image-preview");

        // 이미지 필드에 파일이 선택되었을 때만 실행
        if (imageInput.files.length > 0) {
            var reader = new FileReader();

            reader.onload = function (e) {
                // 이미지 미리보기 엘리먼트에 선택한 이미지 표시
                imagePreview.src = e.target.result;
            };

            reader.readAsDataURL(imageInput.files[0]);
        } else {
            // 이미지 필드가 비어있을 때 기본 이미지 표시
            imagePreview.src = "no.jpg"; // 기본 이미지 파일명 설정

            // 이미지 필드의 name 속성을 기본값으로 설정
            imageInput.setAttribute("name", "no.jpg"); // 기본 name 속성 값 설정
        }
    }
</script>
</head>
<body>
    <nav class="navbar navbar-default">
        <div class="navbar-header">
            <a class="navbar-brand" href="main.jsp">개발자 자료 저장소</a>
        </div>
        <!-- 네비게이션 바 나머지 코드 -->
    </nav>

    <div class="container" >
    <br><br>
        <div class="row" style="margin-right: -100px;margin-left: -100px;">
            <form method="post" action="writeAction.jsp" enctype="multipart/form-data" style="width: 100%">
                <table class="table" style="text-align: center;">
                    <tbody >
                        <tr>
                            <td>제목</td>    
                            <td><input type="text" class="form-control" placeholder="글 제목" name="bd_title" maxlength="100" style="width: 100%"></td>                            
                        </tr>
                        <tr>
                            <td>내용</td>                            
                            <td><textarea class="form-control" placeholder="글 내용" name="bd_txt" maxlength="2000" style="height: 500px; width: 100%"></textarea></td>
                        </tr>
                       <tr>
					        <td>사진첨부</td>
					        <td>
					            <input type="file" name="image" id="image" onchange="handleImageSelection()" onerror="this.value='fileSave/no.jpg';">
					        </td>
					    </tr>
					    <tr>
					        <td></td>
					        <td>					          
					            <img src="fileSave/no.jpg" id="image-preview" style="max-width: 100px; max-height: 100px;">
					        </td>
					    </tr>
                    </tbody>                            
                </table>          
                <input type="submit" class="btn pull-right" value="확인">
            </form>
        </div>  
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>