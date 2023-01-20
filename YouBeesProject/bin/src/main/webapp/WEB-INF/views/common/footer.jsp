<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${path}/resources/css/footer.css">
<title>YouBees</title>
<body>
    <footer>
        <img src="${path}/resources/source/logo.png" alt="logo" class="logo">
        <div class="tou">
            <a href="#">이용약관</a> |
            <a href="#">개인정보처리방침</a> |
            <a href="#">자주묻는질문</a>
        </div>
        <div class="sns">
            <a><img src="${path}/resources/source/facebook.png" alt="facebook"></a>
            <a><img src="${path}/resources/source/instagram.png" alt="facebook"></a>
            <a><img src="${path}/resources/source/twitter.png" alt="facebook"></a>
        </div>
        <div>
            주소: 서울특별시 영등포구 이레로 3길, 5 | 사업자등록번호: 123-45-67890 | TEL: 02-111-222
        </div>
        <div>
            Copyright &copy; 2023 YouBees. All Rights Reserved.
        </div>
    </footer>
</body>
</html>