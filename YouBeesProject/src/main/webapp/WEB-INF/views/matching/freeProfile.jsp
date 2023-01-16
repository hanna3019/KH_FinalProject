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
    <title>YouBees</title>
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/free_profile.css?a">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="${path}/resources/js/profile.js"></script>
</head>

<body>
<!-- header -->
	<jsp:include page="../common/header.jsp"/>
	
    <div id="profile_container">
        <div class="profile_main">
            <div class="title">
                <img class="pro_img" src="${path}/resources/source/santa.jpg" alt="프로필사진">
                <h2>${f.f.name}</h2>
                <p class="inline f13">${f.category} &emsp;<img class="img_small" src="${path}/resources/source/location.png" alt="">${f.f.location}</p>
                <h4>${f.oneContent}</h4>
            </div>

            <div id="profile_tbl">
                <div class="prof_box">
                    <div class="small_box"><img class="star_img" src="${path}/resources/source/star.png" alt="평점">4.7</div>
                    <h3>평점</h3>
                </div>
                <div class="prof_box">
                    <div class="small_box">50</div>
                    <h3>고용수</h3>
                </div>
                <div class="prof_box">
                    <div class="small_box"><img class="badge" src="${path}/resources/source/medal.png" alt="배지"></div>
                    <h3>리뷰왕</h3>
                </div>
            </div>

            <table id="profile_cnt">
                <tr>
                    <th>상세소개</th>
                </tr>
                <tr>
                    <td>
                        <div class="detail">
                           ${f.frContent}
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>활동지역</th>
                </tr>
                <tr>
                    <td>${f.f.location}</td>
                </tr>
                <tr>
                    <th>작업물 및 자격정보</th>
                </tr>
                <tr>
                    <td> <!-- 등록 몇 개까지였는지 기억이 안나서 근데 4개 넘어가면 안 돼요! -->
                        <img src="${path}/resources/source/sound.jpg" alt="작업물 및 자격정보" class="certification" onclick="확대">
                        <img src="${path}/resources/source/sound.jpg" alt="작업물 및 자격정보" class="certification" onclick="확대">
                        <img src="${path}/resources/source/sound.jpg" alt="작업물 및 자격정보" class="certification" onclick="확대">
                        <img src="${path}/resources/source/sound.jpg" alt="작업물 및 자격정보" class="certification" onclick="확대">
                    </td>
                </tr>
                <tr>
                    <th>연락가능시간</th>
                </tr>
                <tr>
                    <td>${f.callTime}</td>
                </tr>
                <tr>
                    <th>경력</th>
                </tr>
                <tr>
                    <td>${f.f.career}</td>
                </tr>
                <tr>
                	<th>가격</th>	
                </tr>
                <tr>
                	<td>${f.price}</td>
                </tr>
            </table>
            <table class="review_area">
                <tr>
                    <td width="10%">
                        <h2>리뷰</h2>
                    </td>
                    <td class="f12">(20개)</td>
                </tr>
                <tr>
                    <td>
                        <h1>4.7</h1>
                    </td>
                    <td>
                        <img class="review_img" src="${path}/resources/source/star.png" alt="별점">
                        <img class="review_img" src="${path}/resources/source/star.png" alt="별점">
                        <img class="review_img" src="${path}/resources/source/star.png" alt="별점">
                        <img class="review_img" src="${path}/resources/source/star.png" alt="별점">
                        <img class="review_img" src="${path}/resources/source/star.png" alt="별점">
                    </td>
                </tr>
            </table>

            <table id="review_tbl">
                <tr class="first_row">
                    <td class="first_row" colspan="2">이산</td>
                </tr>
                <tr>
                    <td width="20%" class="f14">서비스카테고리</td>
                    <td><img src="${path}/resources/source/star.png" alt="별점" class="img_small">5.0</td>
                </tr>
                <tr>
                    <td colspan="2" class="review">댓글 내용이 들어갈 공간입니다!</td>
                </tr>
                <tr>
                    <td colspan="2" class="f12">2023.01.02</td>
                </tr>

                <tr class="first_row">
                    <td class="first_row" colspan="2">제갈한나</td>
                </tr>
                <tr>
                    <td width="20%" class="f14">서비스카테고리</td>
                    <td><img src="${path}/resources/source/star.png" alt="별점" class="img_small">4.6</td>
                </tr>
                <tr>
                    <td colspan="2" class="review">댓글 내용이 들어갈 공간입니다! 댓글 내용이 들어갈 공간입니다! 댓글 내용이 들어갈 공간입니다! 댓글 내용이 들어갈
                        공간입니다!</td>
                </tr>
                <tr>
                    <td colspan="2" class="f12">2023.01.02</td>
                </tr>

                <tr class="first_row">
                    <td class="first_row" colspan="2">이박사</td>
                </tr>
                <tr>
                    <td width="20%" class="f14">서비스카테고리</td>
                    <td><img src="${path}/resources/source/star.png" alt="" class="img_small">5.0</td>
                </tr>
                <tr>
                    <td colspan="2" class="review">댓글 내용이 들어갈 공간입니다!</td>
                </tr>
                <tr>
                    <td colspan="2" class="f12">2023.01.02</td>
                </tr>
            </table>

            <form action="" method="" class="comment_area">
                <textarea name="" id="write_comment" cols="81" rows="5" placeholder="후기를 남겨보세요"></textarea><br>
                <button type="submit" class="submit_comment">등록</button>
            </form>
        </div>

        <div class="quick_area">
            <h4>프리랜서에게 요청을 보내보세요!</h4>
            <div>   
                <button class="heart_box">
                    <img src="${path}/resources/source/heart3.png" alt=찜하기 class="heart_icon">
                </button>
             
                <button class="openMask">요청하기</button>
            </div>
        </div>

        <!-- 요청 모달창 -->
        <form action="insertRequest.re" method="post">
            <div id="mask"></div>
            <div class="window">
                <div class="request_title">
                    <span>요청서</span>
                    <a href="#" class="close">X</a>
                </div>
                <div class="request_form">
                <input type="hidden" name="cusNum" value="${loginUserC.cusNum}">
                <input type="hidden" name="freeNum" value="${f.freeNum}">
                    <div class="quest1">
                        <div class="question1">매칭을 원하는 이유는 무엇인가요?</div>
                        <textarea name="ans1"></textarea>
                    </div>
                    <div class="quest2">
                        <div class="question2">원하는 가격대는 얼마인가요?</div>
                        <input name="ans2"> ~ <input name="ans2">
                    </div>
                    <div class="quest3">
                    	<div class="question3">그 외 전달하고 싶은 사항이 있다면 알려주세요.</div>
                    	<textarea name="ans3"></textarea>
                    </div>
                </div>
                <button type="submit" value="sendRequest" class="request_send">요청전송</button>
            </div>
        </form>
			
		<script>
		 	/* 좋아요 누르기 */
		    $(".heart_box").on({
		        'click': function () {
		            let src = ($(".heart_icon").attr('src') === '${path}/resources/source/heart3.png')
		                ? '/spring/resources/source/heart2.png'
		                : '/spring/resources/source/heart3.png';
		            $(".heart_icon").attr('src', src);
		        }
		    });
		 
		</script>
		
	</div>
		    
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
	
</body>

</html>