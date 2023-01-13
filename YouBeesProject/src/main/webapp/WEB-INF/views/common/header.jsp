<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:set var="path" value="${pageContext.request.contextPath}" />
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
                        <li><img src="${path}/resources/source/logo.png" alt="logo" class="logo"
                                onclick="location.href='main.me'"></li>
                        <li><a href="selectCategories.ma?sNum=1&sName=통번역"><span>프리랜서매칭</span></a></li>
                        <li><a href="boardList.bo"><span>커뮤니티</span></a></li>
                        <li>
                            <input class="searchBox" placeholder="무슨 서비스가 필요하신가요?"><img
                                src="${path}/resources/source/search.png" alt="search" class="searchBtn">
                        </li>
                        <c:choose>
                            <c:when test="${empty loginUserF and empty loginUserC}">
                                <li><a href="loginForm.me">로그인</a></li>
                                <li><a href="joinMain.me">회원가입</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="logout.me">로그아웃</a></li>
                                <c:choose>
                                    <c:when test="${empty loginUserF}">
                                        <li><a href="mypage.me?type=C">${loginUserC.name} 님</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a href="mypage.me?type=F">${loginUserF.name} 님</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </nav>
            </header>
        </body>

        </html>