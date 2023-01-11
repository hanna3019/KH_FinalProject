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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/receivedRequest.css?sda">
    <title>Document</title>
</head>

<body>
<!-- header -->
	<jsp:include page="../common/header.jsp"/>

    <main>
        <div class="mainTitle">받은요청</div>

        <div class="requestProfile">
            <img src="${path}/resources/source/user.png" alt="user">
            <div class="requestInfo">
                <div class="userName">정한나</div>
                <div class="location">서울 영등포구</div>
                <div class="detail">취미 / 50,000원~100,000원 / 토요일, 일요일</div>
            </div>
            <div class="requestTimeNdelete">
                <div class="createTime">2시간 전</div>

                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary detailBtn" data-bs-toggle="modal"
                    data-bs-target="#exampleModal">
                    상세보기
                </button>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">요청상세</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div>
                                    <h6>매칭을 원하는 이유는 무엇인가요?</h6>
                                    <p>취미</p>
                                </div>
                                <div>
                                    <h6>원하는 가격대는 얼마인가요?</h6>
                                    <p>50,000원 ~ 100,000원</p>
                                </div>
                                <div>
                                    <h6>선호하는 요일은 언제인가요?</h6>
                                    <p>토요일, 일요일</p>
                                </div>
                                <div>
                                    <h6>그 외 전달하고 싶은 사항이 있다면 알려주세요.</h6>
                                    <p>한 회에 2시간씩 가능한가요~?</p>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary acceptBtn">수락</button>
                                <button type="button" class="btn btn-secondary deleteBtn"
                                    data-bs-dismiss="modal">삭제</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="requestProfile">
            <img src="${path}/resources/source/user.png" alt="user">
            <div class="requestInfo">
                <div class="userName">정한나</div>
                <div class="location">서울 영등포구</div>
                <div class="detail">취미 / 50,000원~100,000원 / 토요일, 일요일</div>
            </div>
            <div class="requestTimeNdelete">
                <div class="createTime">2시간 전</div>

                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary detailBtn" data-bs-toggle="modal"
                    data-bs-target="#exampleModal">
                    상세보기
                </button>

                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">요청상세</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div>
                                    <h6>매칭을 원하는 이유는 무엇인가요?</h6>
                                    <p>취미</p>
                                </div>
                                <div>
                                    <h6>원하는 가격대는 얼마인가요?</h6>
                                    <p>50,000원 ~ 100,000원</p>
                                </div>
                                <div>
                                    <h6>선호하는 요일은 언제인가요?</h6>
                                    <p>토요일, 일요일</p>
                                </div>
                                <div>
                                    <h6>그 외 전달하고 싶은 사항이 있다면 알려주세요.</h6>
                                    <p>한 회에 2시간씩 가능한가요~?</p>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary acceptBtn">수락</button>
                                <button type="button" class="btn btn-secondary deleteBtn"
                                    data-bs-dismiss="modal">삭제</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>

<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
</body>

</html>