<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="${path}/resources/css/board.css">
   <title>YouBees</title>
</head> 


<body>
   <!-- header -->
   <jsp:include page="../common/header.jsp"/>
	
   <div class="board_container">

      <div class="board_header">
         <div class="board_title">커뮤니티</div>
         <form action="" method="" class="search_form">
            <input class="search_bar" type="text" placeholder="내용 또는 작성자를 검색할 수 있어요">
            <img src="${path}/resources/source/search.png" alt="" class="search_btn" onclick="">
         </form>
      <c:if test="${ not empty loginUserC }">
         <button class="write_button" name="" onclick="location.href='boardWriteForm.bo'">글쓰기</button>
      </c:if>
      </div>

      <article class="board_comment" id="boardList">
         <ul>
            <c:forEach var="b" items="${ list }">
            <li>
            <c:choose>
            	<c:when test="${ not empty loginUserC }">
	                <a href="boardRead.bo?bnum=${b.bnum}&userNum=${loginUserC.cusNum}&type=C"> 
            	</c:when>
            	<c:when test="${ not empty loginUserF }">
	                <a href="boardRead.bo?bnum=${b.bnum}&userNum=${loginUserF.freeNum}&type=F"> 
            	</c:when>
            	<c:otherwise>
	                <a href="boardRead.bo?bnum=${b.bnum}&userNum=0"> 
            	</c:otherwise>
            </c:choose>   
                  <div class="board_content">         
                     <div class="board_post">
                        <div class="board_main">
                        
                           <h4>${ b.title }</h4>
                           <p>${ b.content }</p>
                           <p class="location">${ b.location }·${b.serviceName}</p>   
                              
                        
                        </div>
                        <c:if test="${ not empty b.changeName }"> 
	                        <img src="${ b.changeName }" class="board_img">                              
                        </c:if>
                        
                     </div>
                     <div class="board_footer">
                        <div class="likeNcomment">
                           <span><img src="${path}/resources/source/like.png" class="like"></span>
                           <span class="likecnt">${b.lcount}</span>
                           <span><img src="${path}/resources/source/reply.png" class="speechBubble"></span>
                           <span>${b.ccount }</span>
                        </div>
                        <div class="time">${fn:substring(b.regDate,0,10)}</div>
                     </div>
                  </div>
                </a> 
            </li>
            </c:forEach>
         </ul>
      </article>
      
      
      
      
      <div id="pagingArea">
                <ul class="pagination" style="display:flex">
                   <c:choose>
                      <c:when test="${ pi.nowPage eq 1 }">
                          <li class="page-item disabled"><a class="page-link" href="#">Prev</a></li>
                      </c:when>
                      <c:otherwise>
                         <li class="page-item"><a class="page-link" href="boardList.bo?cpage=${ pi.nowPage-1 }">Previous</a></li>
                      </c:otherwise>
                   </c:choose>
                   <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                       <li class="page-item"><a class="page-link" href="boardList.bo?cpage=${p}">${p}</a></li>
               </c:forEach>

               <c:choose>
                  <c:when test="${ pi.nowPage eq pi.maxPage }">
                          <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                      </c:when>
                      <c:otherwise>
                         <li class="page-item"><a class="page-link" href="boardList.bo?cpage=${ pi.nowPage+1 }">Next</a></li>
                      </c:otherwise>
                   </c:choose>
                </ul>
      </div>

   </div>

   <!-- footer -->
   <jsp:include page="../common/footer.jsp"/>
   
   <script>
   //현재시간 		
   
   

   
   		
   </script>

</body>

</html>