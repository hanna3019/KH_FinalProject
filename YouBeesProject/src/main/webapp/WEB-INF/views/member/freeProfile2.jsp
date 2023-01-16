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
            <link rel="stylesheet" type="text/css" href="${path}/resources/css/free_profile2.css?asasl">
            <script src="http://code.jquery.com/jquery-latest.js"></script>
            <script type="text/javascript" src="${path}/resources/js/profile.js?asses"></script>
        </head>

        <body>
            <!-- header -->
            <jsp:include page="../common/header.jsp" />

            <div id="profile_container">

                <div class="title">
                    <img class="pro_img" src="${path}/resources/source/santa.jpg" alt="프로필사진">
                    <h2>${f.f.name}</h2>
                    <p class="inline f13">${f.category} &emsp;<img class="img_small"
                            src="${path}/resources/source/location.png" alt="">${f.f.location}</p>
                    <h4>${f.oneContent}</h4>
                </div>

                <div id="profile_tbl">
                    <div class="prof_box">
                        <div class="small_box"><img class="star_img" src="${path}/resources/source/star.png"
                                alt="평점">4.7</div>
                        <h3>평점</h3>
                    </div>
                    <div class="prof_box">
                        <div class="small_box">50</div>
                        <h3>고용수</h3>
                    </div>
                    <div class="prof_box">
                        <div class="small_box"><img class="badge" src="${path}/resources/source/medal.png" alt="배지">
                        </div>
                        <h3>리뷰왕</h3>
                    </div>
                </div>
                <table id="profile_cnt">
                    <form action="" id="detail_form">
                        <tr>
                            <th>상세소개</th>
                            <th width="10%">
                                <span class="regBtn1 detail_rev_btn">수정하기</span>
                                <a href="" class="regBtn1 hidden">등록하기</a>
                            </th>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="detail">${f.frContent}</div>
                                <textarea name="" class="detail_revise hidden" cols="80" rows="6">${f.frContent}</textarea>
                            </td>
                        </tr>
                    </form>
                    <tr>
                        <th>활동지역</th>
                        <th><span class="regBtn2 location_btn">변경하기</span>
                        	<a href="" class="regBtn2 hidden">등록하기</a>
                        </th>
                    </tr>
                    <tr>
                        <td colspan="2"><div class="location">${f.f.location}</div>
 						<select id="regionSelect" class="hidden">
							<option value="">선택</option>
							<option value="1">서울</option>
							<option value="2">세종</option>
							<option value="3">강원</option>
							<option value="4">인천</option>
							<option value="5">경기</option>
							<option value="6">충북</option>
							<option value="7">충남</option>
							<option value="8">경북</option>
							<option value="9">대전</option>
							<option value="10">대구</option>
							<option value="11">전북</option>
							<option value="12">경남</option>
							<option value="13">울산</option>
							<option value="14">광주</option>
							<option value="15">부산</option>
							<option value="16">전남</option>
							<option value="17">제주</option>
						</select>          
						<select id="regionSelectDetail" name="location" class="hidden">
							<option value="">선택</option>
						</select>
						<input type="hidden" name="region" class="region" value="">             
                        </td>
                    </tr>
                    <form action="" id="certifi_from">
                    <script>
                    /* 지역리스트 가져옴 */
                    $("#regionSelect").change(function(){
                    	if($(this).val() != ""){
                    		let lnum = $(this).val();
                    		let location = $("#regionSelect  option:selected").text();
                    		$(".region").val(location);
                    		$.ajax({
                    			url: "selectLocationList",
                    			data: {lNum:$(this).val()},
                    			success: function(list){
                    				$("#regionSelectDetail").empty();
                    				$("#regionSelectDetail").append("<option value='0'>선택</option>");
                    				$("#regionSelectDetail").append("<option value='전체'>"+ location +"전체</option>");
                    				for(let i in list){
                    					let value = list[i].city;
                    					let optionLabel = list[i].city;
                    					let option = $("<option value="+ value +">"+optionLabel+"</option>");
                    					$("#regionSelectDetail").append(option);
                    				}
                    			},
                    			error: function(){
                    				console.log("service목록 ajax 통신실패");
                    			}
                    		});
                    	}
                    });

                    </script>
                    
                        <tr>
                            <th>작업물 및 자격정보</th>
                            <th><span class="regBtn certifi_btn">등록하기</span></th>
                        </tr>
                    </form>
                    <tr><!-- 등록 몇 개까지였는지 기억이 안나서 근데 4개 넘어가면 안 돼요! -->
                        <td colspan="2">
                            <form action="">
                                <div class="image_upload">
                                    <label for="file_input1">
                                        <img alt="" src="${path}/resources/source/upload.png" id="upload_img1">
                                    </label>
                                    <input type="file" id="file_input1" onchange="readURL1(this)">
                                    <img id="preview1" onError="this.style.visibility='hidden'" />

                                    <label for="file_input2">
                                        <img alt="" src="${path}/resources/source/upload.png" id="upload_img2">
                                    </label>
                                    <input type="file" id="file_input2" onchange="readURL2(this)">
                                    <img id="preview2" onError="this.style.visibility='hidden'" />

                                    <label for="file_input3">
                                        <img alt="" src="${path}/resources/source/upload.png" id="upload_img3">
                                    </label>
                                    <input type="file" id="file_input3" onchange="readURL3(this)">
                                    <img id="preview3" onError="this.style.visibility='hidden'" />

                                    <label for="file_input4">
                                        <img alt="" src="${path}/resources/source/upload.png" id="upload_img4">
                                    </label>
                                    <input type="file" id="file_input4" onchange="readURL4(this)">
                                    <img id="preview4" onError="this.style.visibility='hidden'" />
                                </div>
                            </form>
                        </td>
                    </tr>
                    <script>
                        function readURL1(input) {
                            if (input.files && input.files[0]) {
                                var reader = new FileReader();
                                reader.onload = function (e) {
                                    document.getElementById('preview1').src = e.target.result;
                                    document.getElementById('upload_img1').style.display = "none";
                                };
                                reader.readAsDataURL(input.files[0]);


                            } else {
                                document.getElementById('preview1').src = "";
                            }
                        }
                        function readURL2(input) {
                            if (input.files && input.files[0]) {
                                var reader = new FileReader();
                                reader.onload = function (e) {
                                    document.getElementById('preview2').src = e.target.result;
                                    document.getElementById('upload_img2').style.display = "none";
                                };
                                reader.readAsDataURL(input.files[0]);


                            } else {
                                document.getElementById('preview2').src = "";
                            }
                        }
                        function readURL3(input) {
                            if (input.files && input.files[0]) {
                                var reader = new FileReader();
                                reader.onload = function (e) {
                                    document.getElementById('preview3').src = e.target.result;
                                    document.getElementById('upload_img3').style.display = "none";
                                };
                                reader.readAsDataURL(input.files[0]);


                            } else {
                                document.getElementById('preview3').src = "";
                            }
                        }
                        function readURL4(input) {
                            if (input.files && input.files[0]) {
                                var reader = new FileReader();
                                reader.onload = function (e) {
                                    document.getElementById('preview4').src = e.target.result;
                                    document.getElementById('upload_img4').style.display = "none";
                                };
                                reader.readAsDataURL(input.files[0]);


                            } else {
                                document.getElementById('preview4').src = "";
                            }
                        }

                    </script>
                    <form action="" id="contect_form">
                        <tr>
                            <th>연락가능시간</th>
                            <th><span class="regBtn contect_btn">수정하기</span></th>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <span class="contect_time">${f.callTime}</spen>
                                <input type="text" class="contect_revise hidden" value="${f.callTime}">
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
                                <input type="number" class="career_revise hidden">
                            </td>
                        </tr>
                        <tr>
                            <th>가격</th>
                            <th><span class="regBtn fee_btn">수정하기</span></th>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <span class="fee">${f.price}</span>
                                <input type="text" class="fee_revise hidden" value="${f.price}">
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
            <jsp:include page="../common/footer.jsp" />

        </body>

        </html>