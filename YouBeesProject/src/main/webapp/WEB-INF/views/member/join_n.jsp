<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${path}/resources/css/join_n.css">

    <title>Document</title>

<body>
<!-- header -->
	<jsp:include page="../common/header.jsp"/>
	
    <div class="container">
        <form action="" method="">
            <table id="loginTable">
                <div class="title">일반 회원가입</div>
                <tr>
                    <td class="closer">*이름</td>
                    <td><input name="name" type="text" required placeholder=""></td>
                </tr>
                <tr>
                    <td class="closer">*아이디</td>
                    <td><input id="userId" name="id" type="text" required placeholder=""></td>
                </tr>
                <tr>
                    <td class="closer">*비밀번호</td>
                    <td><input type="password" name="password" required placeholder=""></td></br>
                </tr>
                <tr>
                    <td class="closer">*비밀번호 확인</td>
                    <td><input name="password" name="repwd" required placeholder=""></td>
                </tr>
                <tr>
                    <td class="closer">*전화번호</td>
                    <td><input name="phone" required placeholder=""></td>
                </tr>
            </table>

            <div class="tou">
                <div class="tou1" colspan="2"><input class="agree" type="checkbox" name="agree" required
                        value="Y,N">이용약관 동의 (필수)
                </div>
                <div class="tou2" colspan="2"><input class="agree" type="checkbox" name="agree" required
                        value="Y,N">개인정보
                    수집 및 동의
                    (필수)</div>

                <div class="tou3" colspan="2"><input class="agree" type="checkbox" name="agree" required value="Y,N">만
                    14세 이상 (필수)
                </div>
            </div>

            <div class="joinSubmit">
                <input class="submit" type="submit" value="회원가입">
                <input class="submit" type="reset" value="돌아가기">
            </div>
        </form>
    </div>
<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>

</html>