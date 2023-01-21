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
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<link rel="stylesheet" href="${path}/resources/css/join_f.css?l">
	<title>YouBees</title>
</head>

<body>

	<!-- header -->
	<jsp:include page="../common/header.jsp"/>

	<div class="container">

		<form action="FreelancerInsert.me" method="post" name="freeEnrollFrm" id="freeEnrollFrm">

			<table id="loginTable">
				<div class="title">프리랜서 회원가입</div>
				<tr>
					<td class="closer">*이름</td>
					<td><input name="name" type="text" required placeholder=""></td>
				</tr>
				<tr>
					<td class="closer">*아이디</td>
					<td><input id="userId" name="userId" type="text" required placeholder="5자 이상 입력하세요"><br>
						<span class="idCheck"></span>
					</td>
				</tr>
				<tr>
					<td class="closer">*비밀번호</td>
					<td><input type="password" name="pass" required placeholder=""></td>
				</tr>
				<tr>
					<td class="closer">*비밀번호 확인</td>
					<td><input type="password" name="repwd" required placeholder=""></td>
				</tr>
				<tr>
					<td class="closer">*전화번호</td>
					<td><input name="tel" type="text" placeholder="전화번호"></td>
				</tr>
				<tr>
					<td class="closer">&nbsp;성별</td>
					<td>
						<input id="radio" type="radio" name="gender" value="M" checked><label for="radio">남</label>
						<input id="radio2" type="radio" name="gender" value="F"><label for="radio2">여</label>
					</td>
				</tr>

				<tr>
					<td class="closer">*직종</td>
					<td>
						<select id="jobSelect" required>
							<option value="">선택</option>
							<option value="1">통번역</option>
							<option value="2">마케팅</option>
							<option value="3">컨설팅</option>
							<option value="4">보안</option>
							<option value="5">인쇄</option>
							<option value="6">기타</option>
						</select>
						<select name="cateNum" id="jobSelect2" required>
							<option value="">선택</option>
						</select>
						<span class="jobSelected"></span>
					</td>
				</tr>

				<tr>
					<td class="closer">&nbsp;경력</td>
					<td>
						<input name="career" type="number" min="0" placeholder="">&nbsp;년
					</td>
				</tr>

				<tr>
					<td class="closer">&nbsp;활동지역</td>
					<td>
						<select id="regionSelect">
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
						<select id="regionSelectDetail" name="location">
							<option value="">선택</option>
						</select>
						<span class="regionSelected"></span>
						<input type="hidden" name="region" class="region" value="">
					</td>
				</tr>
			</table>
			
			<script>

				$(function(){
					/* 서비스 카테고리 가져옴*/
					$("#jobSelect").change(function(){
						if($(this).val() != ""){
							let snum = $(this).val();
							$.ajax({
								url: "selectServiceList",
								data: {sNum:$(this).val()},
								success: function(list){
									$("#jobSelect2").empty();
									$("#jobSelect2").append("<option value=''>선택</option>");
									for(let i in list){
										let value = list[i].cateNum;
										let optionLabel = list[i].name;
										let option = $("<option value="+ value +">"+optionLabel+"</option>");
										$("#jobSelect2").append(option);
									}
								},
								error: function(){
									console.log("service목록 ajax 통신실패");
								}
							});
						}
					});
					
					/* 선택된 직종 표시 */
					$("#jobSelect2").change(function(){
						if($(this).val() != ""){
							$(".jobSelected").text($("#jobSelect2 option:selected").text());
						}
					})
					
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
					
					/* 선택된 지역 표시 */
					$("#regionSelectDetail").change(function(){
						if($(this).val() == 0){
							$(".regionSelected").text($("#regionSelect option:selected").text()+" 전체");
						}else{
							$(".regionSelected").text($("#regionSelectDetail option:selected").text());
						}
					})
				});
			</script>
			<div class="joinTou">
				<div class="tou1" colspan="2"><input class="agree" id="agree1" type="checkbox" name="agree" required
						value="Y,N"><label for="agree1">이용약관 동의 (필수)</label>
				</div>
				<div class="tou2" colspan="2"><input class="agree" id="agree2" type="checkbox" name="agree2" required
						value="Y,N"><label for="agree2">개인정보 수집 및 동의 (필수)</label></div>

				<div class="tou3" colspan="2"><input class="agree" id="agree3" type="checkbox" name="agree3" required value="Y,N">
					<label for="agree3">만 14세 이상 (필수)</label>
				</div>
			</div>

			<div class="joinSubmit">
				<input class="submit" type="button" value="회원가입" id="enrollBtn" onclick="inputCheck();">
				
				<input class="submit" type="reset" value="돌아가기">
			</div>
		</form>
		
		<script type="text/javascript">
		function inputCheck(){
			if(freeEnrollFrm.name.value == ""){
				alert("이름을 입력해주세요");
				return;
			}
			if(freeEnrollFrm.userId.value== ""){
				alert("아이디를 입력해주세요");
				return;
			}
			if(freeEnrollFrm.pass.value== ""){
				alert("비밀번호를 입력해주세요");
				return;
			}
			if(freeEnrollFrm.pass.value != freeEnrollFrm.repwd.value){
				alert("비밀번호가 일치하지 않습니다");
				freeEnrollFrm.repwd.focus();
				return;
			}
			if(freeEnrollFrm.tel.value == ""){
				alert("전화번호를 입력해주세요");
				return;
			}
			
			if(freeEnrollFrm.jobSelect.value == ""){
				alert("직종을 선택해주세요");
				return;
			}
			
			if(freeEnrollFrm.cateNum.value == ""){
				alert("세부직종을 선택해주세요");
				return;
			}
			
			if(freeEnrollFrm.career.value == ""){
				alert("경력을 선택해주세요");
				return;
			}
			if(freeEnrollFrm.region.value == ""){
				alert("활동지역을 선택해주세요");
				return;
			}
			if(!freeEnrollFrm.agree.checked || !freeEnrollFrm.agree2.checked || !freeEnrollFrm.agree3.checked){
				alert("약관동의를 해주세요");
				return;
			}
			freeEnrollFrm.submit()
			alert("회원가입이 완료되었습니다😀")
		}
			$(function(){
				const $idInput = $("#userId");
				$idInput.keyup(function(){
					if($idInput.val().length >= 5){
						$.ajax({
							url: "idCheck.me",
							data: {checkId:$idInput.val()},
							success:function(result){
								if(result == "NNN"){
									$(".idCheck").show();
									$(".idCheck").css("color", "red").text("중복된 아이디 입니다");
									$("#freeEnrollFrm #enrollBtn").attr("disabled", true);									
								}else{
									$(".idCheck").show();
									$(".idCheck").css("color", "green").text("사용가능한 아이디 입니다");
									$("#freeEnrollFrm #enrollBtn").attr("disabled", false);
								}
								
							},
							error:function(){
	    						console.log("아이디 중복체크 ajax통신 실패");
	    					}
						});
					}else{
						$(".idCheck").hide();
						$("#freeEnrollFrm #enrollBtn").attr("disabled", true);
					}
				})
			})
		</script>
		
	</div>
	
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>