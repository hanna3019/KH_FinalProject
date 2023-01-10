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
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/free_list.css?s">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="${path}/resources/js/free_list.js?s"></script>
</head>

<body>
<!-- header -->
	<jsp:include page="../common/header.jsp"/>
	
    <div id="container">

        <div class="filter">
            <div class="h2">영어통번역</div>

            <div class="region">
                <div><button class="openMask">지역<img src="source/dropdown.png" alt="" class="drp_icon"></button></div>
                <div class="selected">
                    <div class="location">경기 남양주시<img src="${path}/resources/source/x.png" onclick="" class="close_region"></div>
                    <div class="location">경기 고양시<img src="${path}/resources/source/x.png" onclick="" class="close_region"></div>
                    <div class="location">서울 전체<img src="${path}/resources/source/x.png" onclick="" class="close_region"></div>
                </div>
            </div>

            <div class="price">
                <div>
                    <button class="price_btn" onclick="priceBtn();">가격<img src="${path}/resources/source/dropdown.png" alt=""
                            class="drp_icon"></button>
                </div>
                <form action="">
                    <input type="text" size="7" class="priceInp"> &ensp;~&ensp; <input type="text" size="7"
                        class="priceInp">
                    <input type="button" class="price_search" value="검색" onclick=""></input>
                    <input type="reset" class="price_reset" value="초기화"></input>
                </form>
            </div>

        </div>

        <div class="free_list">
            <div class="search">
                <form action="" method="">
                    <input class="search_bar" type="text" placeholder="어떤 프리랜서를 찾고 계신가요?">
                    <img src="${path}/resources/source/search.png" alt="" class="search_btn" onclick="">
                    <select name="" id="order">
                        <option value="">리뷰많은순</option>
                        <option value="">평점순</option>
                        <option value="">매칭순</option>
                    </select>
                </form>
            </div>

            <table class="free_pro">
                <tr>
                    <td colspan="4">
                    <a href=""><h4>프리랜서 이름</h4></a>
                    </td>
                    <td rowspan="3" class="pro_img"><img src="${path}/resources/source/profile.png" alt="" class="pro_img"></td>
                </tr>
                <tr>
                    <td colspan="4" class="title">한줄 소개가 들어갈 곳입니다!</td>
                </tr>
                <tr class="review">
                    <td width="15%"><img src="${path}/resources/source/star.png" alt="" class="review"> 3.5(256)</td>
                    <td width="15%">경력 00년</td>
                    <td width="20%">평균응답시간 1시간</td>
                    <td><img src="${path}/resources/source/heart.png" alt="" class="bookmark_icon">찜하기</td>
                </tr>
            </table>
            <table class="free_pro">
                <tr>
                    <td colspan="4">
                    <a href=""><h4>프리랜서 이름</h4></a>
                    </td>
                    <td rowspan="3" class="pro_img"><img src="${path}/resources/source/profile.png" alt="" class="pro_img"></td>
                </tr>
                <tr>
                    <td colspan="4" class="title">한줄 소개가 들어갈 곳입니다!</td>
                </tr>
                <tr class="review">
                    <td width="15%"><img src="${path}/resources/source/star.png" alt="" class="review"> 3.5(52)</td>
                    <td width="15%">경력 00년</td>
                    <td width="20%">평균응답시간 1시간</td>
                    <td><img src="${path}/resources/source/heart.png" alt="" class="bookmark_icon">찜하기</td>
                </tr>
            </table>
            <table class="free_pro">
                <tr>
                    <td colspan="4"><a href="">
                            <h4>프리랜서 이름</h4>
                        </a>
                    </td>
                    <td rowspan="3" class="pro_img"><img src="${path}/resources/source/profile.png" alt="" class="pro_img"></td>
                </tr>
                <tr>
                    <td colspan="4" class="title">한줄 소개가 들어갈 곳입니다!</td>
                </tr>
                <tr class="review">
                    <td width="15%"><img src="${path}/resources/source/star.png" alt="" class="review"> 3.5(1,182)</td>
                    <td width="15%">경력 00년</td>
                    <td width="20%">평균응답시간 5분</td>
                    <td><img src="${path}/resources/source/heart.png" alt="" class="bookmark_icon">찜하기</td>
                </tr>
            </table>

        </div>
        
		<script>
		$(function () {
		    $("ul.locationList>li").click(function () {
		        $(this).next().toggleClass("hidden")
		    });

		    $(".bookmark_icon").on({
		        'click': function () {
		            let src = ($(this).attr('src') === '${path}/resources/source/heart.png')
		                ? '/spring/resources/source/heart2.png'
		                : '/spring/resources/source/heart.png';
		            $(this).attr('src', src);
		        }
		    });
		});
		
		</script>

        <!-- 지역선택 모달창 -->
        <div id="mask"></div>
        <div class="window">
            <div>
                <span>지역 선택</span>
                <span style="text-align:center; font-size: small;"><a href="#" class="close">닫기X</a></span>
            </div>
            
            <ul class="locationList">
            <c:forEach var='l' items='${lList}'>
                <li class="loca">&ensp;${l.location}</li>
                <ul class="cityList hidden">
                <c:forEach var='c' items='${cList}'>
                	<c:choose>
                		<c:when test="${c.locNum eq l.locNum}">
                    		<li>${c.city}</li>
                    	</c:when>
                    </c:choose>
                </c:forEach>
                </ul>            	
            </c:forEach>
            </ul>
        </div>
    </div>
    
    
<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>

</html>