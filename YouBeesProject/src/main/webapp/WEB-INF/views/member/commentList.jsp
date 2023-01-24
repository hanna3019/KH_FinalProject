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
	<link rel="stylesheet" href="${path}/resources/css/commentList.css">
	<title>Document</title>
</head>

<body>
<!-- header -->
	<jsp:include page="../common/header.jsp"/>

    <main>
    <div class="mainTitle"><a href="myBoardList.bo?cusNum=${loginUserC.cusNum}">작성글</a></div>
	<c:forEach var="c" items="${list}">	
        <div class="commentList">
           <label onclick="location.href='boardRead.bo?bnum=${list.bnum}'"> 
            <div class="commentInfo">
               <div class=commentTitle>${c.title}</div>
               <div class="commentContent">${c.content}</div>
            </div>
            <div class="commentTimeNdelete">
			<div class="createTime">${c.regDate}</div>
			</label> 
			</div>
    </c:forEach>

       
    </main>

    
    

<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>

</html>