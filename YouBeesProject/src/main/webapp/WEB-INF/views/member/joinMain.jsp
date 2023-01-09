<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${path}/resources/css/joinMain.css">

    <title>Document</title>

</head>

<body>
<!-- header -->
	<jsp:include page="../common/header.jsp"/>
	
    <div class="joinMainContainer">
        <div class="joinTitle">회원가입</div>
        <div class="joinSelectBox">
            <div class="normalBox" onclick="location.href='customerEnrollForm.me'">
                    <img class="normalImg" src="${path}/resources/source/reading.png" alt="회원로고">
                <div>
                    <p>일반회원</p>
                </div>
            </div>

            <div class="freelancerBox" onclick="location.href='FreelancerEnrollForm.me'">
                    <img class="freelaceImg" src="${path}/resources/source/freelance.png" alt="회원로고">
                <div>
                    <p>프리랜서</p>
                </div>
            </div>
        </div>
    </div>

<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>

</html>