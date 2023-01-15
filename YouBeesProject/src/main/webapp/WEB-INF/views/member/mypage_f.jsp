<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="/___vscode_livepreview_injected_script"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${path}/resources/css/myPage_f.css">
    <title>YouBees</title>
</head>

<body>
	<!-- header -->
	<jsp:include page="../common/header.jsp"/>
	
    <main>
        <div class="myPageContainer">
            <div class="myPageTitle">마이페이지</div>

            <div class="profileBox">
                <img class="profileImg" src="${path}/resources/source/freelance.png" alt="프리랜서로고" onclick=""></a>
                <div class="userInfo" onclick="location.href='myInfoEdit.me'">
                    <div>변진주 프리랜서님</div>
                </div>
            </div>

            <table id="profileContent">
                <tr>
                    <th class="title"><a href="freeProfile.ma?fNum=${loginUserF.freeNum}">내 프로필</a></th>
                </tr>
                <tr>
                    <th class="title"><a href="recievedRequest.re">받은요청</a></th>
                </tr>
                <tr>
                    <th class="title"><a href="matchedFree.ma">매칭내역</a></th>
                </tr>
                <tr>
                    <th class="title"><a href="#">커뮤니티 작성글/댓글</a></th>
                </tr>
                <tr>
                    <th class="title"><a href="#">1:1 문의</a></th>
                </tr>
            </table>
        </div>
    </main>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
	
</body>

</html>