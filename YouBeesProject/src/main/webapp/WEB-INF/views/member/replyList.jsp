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
	<link rel="stylesheet" href="${path}/resources/css/replyList.css">
	<title>Document</title>
</head>

<body>
<!-- header -->
	<jsp:include page="../common/header.jsp"/>

    <main>
    	<div class="mainTitle"href="myReplyList.bo?name=${loginUserF.name}">작성댓글</div>
		
	<c:forEach var="r" items="${list}">	
        <div class="replyList">
        	<div onclick="location.href='boardRead.bo?bnum=${r.bnum}'"> 
            	<div class="replyContent">${r.cContent}</div>
				<div class="createTime">${r.regDate}</div> 
			</div> 
		</div>
    </c:forEach>
			

    </main>

    
    

<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>

</html>