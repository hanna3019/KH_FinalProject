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
    <link rel="stylesheet" href="${path}/resources/css/login.css">
    <title>Document</title>
</head>
<body>
<!-- header -->
	<jsp:include page="../common/header.jsp"/>
    <main class="login_content">
        <div class="login_title">로그인</div>
        <form action="login.me" method="post" class="login_form">
            <div class="col-1">
                <div class="text">아이디</div>
                <input type="text" name="userId" placeholder="아이디를 입력하세요.">
            </div>
            <div class="col-1">
                <div class="text">비밀번호</div>
                <input type="password" name="pass" placeholder="비밀번호를 입력하세요.">
            </div>
            <input type="submit" id="lg_submit" value="로그인">

            <div class="memHome">
                <a href="#">회원가입</a>
                <span>|</span>
                <a href="#">홈으로</a>
            </div>
        </form>
    </main>
    
<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>
<script>
 
    /* 로그인 버튼 클릭 메서드 */
    $(".login_button").click(function(){
        
        alert("로그인 버튼 작동");
        
    });
 
</script>
 
</html>