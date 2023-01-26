<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:set var="path" value="${pageContext.request.contextPath}" />
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>YouBees</title>

            <!-- SWIPER 외부 라이브러리 연결-->
            <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
            <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

            <!--google material icon 사용
        class="material-icons"-->
            <link rel="stylesheet" href="http://fonts.googleapis.com/icon?family=Material+Icons">

            <!-- main.css 연결 -->
            <link rel="stylesheet" href="${path}/resources/css/main.css?a">

            <!-- main.js 연결 -->
            <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
            <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
            <script defer src="${path}/resources/js/main.js"></script>
        </head>

        <body>

            <!-- header -->
            <jsp:include page="common/header.jsp" />

            <main class="mainMain">
                <article id="content">
                    <section id="imgslide">
                        <img src="${path}/resources/source/banner1.jpeg" alt="배너1">
                        <img src="${path}/resources/source/banner2.jpeg" alt="배너2">
                        <img src="${path}/resources/source/banner3.jpeg" alt="배너3">
                    </section>
                </article>
                <div class="service_icons">
                    <div>
                        <img class="main_translation" src="${path}/resources/source/translate.png" alt="번역아이콘"
                            onclick="location.href='selectCategories.ma?sNum=1&sName=통번역'">
                        <p>번역</p>
                    </div>
                    <div><img class="main_marketing" src="${path}/resources/source/marketing.png" alt="마케팅아이콘"
                            onclick="location.href='selectCategories.ma?sNum=2&sName=마케팅'">
                        <p>마케팅</p>
                    </div>
                    <div><img class="main_consulting" src="${path}/resources/source/consulting.png" alt="컨설팅아이콘"
                            onclick="location.href='selectCategories.ma?sNum=3&sName=컨설팅'">
                        <p>컨설팅</p>
                    </div>
                    <div><img class="main_security" src="${path}/resources/source/security.png" alt="보안아이콘"
                            onclick="location.href='selectCategories.ma?sNum=4&sName=보안'">
                        <p>보안</p>
                    </div>
                    <div><img class="main_print" src="${path}/resources/source/print.png" alt="인쇄아이콘"
                            onclick="location.href='selectCategories.ma?sNum=5&sName=인쇄'">
                        <p>인쇄</p>
                    </div>
                    <div><img class="main_etc" src="${path}/resources/source/etc.png" alt="기타아이콘"
                            onclick="location.href='selectCategories.ma?sNum=6&sName=기타'">
                        <p>기타</p>
                    </div>
                </div>

                <h2>인기 프리랜서</h2>
                <div class="best_free">
                    <div class="swiper">
                        <div class="swiper-wrapper">
                        </div>

                        <div class="swiper-button-prev">
                            <div class="material-icons">arrow_back</div>
                        </div>
                        <div class="swiper-button-next">
                            <div class="material-icons">arrow_forward</div>
                        </div>
                    </div>
                </div>

                <h2>인기 서비스</h2>
                <div class="best_service">
                </div>

                <h2 id="com_h2">커뮤니티 인기글</h2>
                <div class="more_com" onclick="location.href='boardList.bo'">전체보기 ></div>
                <div id="Topboard_area">
                </div>

            </main>
            <script type="text/javascript">
                $(function () {
                    selectTopFreeList();
                });

                function selectTopFreeList() {
                    $.ajax({
                        url: "selectTopFreeList.ma",
                        success: function (list) {
                            let value = "";
                            let more = '<a href="freelancerList.ma?cateNum=1&cName=영어통번역&cusNum=0">'
                                + '<div class="swiper-slide free_card first_card_detail" id="free_more">'
                                + '<img src="${path}/resources/source/free_search.png" alt="돋보기사진" class="more_zoom">'
                                + '<div class="more_free_txt">'
                                + '더 많은 프리랜서<br>만나보기'
                                + '</div>'
                                + '</div>'
                                + '</a>';
                            for (let i in list) {

                                value += '<div class="swiper-slide free_card first_card_detail" onclick="newPage(' + list[i].freeNum + ')">'
                                    + '<section class="free_header">';
                                if (list[i].f.changeName != null) {
                                    value += '<img src="${path}/' + list[i].f.changeName + '" alt="프로필사진" class="free_profile">';
                                } else {
                                    value += '<img src="${path}/resources/source/default.png" alt="프로필사진" class="free_profile">';
                                }
                                value += '<div class="star_score">'
                                    + '<img src="${path}/resources/source/star.png" alt="별점">'
                                    + '<span>' + list[i].avgStar + '</span>'
                                    + '</div>'
                                    + '</section>'
                                    + '<p>' + list[i].f.name + '</p>'
                                    + '<section class="sub_info">'
                                    + '<span>경력 ' + list[i].f.career + '&ensp;·&ensp; 평균 50분 내 응답</span>'
                                    + '</section>'
                                    + '</div>';
                                $(".swiper-wrapper").html(more + value);
                            }
                        },

                        error: function () {
                            console.log("조회수 top4 프리랜서 조회 ajax통신 실패");
                        }
                    });
                }
            </script>

            <script type="text/javascript">
                $(function () {
                    selectTopServiceList();
                });

                function selectTopServiceList() {
                    $.ajax({
                        url: "selectTopServiceList.bo",
                        success: function (list) {
                            console.log(list);
                            let value = "";
                            let more = '<a href="selectCategories.ma?sNum=1&sName=통번역">'
                                + '<div class="more_service" onclick="">서비스 더보기 ></div>'
                                + '</a>';
                            for (let i in list) {
                                value += '<a href="freelancerList.ma?cateNum=' + list[i].cateNum + '&cName=' + list[i].name;
                                if ("${loginUserC.cusNum}" != "") {
                                    value += '&cusNum=${loginUserC.cusNum}">';
                                } else {
                                    value += '&cusNum=0">';
                                }

                                value += '<div class="service_card" onclick="">'
                                    + '<img class="service_bigimg" src="${path}/resources/source/service' + list[i].cateNum + '.jpg">'
                                    + '<p>' + list[i].name + '</p>'
                                    + '<div class="service_requset">'
                                    + '<img src="${path}/resources/source/request.png" alt="요청이미지">'
                                    + '<span>' + list[i].mCount + '명 요청</span>'
                                    + '</div>'
                                    + '</div>'
                                $(".best_service").html(more + value);
                            }
                        },
                        error: function () {
                            console.log("조회수 top4 서비스 조회 ajax통신 실패");
                        }
                    });
                }
            </script>

            <script type="text/javascript">
                $(function () {
                    selectTopBoardList();

                });

                function selectTopBoardList() {
                    $.ajax({
                        url: "selectTopBoardList.bo",
                        success: function (list) {
                            let value = "";
                            for (let i in list) {
                                value += '<a href="boardRead.bo?bnum=' + list[i].bnum + '">'
                                    + '<div class="best_community" onclick="">'
                                    + '<div class="com_text">'

                                    + '<div class="com_main">'
                                    + '<p class="com_category">' + list[i].location + '.' + list[i].serviceName + '</p>'
                                    + '<p class="com_title">' + list[i].title + '</p>'
                                    + '<p class="com_main_text">' + list[i].content + '</p>'
                                    + '</div>'
                                    + '<div class="com_like_comment">'
                                    + '<div class="com_like_main">'
                                    + '<img src="${path}/resources/source/like.png" alt="좋아요수" class="com_like">'
                                    + '<span class="com_like_count">' + list[i].lcount + '</span>'
                                    + '</div>'
                                    + '<div class="com_comment_main">'
                                    + '<img src="${path}/resources/source/reply.png" alt="댓글수" class="com_comment">'
                                    + '<span class="com_comment_count" >' + list[i].ccount + '</span>'
                                    + '</div>'
                                    + '<div class="com_count_main">'
                                    + '<img src="${path}/resources/source/count.png" alt="조회수" class="com_count">'
                                    + '<span class="com_view_count">' + list[i].count + '</span>'
                                    + '</div>'
                                    + '</div>'
                                    + '</div>';
                                if (list[i].changeName != null) {
                                    value += '<img src="${path}/' + list[i].changeName + '" alt="커뮤니티이미지" class="com_img">';
                                }

                                value += '</div>'
                                    + '</div>'
                                    + '</a>';
                                $("#Topboard_area").html(value);

                            }
                        },
                        error: function () {
                            console.log("조회수 top3게시글 조회 ajax통신 실패");
                        }
                    });
                }
            </script>
            <script>
                function newPage(f) {
                    let value = "";
                    if ("${loginUserC.cusNum}" != "") {
                        value = '${loginUserC.cusNum}';
                    } else {
                        value = '0';
                    }
                    window.location.href = 'freelancerDetail.ma?freeNum=' + f + '&cusNum=' + value;
                }
            </script>
            <!-- footer -->
            <jsp:include page="common/footer.jsp" />

        </body>

        </html>