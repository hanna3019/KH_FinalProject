<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${path}/resources/css/likeList.css">
	<title>Document</title>
</head>

<body>
<!-- header -->
	<jsp:include page="../common/header.jsp"/>

    <main>
        <div class="mainTitle">찜한 목록</div>

        <div class="likeList">
            <img src="${path}/resources/source/freelancer.png" alt="freelancer">
            <div class="freelancerInfo">
                <div class="freeLancerName">변진주</div>
                <div class="location">서울 영등포구</div>
                <div class="detail">취미 / 50,000원~100,000원 / 토요일, 일요일</div>
            </div>
            <div class="likeTimeNdelete">
                <div class="createTime">2시간 전</div>

			</div>
			</div>
       

       <div class="likeList">
            <img src="${path}/resources/source/freelancer.png" alt="freelancer">
            <div class="freelancerInfo">
                <div class="freeLancerName">변진주</div>
                <div class="location">서울 영등포구</div>
                <div class="detail">취미 / 50,000원~100,000원 / 토요일, 일요일</div>
            </div>
            <div class="likeTimeNdelete">
                <div class="createTime">2시간 전</div>

			</div>
			</div>
       
    </main>

    
    

<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>

</html>