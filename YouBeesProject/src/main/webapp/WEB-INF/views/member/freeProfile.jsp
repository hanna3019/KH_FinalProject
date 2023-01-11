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
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/free_profile2.css">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="${path}/resources/js/profile.js"></script>
</head>

<body>
<!-- header -->
	<jsp:include page="../common/header.jsp"/>

    <div id="profile_container">

        <div class="title">
            <img class="pro_img" src="${path}/resources/source/santa.jpg" alt="프로필사진">
            <h2>변진주</h2>
            <p class="inline f13">독일어 통번역 &emsp;<img class="img_small" src="${path}/resources/source/location.png" alt="">서울시 강남구</p>
            <h4>한줄 소개가 들어갈 자리입니다!</h4>
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
            <form action="" id="detail_form">
                <tr>
                    <th>상세소개</th>
                    <th width="10%">
                        <span class="regBtn detail_rev_btn">수정하기</span>
                        <!-- <a href="" class="regBtn hidden">등록하기</a> -->
                    </th>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="detail">
                            안녕하세요! 저희 000는 기존의 번역회사 보다 유연하고 합리적인 가격으로 서비스를 제공 드리고자 실무진들이 구성한 회사로
                            경험 많은 실무진들과 다수의 IR, 회사 소개서 번역 뿐만 아니라 유튜브 채널 등 다양한 분야의 번역을 진행하였던 전문 번역가님들과 함께 하고 있습니다.

                            또한 영어, 중국어, 일본어 등의 기본 언어 뿐만 아니라 다양한 언어의 번역 및 더빙이 가능합니다.

                            글로벌 비즈니스를 준비 하신다면
                            회사 소개서 홈페이지 등 번역 뿐만 아니라 회사의 소개 영상등에 원어민 까지 저희 커넥투에서 함께 글로벌로 나아가시기 바랍니다.
                         <div/>
                            <textarea name="" id="detail_revise" class="hidden" cols="80" rows="10"></textarea>
                    </td>
                </tr>
            </form>
            <tr>
                <th>활동지역</th>
                <th><span class="regBtn location_btn">등록하기</span></th>
            </tr>
            <tr>
                <td colspan="2">서울시 관악구</td>
            </tr>
            <form action="" id="certifi_from">
                <tr>
                    <th>작업물 및 자격정보</th>
                    <th><span class="regBtn certifi_btn">등록하기</span></th>
                </tr>
            </form>
            <tr><!-- 등록 몇 개까지였는지 기억이 안나서 근데 4개 넘어가면 안 돼요! -->
                <td colspan="2">
                    <form action="">
                        <div><input type="file"></div>
                        <div><input type="file"></div>
                        <div><input type="file"></div>
                        <div><input type="file"></div>
                    </form>
                </td>
            </tr>
            <form action="" id="contect_form">
                <tr>
                    <th>연락가능시간</th>
                    <th><span class="regBtn contect_btn">수정하기</span></th>
                </tr>
                <tr>
                    <td colspan="2">
                        <spen class="contect_time">00시 ~ 00시</spen>
                        <input type="text" class="contect_revise hidden">
                    </td>
                </tr>
            </form>
            <form action="" id="career_form">
                <tr>
                    <th>경력</th>
                    <th><span class="regBtn career_btn">수정하기</span></th>
                </tr>
                <tr>
                    <td colspan="2">
                        <span class="career">00년</span>
                        <input type="text" class="career_revise hidden">
                    </td>
                </tr>
            </form>
        </table>
        <table class="review_area" align="left">
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
	</div>
<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>

</html>