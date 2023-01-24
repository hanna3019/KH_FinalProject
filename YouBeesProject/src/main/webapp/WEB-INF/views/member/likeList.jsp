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
	<link rel="stylesheet" href="${path}/resources/css/likeList.css?ab">
	<title>Document</title>
</head>

<body>
<!-- header -->
	<jsp:include page="../common/header.jsp"/>

    <main>
        <div class="mainTitle">찜한 목록</div>
        <div>
		<c:forEach var="d" items="${dList}">
	        <div class="likeList">
	        <c:choose>
	        	<c:when test="${ not empty d.f.changeName }">
		            <img src="${path}/${d.f.changeName}" alt="freelancer">
	        	</c:when>
	        	<c:otherwise>
		            <img src="${path}/resources/source/default.png" alt="freelancer">
	        	</c:otherwise>
	        </c:choose>
	            <div class="freelancerInfo">
	                <div class="freeLancerName" onclick="location.href='freelancerDetail.ma?freeNum=${d.freeNum}&cusNum=${d.cusNum}'">${d.f.name }</div>
	                <div class="location">${d.f.location }</div>
	                <div class="detail">${d.f.cateName }</div>
	            </div>
	            <div class="likeTimeNdelete">
	                <div class="createTime">${d.regDate }</div>
	
				</div>
			</div>
		</c:forEach>
		</div>
       
    </main>

    
    

<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>

</html>