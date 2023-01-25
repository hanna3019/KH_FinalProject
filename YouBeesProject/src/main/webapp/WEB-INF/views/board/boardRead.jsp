<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>YouBees</title>
   <link rel="stylesheet" href="${path}/resources/css/read.css?aa">
   <script src="http://code.jquery.com/jquery-latest.js"></script>
</head>

<body>
	
	

   <!-- header -->
   <jsp:include page="../common/header.jsp"/>
   
   <div class="container">
      <div class="container_header">
         <div class="container_title">
            <h3>${ b.title }</h3>
            <p>${ b.location }</p>
         </div>

         <div class="container_writer">
         <c:choose>
         	<c:when test="${not empty b.profile}">
	            <img class="writer_img" src="${path}/${b.profile}">
         	</c:when>
         	<c:otherwise>
	            <img class="writer_img" src="${path}/resources/source/default.png">
         	</c:otherwise>
         </c:choose>
            <div class="writer_info">
               <span class="writer_name">${b.name }</span><br>
               <span class="create_date">${b.regDate } · 조회수${b.count }</span>
            </div>
         
         <!-- 수정, 삭제 -->      
         <c:if test="${ loginUserC.name eq b.name}">
            <div class="upNdelete">
                <a onclick="postFormSubmit(1);">수정</a>
                ·
                <a onclick="postFormSubmit(2);">삭제</a>
            </div><br><br>
         </c:if>
         
         </div>
         
         <form action="" method="post" id="postForm">
            <input type="hidden" name="bnum" value="${ b.bnum }">
            <input type="hidden" name="filePath" value="${ b.changeName }">
         </form>
      
      </div>
      
      <div class="container_main">
         <div class="read_main">
            <p>
            ${b.content}
            </p>
            <c:if test="${not empty b.changeName }">
	            <img src="${ b.changeName }" alt="main_img" class="read_main_img">
            </c:if>
         </div>
<!-- 좋아요  -->         
         <div class="read_footer">

            <div class="likeNcomment">       
            <c:choose>
               <c:when test="${b.l.status eq 'Y'}">
                  <span><img src="${path}/resources/source/like.png" class="like"></span>                                     
               </c:when>
               <c:otherwise>                  
                  <span><img src="${path}/resources/source/like2.png" class="like"></span>                                     
               </c:otherwise>
            </c:choose>
               <span class="likeCnt" id="lcount">${likeCnt}</span>
               <span><img src="${path}/resources/source/reply.png" class="speechBubble"></span>
               <span class="commentCnt" id="rcount">0</span>
            </div>
         </div>

 <!--좋아요 script문 -->   
      <c:choose>
         <c:when test="${ not empty loginUserC }">
                <input type="hidden" value="${ loginUserC.cusNum }" class="userNum">
              <input type="hidden" value="C" class="userType">      
           </c:when>
           <c:when test="${ not empty loginUserF }">
                <input type="hidden" value="${ loginUserF.freeNum }" class="userNum">
              <input type="hidden" value="F" class="userType">      
           </c:when>
           <c:otherwise>
              <input type="hidden" class="userNum" value="0">
           </c:otherwise>
        </c:choose>
             <script>

              $(document).on("click", ".like", function () {
                 if($(".userNum").val() === '0'){
                    alert("로그인 후 이용가능합니다");
                 }else{
                       let src = "";
                       if($(this).attr('src') === '${path}/resources/source/like2.png'){
                          src = '/spring/resources/source/like.png';
                          $.ajax({
                             url:"lselect.bo",
                             data:{bnum:${b.bnum}, userNum:$(".userNum").val(), type:$(".userType").val()},
                             success:function(result) {
                                $("#lcount").text(result);
                             },
                             error:function() {
                                console.log("좋아요 실패")
                             }
                          });
                       }else{
                          src = '/spring/resources/source/like2.png';
                          $.ajax({
                             url:"lcancel.bo",
                             data:{bnum:${b.bnum}, userNum:$(".userNum").val(), type:$(".userType").val()},
                             success:function(result) {
                            	 $("#lcount").text(result);
                             },
                             error:function() {
                                console.log("싫어요 실패");
                             }
                          });
                       }
                           
                          $(this).attr('src', src);
                       
                }

              }); 
                </script>


         
         
         
               
      </div>
   
      <script>
         function postFormSubmit(num) {
            if(num == 1) {
               $("#postForm").attr("action", "updateForm.bo").submit();
            } else {
               $("#postForm").attr("action", "delete.bo").submit();
            }
         }
      </script>
      
<!-- 댓글  -->   
      <div class="comment">
         <div class="comment_area">
            <%-- <img src="${path}/resources/source/lico.png" alt="user" class="comment_img"> --%>
            <div class="comment_write" id="comments_area">
            
                  
            </div>
               <form action="rdelete.bo" method="post" id="delete_postForm">
                     <input type="hidden" name="cnum" value="" class="cnum">
                     <input type="hidden" name="bnum" value="${b.bnum}">
               </form>
         
         </div>
         <c:if test="${not empty loginUserC or not empty loginUserF}">
	         <textarea placeholder="댓글을 남겨보세요." name="cContent" id="content"></textarea>
	         <button class="submit" onclick="addReply();">등록</button>
         </c:if>
      </div>
   
   </div>
   

   
   
   <!-- <script>
         function commentSubmit(num) {
            if(num == 1) {
               $("#postForm").attr("action", "rupdate.bo").submit();
            } else {
               $("#postForm").attr("action", "rdelete.bo").submit();
            }
         }
   </script> -->

<!-- 댓글  ajax -->

   <script>
       $(function() {
           /* selectReplyList(); */ 
          setInterval(selectReplyList, 1000); 
      })
      
      function selectReplyList() {
         $.ajax({
            url:"rlist.bo",
            data:{bno:${b.bnum}},
            success:function(list){
               console.log(list);
               let value= "";
               for(let i in list){
                  value +="<div class='comment_div'>" 
                	   +	"<div class='comment_flexer'>"
                	   +  "<img src='${path}/resources/source/default.png' alt='user' class='comment_img'>"
                	   +  "<div class='comment_flex'>"          
                       +  "   <div>"
                       +  "      <div class='comment_writer'>" + list[i].cWriter  + "</div>";
                       if(list[i].type == 'F'){
                    	   value += "      <div class='freelancer'>"+ "프리랜서" +"</div>";
                       }else{
                    	   value += "      <div class='freelancer'>"+ "일반고객" +"</div>";                    	   
                       }
                      
                  value +=  "   </div>"  
                       +  "</div>"
                       +  "   <div class='update_delete_btn'>";
                       if("${loginUserC.name}" == list[i].cWriter || "${loginUserF.name}" == list[i].cWriter){
	                      value +=  "      <a onclick='delete_postFormSubmit("+list[i].cnum+")'>x</a>";
                       }
                       value +=  "  </div>"
                       +  "  </div>"
                       +    "<div class='comment_content'>"+ list[i].cContent + "</div>"
                       +  "<textarea class='commentRvs hidden'>"+ list[i].cContent +"</textarea>"
                       +    "<div class='comment_time'>"   + list[i].regDate  + "</div>"
                       +"</div>";
               }
               $("#comments_area").html(value);
               $("#rcount").text(list.length);
            },
            error:function(){
               console.log("댓글리스트 ajax통신 실패");
            }
         });
       }
       
       function delete_postFormSubmit(cnum) {
          $(".cnum").val(cnum)
         $("#delete_postForm").submit();
      }
      
       $(function(){
          $(document).on("click", "#rvsBtn", function(){
             $(".commentRvs").toggleClass("hidden");
             $(".comment_content").toggleClass("hidden");             
          })
       })
       
       
       
       </script>
   
   <c:choose>
      <c:when test="${not empty loginUserF}">
         <script>
            function addReply(){
               $.ajax({
                  url:"rinsert.bo",
                  data:{
                     bnum:${b.bnum},
                     cContent:$("#content").val(),
                     cWriter:"${loginUserF.name}",
                     type:'F'
                  },
                  success:function(result) {
                     if(result == "success") {
                        $("#content").val("");
                     }
                  },
                  error:function(){
                     console.log("댓글작성 ajax 통신 실패");
                  }
               });
            }
         </script>
      </c:when>
      <c:otherwise>
         <script>
         function addReply(){
            $.ajax({
               url:"rinsert.bo",
               data:{
                  bnum:${b.bnum},
                  cContent:$("#content").val(),
                  cWriter:"${loginUserC.name}",
                  type:'C'
               },
               success:function(result) {
                  if(result == "success") {
                     $("#content").val("");
                  }
               },
               error:function(){
                  console.log("댓글작성 ajax 통신 실패");
               }
            });
         }
         </script>
      </c:otherwise>
   </c:choose>
   
   <!-- footer -->
   <jsp:include page="../common/footer.jsp"/>
   
</body>

</html>