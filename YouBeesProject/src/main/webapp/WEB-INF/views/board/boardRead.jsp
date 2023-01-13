<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<link rel="stylesheet" href="${path}/resources/css/read.css">
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
					<span class="commentCnt">17</span>
				</div>
			</div>
		</div>
		
		
		<div class="comment">

			<div class="comment_area">
				<img src="${path}/resources/source/lico.png" alt="user" class="comment_img">
				<div class="comment_write">
					<div class="comment_writer" onclick="">밤하늘의 펄</div>
					<div class="freelancer">컨설팅 프리랜서</div>
					<div class="comment_content">서울 당산동에서 전문 컨설팅을 하고 있습니다.
						마음 컨설팅 또한 전문가와 함께하면 더 쉽고 빠릅니다. 많은 분들이 마음의 안식을 얻고 가셨어요.
						언제든 연락주세요^^</div>
					<div class="comment_time">2022. 12. 30</div>
				</div>
			</div>

			<div class="comment_area">
				<img src="${path}/resources/source/lico.png" alt="user" class="comment_img">
				<div class="comment_write">
					<div class="comment_writer" onclick="">연승</div>
					<div class="freelancer"></div>
					<div class="comment_content">와 저기 옆 동네는 다이스키를 정말 싫어로 번역했다는데, 혹시 동일인물인가요? 킹리적갓심 ㅇㅈ?</div>
					<div class="comment_time">2023. 01. 09</div>
				</div>
			</div>
			<textarea placeholder="댓글을 남겨보세요." name="cContent" id="content"></textarea>
			<button class="submit" onclick="addReply();">등록</button>
		</div>
	</div>

	<!-- 댓글  ajax -->

	<script>
		function addReply() {
			if("#content").val().trim().length !=0 {
				let type = '';
				let name '';
				if(${loginUserF} == null){
					type = 'C';
					name = ${loginUserC.name};
				}else{
					type = 'F';
					name = ${loginUserF.name};
				}
				$.ajax({
					url:"rinsert.bo",
					data:{
						bnum:${b.bnum},
						cContent:$("#content").val(),
						cWriter:name,
						type:type
					},
					success:function(result) {
						if(result == "success") {
							selectReplyList();
							$("#content").val("");
						}
					},
					error:function(){
						console.log("댓글작성 ajax 통신 실패");
					}
				});
			}else {
				alerify.alert("댓글 작성후 등록해 주세요.")
			}
		}
	
	
	
		$(function() {
			selectReplyList();
		})
		
		function selectReplyList(){
			$.ajax({
				url:"rlist.bo",
				data:
			})
		}
	</script>
</body>

</html>