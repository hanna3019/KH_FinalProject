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
            <link rel="stylesheet" type="text/css" href="${path}/resources/css/free_profile2.css?jp">
            <script src="http://code.jquery.com/jquery-latest.js"></script>
            <script type="text/javascript" src="${path}/resources/js/profile.js?qvp"></script>
        </head>

        <body>
            <!-- header -->
            <jsp:include page="../common/header.jsp" />

            <div id="profile_container">
                <div class="title">
                <c:choose>
                	<c:when test="${not empty f.f.changeName}">
	                    <img class="pro_img" src="${path}/${f.f.changeName}" alt="프로필사진">
                	</c:when>
                	<c:otherwise>
	                    <img class="pro_img" src="${path}/resources/source/profile.png" alt="프로필사진">
                	</c:otherwise>
                </c:choose>
                    <h2>${f.f.name}</h2>
                    <p class="inline f13">${f.category} &emsp;<img class="img_small"
                            src="${path}/resources/source/location.png" alt="">${f.f.location}</p><br>
                    <form action="profileUpdate.me" method="post" name="oneContentFrm">
	                    <input type="hidden" name="freeNum" value="${loginUserF.freeNum }">
	                    <c:choose>
	                    	<c:when test="${empty f.oneContent}">
			                    <h4 class="oneContent">등록된 한 줄 소개가 없습니다</h4>
			                    <input type="text" name="oneContent" class="oneContent_rev hidden" size="50" value=""><br>                    	                    	
	                    	</c:when>
	                    	<c:otherwise>
			                    <h4 class="oneContent">${f.oneContent}</h4> 
			                    <input type="text" name="oneContent" class="oneContent_rev hidden" size="50" value="${f.oneContent}"><br>   	
	                    	</c:otherwise>
	                    </c:choose>
	                    <span class="regBtn0 oneContent_rev_btn">수정하기</span>
	                    <a href="javascript:updateSubmit1();" class="regBtn0 hidden">등록하기</a>
                    </form>
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
                   <form action="profileUpdate.me" method="post" id="detail_form" name="frContentFrm">
              			<input type="hidden" name="freeNum" value="${loginUserF.freeNum }">
                       <tr>
                           <th>상세소개</th>
                           <th width="10%">
                               <span class="regBtn1 detail_rev_btn">수정하기</span>
                               <a href="javascript:updateSubmit2();" class="regBtn1 hidden">등록하기</a>
                           </th>
                       </tr>
                       <tr>
	                        <td colspan="2">
	                        <c:choose>
	                        	<c:when test="${empty f.frContent}">
	                        		<div class="detail">등록된 상세 설명이 없습니다</div>
	                             <textarea name="frContent" class="detail_revise hidden" cols="80" rows="6"></textarea>
	                        	</c:when>
	                        	<c:otherwise>
	                             <div class="detail">${f.frContent}</div>
	                             <textarea name="frContent" class="detail_revise hidden" cols="80" rows="6">${f.frContent}</textarea>                            	
	                        	</c:otherwise>
	                        </c:choose>
	                        </td>
                       </tr>
                   </form>
                  
                  <form action="FreelancerUpdate.me" method="post" name="locationFrm">
                    <input type="hidden" name="freeNum" value="${loginUserF.freeNum}">
                    <tr>
                        <th>활동지역</th>
                        <th>
                        	<span class="regBtn2 location_btn">변경하기</span>
                        	<a href="javascript:updateSubmit3();" class="regBtn2 hidden">등록하기</a>
                        </th>
                    </tr>
                    <tr>
                        <td colspan="2">
	                        <div class="location">${f.f.location}</div>
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
								<select id="regionSelectDetail" class="hidden">
									<option value="">선택</option>
								</select>
							<input type="hidden" name="location" class="region" value="">             
                        </td>
                    </tr>
                  </form>
                    
                
                    
                  <form action="certificateFilesUpload.ma" id="certifi_form" name="UploadFrm" method="post" enctype="multipart/form-data">
                  <input type="hidden" name="freeNum" value="${loginUserF.freeNum}">
	                    <tr>
	                        <th>작업물 및 자격정보</th>
	                        <th><span class="regBtn certifi_btn" onclick="filesUpload();">등록하기</span></th>
	                    </tr>
	                    <tr><!-- 등록 몇 개까지였는지 기억이 안나서 근데 4개 넘어가면 안 돼요! -->
	                        <td colspan="2">
	                            <div class="image_upload">
	                                <label for="file_input1">
	                                    <img alt="" src="${path}/resources/source/upload.png" id="upload_img1">
	                                </label>
	                                <input type="file" name="file1" id="file_input1" onchange="readURL1(this)">
	                                <img id="preview1" onError="this.style.visibility='hidden'" />
	
	                                <label for="file_input2">
	                                    <img alt="" src="${path}/resources/source/upload.png" id="upload_img2">
	                                </label>
	                                <input type="file" name="file2" id="file_input2" onchange="readURL2(this)">
	                                <img id="preview2" onError="this.style.visibility='hidden'" />
	
	                                <label for="file_input3">
	                                    <img alt="" src="${path}/resources/source/upload.png" id="upload_img3">
	                                </label>
	                                <input type="file" name="file3" id="file_input3" onchange="readURL3(this)">
	                                <img id="preview3" onError="this.style.visibility='hidden'" />
	
	                                <label for="file_input4">
	                                    <img alt="" src="${path}/resources/source/upload.png" id="upload_img4">
	                                </label>
	                                <input type="file" name="file4" id="file_input4" onchange="readURL4(this)">
	                                <img id="preview4" onError="this.style.visibility='hidden'" />
	                            </div>
	                        </td>
                    	</tr>
                    </form>
                    
                    <form action="profileUpdate.me" id="contect_form" name="contectFrm">
                    <input type="hidden" name="freeNum" value="${loginUserF.freeNum }">
                        <tr>
                            <th>연락가능시간</th>
                            <th><span class="regBtn4 contect_btn">수정하기</span>
                            	<a href="javascript:updateSubmit5();" class="regBtn4 hidden">등록하기</a>
                            </th>
                        </tr>
                        <tr>
                            <td colspan="2">
                            <c:choose>
                            	<c:when test="${empty f.callTime}">
	                                <span class="contect_time">등록된 시간이 없습니다</span>
	                                <input type="text" name="callTime" class="contect_revise hidden" value="">                            	
                            	</c:when>
                            	<c:otherwise>
	                                <span class="contect_time">${f.callTime}</span>
	                                <input type="text" name="callTime" class="contect_revise hidden" value="${f.callTime}">                            	                            	
                            	</c:otherwise>
                            </c:choose>
                            </td>
                        </tr>
                    </form>
                    
                    <form action="FreelancerUpdate.me" method="post" id="career_form" name="careerFrm">
	                    <input type="hidden" name="freeNum" value="${loginUserF.freeNum }">
                        
                        <tr>
                            <th>경력</th>
                            <th>
                            	<span class="regBtn3 career_btn">수정하기</span>
                            	<a href="javascript:updateSubmit4();" class="regBtn3 hidden">등록하기</a>
                            </th>
                        </tr>
                        
                        <tr>
                            <td colspan="2">
                                <span class="career">${f.f.career}</span>
                                <input type="number" name="career" class="career_revise hidden" value="">
                            </td>
                        </tr>
                    </form>
                     
                     <form action="profileUpdate.me" id="price_form" name="priceFrm">
                        <input type="hidden" name="freeNum" value="${loginUserF.freeNum }">
                        <tr>
                            <th>가격</th>
                            <th><span class="regBtn5 fee_btn">수정하기</span>
                            	<a href="javascript:updateSubmit6();" class="regBtn5 hidden">등록하기</a>
                            </th>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <span class="fee">${f.price}</span>
                                <input type="text" name="price" class="fee_revise hidden" value="${f.price}">
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
                     <c:choose>
            	<c:when test="${not empty rList}">
		            <c:forEach var="r" items="${rList}">
		                <tr class="first_row">
		                    <td class="first_row" colspan="2">${r.name}</td>
		                </tr>
		                <tr>
		                    <td width="20%" class="f14">${r.service}</td>
		                    <td><img src="${path}/resources/source/star.png" alt="별점" class="img_small">${r.star}</td>
		                </tr>
		                <tr>
		                    <td colspan="2" class="review">${r.content}</td>
		                </tr>
		                <tr>
		                    <td colspan="2" class="f12">${r.regDate}</td>
		                </tr>
		            </c:forEach>
            	</c:when>
            	<c:otherwise>
           			<tr>
	                    <td class="first_row" colspan="2">아직 등록된 리뷰가 없습니다</td>
	                </tr>
            	</c:otherwise>
            </c:choose>
                </table>
            </div>

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
                    				$("#regionSelectDetail").append("<option value=''>선택</option>");
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
                    
                    $("#regionSelectDetail").change(function(){
                    	if($(this).val() != ""){
                    		let value = $("#regionSelect option:selected").text()+ " " +$("#regionSelectDetail option:selected").val();
                    		$(".region").val(value);
                    	}
                    });
                    </script>
                    
                    
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
                    
            <!-- footer -->
            <jsp:include page="../common/footer.jsp" />

        </body>

        </html>