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
    	<div class="mainTitle">작성 글/작성 댓글</div>
    
        <div class="subTitle"><a href="commentList.jsp" selected>작성 글</a></div>
        <div class="subTitle"><a href="replyList.jsp">작성 댓글</a></div>
		
        <div class="replyList">
           <label onclick="location.href=''">
            <div class="replyInfo">
                <div class="contentTitle">정한나</div>
                <div class="detail">너무 어렵네요</div>
            </div>
            <div class="replyTimeNdelete">
                <div class="createTime">2시간 전</div>
			</label> 
			</div>
			</div>
       

       <div class="replyList">
           <label onclick="location.href=''">
            <div class="replyInfo">
                <div class="contentTitle">정한나</div>
                <div class="detail">너무 어렵네요</div>
            </div>
            <div class="replyTimeNdelete">
                <div class="createTime">2시간 전</div>
			</label> 
			</div>
			</div>
       
    </main>

    
    

<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>

</html>