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
				<h3>이 정도면 영어 심각한 수준 아닌가요?</h3>
				<p>경기/고양시</p>
			</div>

			<div class="container_writer">
				<img class="writer_img" src="${path}/resources/source/lico.png">
				<div class="writer_info">
					<span class="writer_name">호로록</span>
					<span class="create_date">2022.12.30 · 조회 100</span>
				</div>
			</div>
		</div>
		<div class="container_main">
			<div class="read_main">
				<p>아니 어제 영화를 보는데 번역자가 오역 많을 수 있다고 미리 밑밥을 깔더라고요.
					그리고 FRIDAY라는 타이틀이 나왔는데 '목요일'이라고 번역하신거 있죠?
					이건 좀 심각한거 아닌가요? 진짜 기대 많이 했던 영화인데 결국 못 봤어요.
					마음의 상처를 받아서 그러는데 혹시 컨설팅 잘 해주시는 분 계신가요?
					저는 도저히 이 상처를 혼자 극복하지 못하겠어요. 마음 컨설팅 잘 해주시는 분 연락 주세요.
				</p>
				<img src="${path}/resources/source/movie.jpg" alt="main_img" class="read_main_img">
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

			<textarea placeholder="댓글을 남겨보세요."></textarea>
			<button class="submit">등록</button>
		</div>
	</div>

</body>

</html>