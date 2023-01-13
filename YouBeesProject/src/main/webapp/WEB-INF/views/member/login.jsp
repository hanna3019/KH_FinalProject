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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>
<body>
<!-- header -->

	<jsp:include page="../common/header.jsp"/>
	
	<c:choose>
		<c:when test="${not empty errorMsg}">
			<script>
			Swal.fire({
						icon: 'error',  // 여기다가 아이콘 종류를 쓰면 됩니다.                     
				  		text: '${errorMsg}',    
				});
			</script>	
		</c:when>	
	</c:choose>
    <main class="login_content">
        <div class="login_title">로그인</div>
        <form action="login.me" method="post" name="login_form" class="login_form">
            <div class="col-1">
                <div class="text">아이디</div>
                <input type="text" name="userId" placeholder="아이디를 입력하세요.">
            </div>
            <div class="col-1">
                <div class="text">비밀번호</div>
                <input type="password" name="pass" placeholder="비밀번호를 입력하세요.">
            </div>
            <input type="button" id="lg_submit" value="로그인" onclick="logincheck();">

            <div class="memHome">
                <a href="joinMain.me">회원가입</a>
                <span>|</span>
                <a href="main.me">홈으로</a>
            </div>
        </form>
    </main>
    
<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>
<script>
    /* 아이디 비밀번호 입력 안 한 경우 */
	function logincheck(){
    	 if(login_form.userId.value == ""){
    		alert("아이디를 입력해주세요.");
    		login_form.userId.focus();
    		
    	} else if (login_form.pass.value == ""){
    		alert("비밀번호를 입력해주세요.");
    		login_form.pass.focus();
    		
    	} else {
    		login_form.submit();
    	} 
    }
 
    </script>
</html>