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
    <link rel="stylesheet" href="${path}/resources/css/matched_f.css?a">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="${path}/resources/js/profile.js"></script>
    <title>YouBees</title>
</head>

<body>
	<!-- header -->
	<jsp:include page="../common/header.jsp"/>
	
    <main>
    
        <div class="mainTitle">매칭내역</div>
        
        <c:forEach var="fm" items="${fmList}">
	        <div class="requestProfile">
	            <img src="${path}/resources/source/user.png" alt="user">
	            <div class="removeRequest">X</div>
	            <div class="requestInfo">
	                <div class="userName">${fm.name}</div>
	                <div class="detail"><span>${fm.a.ans1}</span> / <span>${fm.a.ans2}</span> / <span>${fm.a.ans3}</span></div>
	            </div>
	            <div class="requestTimeNdelete">
	                <div class="createTime">${fm.regDate}</div>
	                <div class="btns">
	                    <button type="button" class="detailBtn" onclick="">채팅하기</button>
		                <button type="button" class="detailBtn openMask" onclick="showDetail(${fm.cusNum});">상세보기</button>
	                </div>
	            </div>
	        </div>
        </c:forEach>
        
        <!-- 보낸요청 모달창 -->
        <div id="mask"></div>
        <div class="window">
        
            <div class="request_title">
                <span>받은 요청서</span>
                <div class="close">X</div>
            </div>
            
            <div class="request_form">
                <div class="quest1">
                    <div class="question1">매칭을 원하는 이유는 무엇인가요?</div>
                    <div id="ans1"></div>
                </div>
                <div class="quest2">
                    <div class="question2">원하는 가격대는 얼마인가요?</div>
                    <div id="ans2"></div>
                </div>
                <div class="quest3">
                    <div class="question3">그 외 전달하고 싶은 사항이 있다면 알려주세요.</div>
                    <div id="ans3"></div>
                </div>
            </div>
            
        </div>
        	
       	 <script>
        	function showDetail(reqNum){
       			$.ajax({
       				url: "requestDetail.re",
       				data: {reqNum:reqNum},
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