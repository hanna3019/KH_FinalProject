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
<link rel="stylesheet" href="${path}/resources/css/header.css">
<title>Insert title here</title>
</head>
<body>
    <header>
        <nav>
            <ul>
                <li><img src="${path}/resources/source/logo.png" alt="logo" class="logo" onclick=""></li>
                <li><a href="selectCategories.ma?sNum=1&sName=통번역"><span>프리랜서매칭</span></a></li>
                <li><a href="boardList.bo"><span>커뮤니티</span></a></li>
                <li>
                    <input class="searchBox" placeholder="무슨 서비스가 필요하신가요?"><img src="${path}/resources/source/search.png" alt="search"
                        class="searchBtn">
                </li>
                <li><a href="loginForm.me">로그인</a></li>
                <li><a href="joinMain.me">회원가입</a></li>
                <!-- 로그인 후
                <li><a href="">로그아웃</a></li>
                <li><a href="">홍길동 님</a></li>
                 -->
            </ul>
        </nav>
    </header>
</body>
</html>