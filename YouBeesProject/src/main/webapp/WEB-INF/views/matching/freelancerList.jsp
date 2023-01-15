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
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/free_list.css?q">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript" src="${path}/resources/js/free_list.js?s"></script>
</head>

<body>
<!-- header -->
	<jsp:include page="../common/header.jsp"/>
	
    <div id="container">

        <div class="filter">
            <div class="h2">${cName}</div>

            <div class="region">
                <div><button class="openMask">지역<img src="${path}/resources/source/dropdown.png" alt="" class="drp_icon"></button></div>
                <div class="selected">
                    <div class="location"><img src="${path}/resources/source/x.png" class="close_region"></div>
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
            <div id="fListArea">
            <c:forEach var="l" items="${fList}">
	            <table class="free_pro">
	                <tr>
	                    <td colspan="4">
	                    <a href="freelancerDetail.ma?fNum=${l.freeNum}"><h4>${l.f.name}</h4></a>
	                    </td>
	                    <td rowspan="3" class="pro_img"><img src="${path}/resources/source/profile.png" alt="" class="pro_img"></td>
	                </tr>
	                <tr>
	                    <td colspan="4" class="title">${l.oneContent}</td>
	                </tr>
	                <tr class="review">
	                    <td width="15%"><img src="${path}/resources/source/star.png" alt="" class="review"> 3.5(256)</td>
	                    <td width="15%">경력 ${l.f.career}</td>
	                    <td width="20%">평균응답시간 1시간</td>
	                    <td><img src="${path}/resources/source/heart.png" alt="" class="bookmark_icon">찜하기</td>
	                </tr>
	            </table>
            </c:forEach>
            </div>
            <c:choose>
            	<c:when test="${fList.size() gt 4}">
			       	<div id="pageArea">
			      		<ul class="pagination">
			               	<c:choose>
			               		<c:when test="${pi.nowPage eq 1}">
			                    	<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
			                	</c:when>
			                	<c:otherwise>
			                		<li class="page-item"><a class="page-link" href="freelancerList.ma?cpage=${pi.nowPage-1}">이전</a></li>
			                	</c:otherwise>
			                </c:choose>
			                <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
			                    <li class="page-item"><a class="page-link" href="javascript:paging(${p})">[${p}]</a></li>
							</c:forEach>
							<c:choose>
								<c:when test="${pi.nowPage eq pi.maxPage }">
			                    	<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
			                    </c:when>
			                    <c:otherwise>
			                    	<li class="page-item"><a class="page-link" href="freelancerList.ma?cpage=${pi.nowPage+1}">다음</a></li>	                    
			                    </c:otherwise>
			               	</c:choose>
			           </ul>
			       	</div>
	       		</c:when>
	       	</c:choose>
       	</div>
		<script>
		$(function () {
			/* 지역리스트 */
		    $("ul.locationList>li").click(function () {
		        $(this).next().toggleClass("hidden")
		    });
			
		    /* 좋아요 누르기 */
		    $(document).on("click", ".bookmark_icon", function () {
		            let src = ($(this).attr('src') === '${path}/resources/source/heart.png')
		                ? '/spring/resources/source/heart2.png'
		                : '/spring/resources/source/heart.png';
		            $(this).attr('src', src);
		    });
		    
		    /* 지역 선택 후 div에 띄우기 */
		    $(".cityList>li").on({
		    	'click' : function(){
		    		let $close = $(".location").children();
		    		let value = $(this).text();		    		
		    		$(".location").empty();
		    		$(".location").append($close);
		    		$(".location").append(value).show();
		    		$("#mask, .window").hide();
		    		$(".filterLocation").val(value);
		    		$("#filterForm").submit();
		    	}
		    })
		    
		    $(document).on("click", ".close_region", function() {
		    		$(".location").hide();    
		    });
		   
		});
	
		/* 페이징 처리 ajax */
		 function paging(p){
			$.ajax({
				url:"freelancerListPaging.ma",
				data:{nowPage:p, cateNum:${fList[0].f.cateNum}},
				success:function(fList){
					let value = '';
					for(let i in fList){
						value += '<table class="free_pro">'
							  + ' <tr><td colspan="4">'
							  + '<a href="freelancerDetail.ma?fNum='+fList[i].freeNum+'"><h4>'+fList[i].f.name+'</h4></a></td>'
							  + '<td rowspan="3" class="pro_img"><img src="/spring/resources/source/profile.png" alt="" class="pro_img"></td></tr>'
							  + '<tr><td colspan="4" class="title">'+fList[i].oneContent+'</td></tr>'
							  + '<tr class="review">'
							  + '<td width="15%"><img src="/spring/resources/source/star.png" alt="" class="review"> 3.5(256)</td><td width="15%">경력 '+fList[i].f.career+'</td>'
							  + '<td width="20%">평균응답시간 1시간</td>'
			                  + '<td><img src="/spring/resources/source/heart.png" alt="" class="bookmark_icon">찜하기</td></tr></table>'
					}
					$("#fListArea").empty();
					$("#fListArea").html(value);
				},
    			error:function(){
    				console.log("페이징처리 ajax 통신 실패");
    			}
			});
		} 
		</script>

        <!-- 지역선택 모달창 -->
        <form action="freelancerListFilter.ma" id="filterForm">
        <input type="hidden" name="location" class="filterLocation" value="">
        <input type="hidden" name="cateNum" value="${fList[0].f.cateNum}">
        <input type="hidden" name="cName" value="${cName}">
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
    </form>
    
<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>

</html>