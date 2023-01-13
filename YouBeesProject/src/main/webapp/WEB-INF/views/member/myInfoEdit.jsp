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
    <link rel="stylesheet" href="${path}/resources/css/edit.css">
    <title>Document</title>
</head>

<body>
<!-- header -->
	<jsp:include page="../common/header.jsp"/>
	
    <div class="editContainer">
        <form action="" method="">
            <div class="editTitle">회원정보 수정</div>
            <table class="editTable">
                <tr>
                    <th>프로필사진</th>
                    <td class="imgTd">
                        <img src="${path}/resources/source/santa.jpg" alt="원래사진" class="profileImg">
                        <label for="selectFile">
                            <img src="${path}/resources/source/camera.png" alt="파일선택" class="selectFileImg">
                        </label>
                        <input type="file" id="selectFile">
                    </td>
                </tr>
                <tr>
                    <th><label for="name">이름</label></th>
                    <td><input id="name" value=""></td>
                </tr>
                <tr>
                    <th><label for="id">아이디</label></th>
                    <td><input id="name" value="" readonly></td>
                </tr>
                <tr>
                    <th><label for="pw">패스워드</label></th>
                    <td><input type="password" value="" id="pw"></td>
                </tr>
                <tr>
                    <th><label for="cpw">패스워드 확인</label></th>
                    <td><input type="password" value="" id="cpw"></td>
                </tr>
                <tr>
                    <th><label for="phone">전화번호</label></th>
                    <td><input id="phone" value=""></td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td class="genderTd">
                        <input type="radio" value="" id="male" name="gender"><label for="male">남</label>
                        <input type="radio" value="" id="female" name="gender"><label for="female">여</label>
                    </td>
                </tr>
            </table>

            <button type="submit" class="editBtn">수정하기</button>
        </form>
    </div>

<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>      
</body>

</html>