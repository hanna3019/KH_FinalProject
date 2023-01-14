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
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/free_profile2.css?aa">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="${path}/resources/js/profile.js?a"></script>
</head>

<body>
<!-- header -->
	<jsp:include page="../common/header.jsp"/>

    <div id="profile_container">

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
                          ${f.frContent}
                         <textarea name="" class="detail_revise hidden" cols="80" rows="10"></textarea>
                         <div/>
                    </td>
                </tr>
            </form>
            <tr>
                <th>활동지역</th>
                <th><span class="regBtn location_btn">변경하기</span></th>
            </tr>
            <tr>
                <td colspan="2">${f.f.location}</td>
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
                        <span class="contect_time">${f.callTime}</spen>
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
                        <span class="career">${f.f.career}</span>
                        <input type="text" class="career_revise hidden">
                    </td>
                </tr>
                <tr>
                	<th>가격</th>
                	<th><span class="regBtn fee_btn">수정하기</span></th>
                </tr>
                <tr>
                	<td colspan="2">
                		<span class="fee"></span>
                		<input type="text" class="fee_revise hidden">
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