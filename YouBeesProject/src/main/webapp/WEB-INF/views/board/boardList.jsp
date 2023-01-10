<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="${path}/resources/css/board.css">
	<title>Document</title>
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
			<button class="write_button" name="" onclick="location.href='boardWriteForm.bo'">글쓰기</button>
		</div>

		<article class="board_comment">
			<ul>
				<li>
					<a href="boardRead.bo">
						<div class="board_content">
							<div class="board_post">
								<div class="board_main">
									<h4>이 정도면 영어 심각한 수준 아닌가요?</h4>
									<p>아니 어제 영화를 보는데 번역자가 오역 많을 수 있다고 미리 밑밥을 깔더라고요. 그리고 FRIDAY라는 타이틀이 나왔는데 '목요일'이라고
										번역하신거 있죠? 이건 좀 심각한거 아닌가요? 진짜 기대 많이 했던 영화인데 결국 못 봤어요. 마음의 상처를 받아서 그러는데 혹시 컨설팅 잘
										해주시는 분 계신가요? 저는 도저히 이 상처를 혼자 극복하지 못하겠어요. 마음 컨설팅 잘 하시는 분 연락 주세요.</p>
									<p class="location">경기/고양시</p>
								</div>
								<img src="${path}/resources/source/santa.jpg" class="board_img">
							</div>
							<div class="board_footer">
								<div class="likeNcomment">
									<span><img src="${path}/resources/source/like.png?a" class="like"></span>
									<span class="likecnt">12</span>
									<span><img src="${path}/resources/source/reply.png" class="speechBubble"></span>
									<span>17</span>
								</div>
								<div class="time">20분 전</div>
							</div>
						</div>
					</a>
				</li>
				<li>
					<a href="boardRead.bo">
						<div class="board_content">
							<div class="board_post">
								<div class="board_main">
									<h4>이 정도면 영어 심각한 수준 아닌가요?</h4>
									<p>아니 어제 영화를 보는데 번역자가 오역 많을 수 있다고 미리 밑밥을 깔더라고요. 그리고 FRIDAY라는 타이틀이 나왔는데 '목요일'이라고
										번역하신거 있죠? 이건 좀 심각한거 아닌가요? 진짜 기대 많이 했던 영화인데 결국 못 봤어요. 마음의 상처를 받아서 그러는데 혹시 컨설팅 잘
										해주시는 분 계신가요? 저는 도저히 이 상처를 혼자 극복하지 못하겠어요. 마음 컨설팅 잘 하시는 분 연락 주세요.</p>
									<p class="location">경기/고양시</p>
								</div>
								<img src="${path}/resources/source/santa.jpg" class="board_img">
							</div>
							<div class="board_footer">
								<div class="likeNcomment">
									<span><img src="${path}/resources/source/like.png?a" class="like"></span>
									<span class="likecnt">12</span>
									<span><img src="${path}/resources/source/reply.png" class="speechBubble"></span>
									<span>17</span>
								</div>
								<div class="time">20분 전</div>
							</div>
						</div>
					</a>
				</li>
			</ul>
		</article>

	</div>

<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>

</body>

</html>