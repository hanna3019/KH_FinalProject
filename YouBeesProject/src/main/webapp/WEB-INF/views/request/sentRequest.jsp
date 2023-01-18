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
    <link rel="stylesheet" href="${path}/resources/css/sentRequest.css?b">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="${path}/resources/js/profile.js"></script>
    <title>YouBees</title>
</head>

<body>
	<!-- header -->
	<jsp:include page="../common/header.jsp"/>

    <main>
    
        <div class="mainTitle">보낸요청</div>
        
        <!-- 요청 1 -->
        <c:forEach var="s" items="${sList}">
        <div class="requestProfile">
            <img src="${path}/resources/source/user.png" alt="user">
            <div class="requestInfo">
                <div class="userName">${s.f.name}</div>
                <div class="freeLoc">${s.f.location}</div>
                <div class="cate">${s.f.cateName}</div>
                <div class="detail"><span>${s.a.ans1}</span> / <span>${s.a.ans2}</span> / <span>${s.a.ans3}</span></div>
            </div>
            <div class="requestTimeNdetail">
                <div class="createTime">${s.r.regDate}</div>
                <button type="button" class="detailBtn openMask" onclick="showDetail(${s.t.cusNum});">상세보기</button>
			</div>
		</div>
		</c:forEach>
       
        <!-- 받은요청 모달창 -->
        <div id="mask"></div>
        <div class="window">
            <div class="request_title">
                <span>받은 요청서</span>
                <div class="close">X</div>
            </div>
            <div class="request_form">
                <div class="quest1">
                    <div class="question2">매칭을 원하는 이유는 무엇인가요?</div>
                    <div id="ans1" style="overflow:scroll;"></div>
                </div>
                <div class="quest2">
                    <div class="question2">원하는 가격대는 얼마인가요?</div>
                    <div id="ans2"></div>
                </div>
                <div class="quest3">
                    <div class="question3">그 외 전달하고 싶은 사항이 있다면 알려주세요.</div>
                    <div id="ans3" style="overflow:scroll;"></div>
                </div>
            </div>
            <div class="accNdec">
            	<button type="submit" value="accept" class="btn1">수락</button>
           		<button type="button" value="거절" class="btn2" onclick="">거절</button>
            </div>
        </div>
        	
       	 <script>
        	function showDetail(cusNum){
       			$.ajax({
       				url: "requestDetail.re",
       				data: {cusNum:cusNum},
       				success: function(result){
						$("#ans1").text(result.ans1);
						$("#ans2").text(result.ans2);
						$("#ans3").text(result.ans3);
       				},
       				error: function(){
       					console.log("ajax 통신실패");
       				}
       			});
        	}
       	</script>
        
    </main>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
	
</body>

</html>