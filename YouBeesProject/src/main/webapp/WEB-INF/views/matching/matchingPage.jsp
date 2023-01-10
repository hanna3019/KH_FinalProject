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
    <title>Document</title>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/matching.css?a">
</head>

<body>
<!-- header -->
	<jsp:include page="../common/header.jsp"/>
	
    <div id="container">
        <div class="service_icons">
            <div onclick="location.href='selectCategories.ma?sNum=1&sName=통번역'">
                <img class="main_translation" src="${path}/resources/source/translate.png" alt="번역아이콘" onclick="">
                <p>통번역</p>
            </div>
            <div onclick="location.href='selectCategories.ma?sNum=2&sName=마케팅'">
            	<img class="main_marketing" src="${path}/resources/source/marketing.png" alt="마케팅아이콘" onclick="">
                <p>마케팅</p>
            </div>
            <div onclick="location.href='selectCategories.ma?sNum=3&sName=컨설팅'">
            	<img class="main_consulting" src="${path}/resources/source/consulting.png" alt="컨설팅아이콘" onclick="">
                <p>컨설팅</p>
            </div>
            <div onclick="location.href='selectCategories.ma?sNum=4&sName=보안'">
            	<img class="main_security" src="${path}/resources/source/security.png" alt="보안아이콘" onclick="">
                <p>보안</p>
            </div>
            <div onclick="location.href='selectCategories.ma?sNum=5&sName=인쇄'">
            	<img class="main_print" src="${path}/resources/source/print.png" alt="인쇄아이콘" onclick="">
                <p>인쇄</p>
            </div>
            <div onclick="location.href='selectCategories.ma?sNum=6&sName=기타'">
            	<img class="main_etc" src="${path}/resources/source/etc.png" alt="기타아이콘">
                <p>기타</p>
            </div>
        </div>
    </div>
    <div class="categories">
        <h2 class="title">${sName}</h2>
        <c:forEach var="c" items="${sList}">
	        <div><img src="${path}/resources/source/service${c.cateNum}.jpg" alt="">
	            <p>${c.name}</p>
	        </div>        
        </c:forEach>
    </div>
    </div>
    
<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>

</html>