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
    <link rel="stylesheet" href="${path}/resources/css/matched_f.css">
    <title>YouBees</title>
</head>

<body>
	<!-- header -->
	<jsp:include page="../common/header.jsp"/>
	
    <main>
        <div class="mainTitle">매칭내역</div>
        <div class="requestProfile">
            <img src="${path}/resources/source/user.png" alt="user" class="user">
            <div class="requestInfo" onclick="">
                <div class="userName">정한나</div>
                <div class="location">서울 영등포구</div>
                <div class="detail">취미 / 50,000원 ~ 100,000원 / 토요일, 일요일</div>
            </div>
            <div class="requestTimeNdelete">
                <div class="createTime">2시간 전</div>
                <div class="btns">
                    <input type="button" value="채팅" class="chatBtn">
                </div>
            </div>
            <img src="${path}/resources/source/x.png" alt="x" class="delete">
        </div>
    </main>
    
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
	 
</body>

</html>