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
            <div>
                <img class="main_translation" src="${path}/resources/source/translate.png" alt="번역아이콘" onclick="">
                <p>번역</p>
            </div>
            <div><img class="main_marketing" src="${path}/resources/source/marketing.png" alt="마케팅아이콘" onclick="">
                <p>마케팅</p>
            </div>
            <div><img class="main_consulting" src="${path}/resources/source/consulting.png" alt="컨설팅아이콘" onclick="">
                <p>컨설팅</p>
            </div>
            <div><img class="main_security" src="${path}/resources/source/security.png" alt="보안아이콘" onclick="">
                <p>보안</p>
            </div>
            <div><img class="main_print" src="${path}/resources/source/print.png" alt="인쇄아이콘" onclick="">
                <p>인쇄</p>
            </div>
            <div><img class="main_etc" src="${path}/resources/source/etc.png" alt="기타아이콘">
                <p>기타</p>
            </div>
        </div>
    </div>
    <div class="categories">
        <h2 class="title">통번역</h2>
        <div><img src="${path}/resources/source/service1.jpg" alt="">
            <p>영어 통번역</p>
        </div>
        <div><img src="${path}/resources/source/service2.jpg" alt="">
            <p>중국어 통번역</p>
        </div>
        <div><img src="${path}/resources/source/service3.jpg" alt="">
            <p>일어 통번역</p>
        </div>
        <div><img src="${path}/resources/source/service4.jpg" alt="">
            <p>독일어 통번역</p>
        </div>
        <div><img src="${path}/resources/source/service5.jpg" alt="">
            <p>프랑스어 통번역</p>
        </div>
        <div><img src="${path}/resources/source/service6.jpg" alt="">
            <p>러시아어 통번역</p>
        </div>
    </div>
    </div>
    
<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>

</html>