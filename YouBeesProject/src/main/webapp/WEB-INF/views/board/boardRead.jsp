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
	<link rel="stylesheet" href="${path}/resources/css/read.css">
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
				<img class="writer_img" src="${path}/resources/source/lico.png">
				<div class="writer_info">
					<span class="writer_name">${b.name }</span>
					<span class="create_date">${b.regDate } · 조회수${b.count }</span>
				</div>
			</div>
		</div>
		
		<div class="container_main">
			<div class="read_main">
				<p>
				${b.content}
				</p>
				<img src="${ b.changeName }" alt="main_img" class="read_main_img">
			</div>

			<div class="read_footer">
				<div class="likeNcomment">
					<span><img src="${path}/resources/source/like.png?a" class="like"></span>
					<span class="likeCnt">12</span>
					<span><img src="${path}/resources/source/reply.png" class="speechBubble"></span>
					<span class="commentCnt" id="rcount">0</span>
				</div>
			</div>
			
<!-- 수정, 삭제 -->		
			<c:if test="${ loginUserC.name eq b.name}">
				<div align="center">
					 <a onclick="postFormSubmit(1);">수정하기</a>
					 <a onclick="postFormSubmit(2);">삭제하기</a>
				</div><br><br>
			</c:if>
			
			<form action="" method="post" id="postForm">
				<input type="hidden" name="bno" value="${ b.bnum }">
	            <input type="hidden" name="filePath" value="${ b.changeName }">
			</form>
		
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
			</div>
			<textarea placeholder="댓글을 남겨보세요." name="cContent" id="content"></textarea>
			<button class="submit" onclick="addReply();">등록</button>
		</div>
	</div>

<!-- 댓글  ajax -->

	<script>
 		$(function() {
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
						value += "<div class=comment_writer>" + list[i].cWriter  + "</div>"
							  +	 "<div class=freelancer>"                     +"</div>"
							  +	 "<div class=comment_content>"+ list[i].cContent + "</div>"
							  +	 "<div class=comment_time>"   + list[i].regDate  + "</div>"
					}
					$("#comments_area").html(value);
					$("#rcount").text(list.length);
				},
				error:function(){
					console.log("댓글리스트 ajax통신 실패");
				}
			});
		 }
	 
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