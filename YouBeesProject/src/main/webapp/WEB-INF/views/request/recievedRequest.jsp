<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${path}/resources/css/receivedRequest.css?b">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="${path}/resources/js/profile.js"></script>
    <title>YouBees</title>
</head>

<body>
	<!-- header -->
	<jsp:include page="../common/header.jsp"/>

    <main>
    <c:choose>
    	<c:when test="${not empty AcceptMsg}">
    		<script>
    	 		alert("${AcceptMsg}");
    		</script>
    	</c:when>
    	<c:when test="${not empty DeclineMsg}">
	    	<script>
	    		alert("${DeclineMsg}");
	    	</script>
    	</c:when>
    	<c:when test="${not empty DeleteMsg}">
    		<script>
    		alert("${DeleteMsg}");
    		</script>
    	</c:when>
    </c:choose>
    
        <div class="mainTitle">받은요청</div>
        
        <!-- 요청 리스트 -->
        <c:forEach var="r" items="${rList}">
	        <c:choose>
				<c:when test="${r.accept eq 'N'}">
					<div class="declinedProfile">
					<c:choose>
						<c:when test="${not empty r.changeName}">
				            <img src="${path}/${r.changeName}" alt="user">
						</c:when>
						<c:otherwise>
				            <img src="${path}/resources/source/user.png" alt="user">
						</c:otherwise>
					</c:choose>
			            <div class="removeRequest" onclick="deleteReq(${r.reqNum});">X</div>
			            <div class="requestInfo">
			                <div class="userName">${r.name}</div>
			                <div class="detail"><span>${r.a.ans1}</span> / <span>${r.a.ans2}</span> / <span>${r.a.ans3}</span></div>
			            </div>
			            <div class="requestTimeNdetail">
			                <div class="createTime">${fn:substring(r.regDate,0,10)}</div>
			                <div class="information">
								취소된 요청입니다
			                </div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="requestProfile">
			            <img src="${path}/resources/source/user.png" alt="user">
			            <div class="removeRequest" onclick="deleteReq(${r.reqNum});">X</div>
			            <div class="requestInfo">
			                <div class="userName">${r.name}</div>
			                <div class="detail"><span>${r.a.ans1}</span> / <span>${r.a.ans2}</span> / <span>${r.a.ans3}</span></div>
			            </div>
			            <div class="requestTimeNdetail">
			                <div class="createTime">${fn:substring(r.regDate,0,10)}</div>
			                <div class="btns">
				                <button type="button" class="detailBtn" onclick="">채팅하기</button>
				                <button type="button" class="detailBtn openMask" onclick="showDetail(${r.reqNum});">상세보기</button>
			                </div>
						</div>
					</div>
				</c:otherwise>        
	        </c:choose>
		</c:forEach>
       
        <!-- 받은요청 모달창 -->
         <div id="mask"></div>
         <div class="window">
             <div class="request_title">
                 <span>받은 요청서</span>
                 <div class="close" onclick="">X</div>
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
             <div class="accNdec">
             	<button type="button" value="수락" class="btn1" onclick="">수락</button>
            	<button type="button" value="거절" class="btn2" onclick="">거절</button>
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
						$(".btn1").attr("onclick", "acceptReq("+result.reqNum+")");
						$(".btn2").attr("onclick", "declineReq("+result.reqNum+")");
						
       				},
       				error: function(){
       					console.log("ajax 통신실패");
       				}
       			});
        	}
        	
        	function acceptReq(reqNum){
        		if(confirm("요청을 수락하시겠습니까?")){
        			location.href="acceptRequest.re?reqNum="+reqNum+"&freeNum="+${loginUserF.freeNum};
        		} else {
        			return;
        		}
        	}
        	
        	function declineReq(reqNum){
        		if(confirm("요청을 거절하시겠습니까?")){
        			location.href="declineRequest.re?reqNum="+reqNum+"&freeNum="+${loginUserF.freeNum};
        		} else {
        			return;
        		}
        	}
        	
        	function deleteReq(reqNum){
        		if(confirm("요청을 삭제하시겠습니까?\n삭제 후 복구 불가능하며, 수락 또는 거절을 하지 않고 삭제 시\n응답시간에 영향을 줄 수 있습니다.")){
        			location.href="deleteRequest.re?reqNum="+reqNum+"&freeNum="+${loginUserF.freeNum};
        		} else {
        			return;
        		}
        	}
       	</script>
       
    </main>

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
	
</body>

</html>