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

    <link rel="stylesheet" href="${path}/resources/css/receivedRequest.css?b">
     <script src="http://code.jquery.com/jquery-latest.js"></script>
      <script type="text/javascript" src="${path}/resources/js/profile.js"></script>
    <title>Document</title>
</head>

<body>
<!-- header -->
	<jsp:include page="../common/header.jsp"/>

    <main>
        <div class="mainTitle">받은요청</div>

        <div class="requestProfile">
            <img src="${path}/resources/source/user.png" alt="user">
            <div class="requestInfo">
                <div class="userName">정한나</div>
                <div class="location">서울 영등포구</div>
                <div class="detail">취미 / 50,000원~100,000원 / 토요일, 일요일</div>
            </div>
            <div class="requestTimeNdelete">
                <div class="createTime">2시간 전</div>

             
                <button type="button" class="detailBtn openMask">
                    상세보기
                </button>
			</div>
			</div>
               
        <!-- 요청 모달창 -->
        <form action="" method="post">
            <div id="mask"></div>
            <div class="window">
                <div class="request_title">
                    <span>요청서</span>
                    <div class="close">X</div>
                </div>
                <div class="request_form">
                    <div class="quest1">
                       <div class="question2">매칭을 원하는 이유는 무엇인가요?</div>
                         
                          <textarea></textarea>
                      </div>
                    <div class="quest2">
                        <div class="question2">원하는 가격대는 얼마인가요?</div>
                        
                          <input> ~ <input>
                    </div>
                    <div class="quest3">
                        <div class="question3">선호하는 요일은 언제인가요?</div>
                            
                            <textarea></textarea>
                   </div>
                    <div class="quest4">
                        <div class="question4">그 외 전달하고 싶은 사항이 있다면 알려주세요.</div>
                          
                             <textarea></textarea>
                    </div>
                  </div>
                     <button type="submit" value="sendRequest" class="request_send">요청답장</button>
             </div>
        </form>

        <div class="requestProfile">
            <img src="${path}/resources/source/user.png" alt="user">
            <div class="requestInfo">
                <div class="userName">정한나</div>
                <div class="location">서울 영등포구</div>
                <div class="detail">취미 / 50,000원~100,000원 / 토요일, 일요일</div>
            </div>
            <div class="requestTimeNdelete">
                <div class="createTime">2시간 전</div>

                <!-- Button trigger modal -->
                <button type="button" class="detailBtn openMask">
                    상세보기
                </button>
             </div>
         </div>

    </main>

    
    

<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>

</html>