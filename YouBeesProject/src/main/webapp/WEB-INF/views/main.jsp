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

    <!-- SWIPER 외부 라이브러리 연결-->
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

    <!--google material icon 사용
        class="material-icons"-->
    <link rel="stylesheet" href="http://fonts.googleapis.com/icon?family=Material+Icons">

    <!-- main.css 연결 -->
    <link rel="stylesheet" href="${path}/resources/css/main.css">

    <!-- main.js 연결 -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <script defer src="${path}/resources/js/main.js"></script>
</head>
<body>
<!-- header -->
	<jsp:include page="common/header.jsp"/>

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
                <img class="main_translation" src="${path}/resources/source/translate.png" alt="번역아이콘" onclick="">
                <p>번역</p>
            </div>
            <div><img class="main_marketing" src="${path}/resources/source/marketing.png" alt="마케팅아이콘" onclick="">
                <p>마케팅</p>
            </div>
            <div><img class="main_consulting" src="${path}/resources/source/consulting.png" alt="컨설팅아이콘" onclick="">
                <p>컨설팅</p>
            </div>
            <div><img class="main_security" src="${path}/resources/source/security.png" alt="보안아이콘" onclick="">
                <p>보안</p>
            </div>
            <div><img class="main_print" src="${path}/resources/source/print.png" alt="인쇄아이콘" onclick="">
                <p>인쇄</p>
            </div>
            <div><img class="main_etc" src="${path}/resources/source/etc.png" alt="기타아이콘">
                <p>기타</p>
            </div>
        </div>

        <h2>인기 프리랜서</h2>
        <div class="best_free">
            <div class="swiper">
                <div class="swiper-wrapper">

                    <div class="swiper-slide free_card" onclick="">
                        <section class="free_header">
                            <img src="${path}/resources/source/profile.png" alt="프로필사진" class="free_profile">
                            <div class="star_score">
                                <img src="${path}/resources/source/star.png" alt="별점">
                                <span>4.7</span>
                            </div>
                        </section>
                        <p>변진주의독일어는짱</p>
                        <section class="sub_info">
                            <span>경력 5년 &ensp;·&ensp; 평균 30분 내 응답</span>
                        </section>
                    </div>

                    <div class="swiper-slide free_card" onclick="">
                        <section class="free_header">
                            <img src="${path}/resources/source/profile.png" alt="프로필사진" class="free_profile">
                            <div class="star_score">
                                <img src="${path}/resources/source/star.png" alt="별점">
                                <span>4.9</span>
                            </div>
                        </section>
                        <p>저승원 인쇄소</p>
                        <section class="sub_info">
                            <span>경력 15년 &ensp;·&ensp; 평균 1시간 내 응답</span>
                        </section>
                    </div>

                    <div class="swiper-slide free_card" onclick="">
                        <section class="free_header">
                            <img src="${path}/resources/source/profile.png" alt="프로필사진" class="free_profile">
                            <div class="star_score">
                                <img src="${path}/resources/source/star.png" alt="별점">
                                <span>4.8</span>
                            </div>
                        </section>
                        <p>연승 회계사무소</p>
                        <section class="sub_info">
                            <span>경력 3년 &ensp;·&ensp; 평균 45분 내 응답</span>
                        </section>
                    </div>

                    <div class="swiper-slide free_card" onclick="">
                        <section class="free_header">
                            <img src="${path}/resources/source/profile.png" alt="프로필사진" class="free_profile">
                            <div class="star_score">
                                <img src="${path}/resources/source/star.png" alt="별점">
                                <span>4.3</span>
                            </div>
                        </section>
                        <p>호로록 마케팅</p>
                        <section class="sub_info">
                            <span>경력 20년 &ensp;·&ensp; 평균 20분 내 응답</span>
                        </section>
                    </div>

                    <div class="swiper-slide free_card" onclick="location.href='freelancer_list.html'" id="first_card">
                        <img src="${path}/resources/source/free_search.png" alt="돋보기사진" class="more_zoom">
                        <div class="more_free_txt">
                            더 많은 프리랜서<br>만나보기
                        </div>
                    </div>

                    <div class="swiper-slide free_card" onclick="">
                        <section class="free_header">
                            <img src="${path}/resources/source/profile.png" alt="프로필사진" class="free_profile">
                            <div class="star_score">
                                <img src="${path}/resources/source/star.png" alt="별점">
                                <span>4.6</span>
                            </div>
                        </section>
                        <p>해나의 야매 오픽</p>
                        <section class="sub_info">
                            <span>경력 8년 &ensp;·&ensp; 평균 50분 내 응답</span>
                        </section>
                    </div>

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
            <div class="more_service">서비스 더보기 ></div>

            <div class="service_card" onclick="">
                <img class="service_bigimg" src="${path}/resources/source/service25.jpg">
                <p>굿즈/판촉물 제작</p>
                <div class="service_requset">
                    <img src="${path}/resources/source/request.png" alt="요청이미지">
                    <span>615명 요청</span>
                </div>
            </div>

            <div class="service_card" onclick="">
                <img class="service_bigimg" src="${path}/resources/source/service7.jpg">
                <p>블로그 마케팅</p>
                <div class="service_requset">
                    <img src="${path}/resources/source/request.png" alt="요청이미지">
                    <span>284명 요청</span>
                </div>
            </div>

            <div class="service_card" onclick="">
                <img class="service_bigimg" src="${path}/resources/source/service35.jpg">
                <p>음악 편집 및 제작</p>
                <div class="service_requset">
                    <img src="${path}/resources/source/request.png" alt="요청이미지">
                    <span>10,403명 요청</span>
                </div>
            </div>

            <div class="service_card" onclick="">
                <img class="service_bigimg" src="${path}/resources/source/service14.jpg">
                <p>프렌차이즈 창업</p>
                <div class="service_requset">
                    <img src="${path}/resources/source/request.png" alt="요청이미지">
                    <span>875명 요청</span>
                </div>
            </div>

        </div>

        <h2 id="com_h2">커뮤니티 인기글</h2>
        <div class="best_community" onclick="">
            <div class="more_com" onclick="location.href='board.html'">전체보기 ></div>
            <div class="com_text">
                <div class="com_main">
                    <p class="com_category">통번역</p>
                    <p class="com_title">이 정도면 영어 심각한 수준 아닌가요?</p>
                    <p class="com_main_text">아니 어제 영화를 보는데 번역자가 오역 많을 수 있다고 미리 밑밥을 깔더라고요. 그리고 FRIDAY라는 타이틀이<br>
                        나왔는데
                        '목요일'이라고 번역하신거 있죠? 이건 좀 심각한거 아닌가요? 진짜 기대 많이 했던 영화인데 결국 못 봤어요.<br> 마음의 상처를 받아서 그러는데 혹시
                        컨설팅 잘
                        해주시는
                        분 계신가요? 저는 블라블라블라블라블라</p>
                </div>
                <div class="com_like_comment">
                    <div class="com_like_main">
                        <img src="${path}/resources/source/like.png" alt="좋아요수" class="com_like">
                        <span class="com_like_count">12</span>
                    </div>
                    <div class="com_comment_main">
                        <img src="${path}/resources/source/reply.png" alt="댓글" class="com_comment">
                        <span class="com_comment_count">17</span>
                    </div>
                </div>
            </div>
            <img src="${path}/resources/source/movie.jpg" alt="커뮤니티이미지" class="com_img">
        </div>

        <div class="best_community" onclick="">
            <div class="com_text">
                <div class="com_main">
                    <p class="com_category">통번역</p>
                    <p class="com_title">이 정도면 영어 심각한 수준 아닌가요?</p>
                    <p class="com_main_text">아니 어제 영화를 보는데 번역자가 오역 많을 수 있다고 미리 밑밥을 깔더라고요. 그리고 FRIDAY라는 타이틀이<br>
                        나왔는데
                        '목요일'이라고 번역하신거 있죠? 이건 좀 심각한거 아닌가요? 진짜 기대 많이 했던 영화인데 결국 못 봤어요.<br> 마음의 상처를 받아서 그러는데 혹시
                        컨설팅 잘
                        해주시는
                        분 계신가요? 저는 블라블라블라블라블라</p>
                </div>
                <div class="com_like_comment">
                    <div class="com_like_main">
                        <img src="${path}/resources/source/like.png" alt="좋아요수" class="com_like">
                        <span class="com_like_count">15</span>
                    </div>
                    <div class="com_comment_main">
                        <img src="${path}/resources/source/reply.png" alt="댓글" class="com_comment">
                        <span class="com_comment_count">21</span>
                    </div>
                </div>
            </div>
            <img src="${path}/resources/source/movie.jpg" alt="커뮤니티이미지" class="com_img">
        </div>

        <div class="best_community" onclick="">
            <div class="com_text">
                <div class="com_main">
                    <p class="com_category">통번역</p>
                    <p class="com_title">이 정도면 영어 심각한 수준 아닌가요?</p>
                    <p class="com_main_text">아니 어제 영화를 보는데 번역자가 오역 많을 수 있다고 미리 밑밥을 깔더라고요. 그리고 FRIDAY라는 타이틀이<br>
                        나왔는데
                        '목요일'이라고 번역하신거 있죠? 이건 좀 심각한거 아닌가요? 진짜 기대 많이 했던 영화인데 결국 못 봤어요.<br> 마음의 상처를 받아서 그러는데 혹시
                        컨설팅 잘
                        해주시는
                        분 계신가요? 저는 블라블라블라블라블라</p>
                </div>
                <div class="com_like_comment">
                    <div class="com_like_main">
                        <img src="${path}/resources/source/like.png" alt="좋아요수" class="com_like">
                        <span class="com_like_count">32</span>
                    </div>
                    <div class="com_comment_main">
                        <img src="${path}/resources/source/reply.png" alt="댓글" class="com_comment">
                        <span class="com_comment_count">19</span>
                    </div>
                </div>
            </div>
            <img src="${path}/resources/source/movie.jpg" alt="커뮤니티이미지" class="com_img">
        </div>

    </main>

<!-- footer -->
	<jsp:include page="common/footer.jsp"/>
</body>
</html>