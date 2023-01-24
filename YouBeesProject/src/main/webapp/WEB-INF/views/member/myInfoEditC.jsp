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

    <link rel="stylesheet" href="${path}/resources/css/edit.css?q">
    <script src="http://code.jquery.com/jquery-latest.js"></script>
     <script type="text/javascript" src="${path}/resources/js/profile.js"></script>
    <title>Document</title>

</head>

<body>
	<!-- header -->
	<jsp:include page="../common/header.jsp"/>
	
    <div class="editContainer">
     
        <form action="myInfoUpdateC.me" method="post" enctype="multipart/form-data" name="editFrm">
            <div class="editTitle">회원정보 수정</div>
            <table class="editTable">
                <tr>
                    <th>프로필사진</th>
                    <td class="imgTd">
                        <img id="upfile" src="${path}/resources/source/santa.jpg" alt="원래사진" class="profileImg">
                        <label for="selectFile">
                            <img src="${path}/resources/source/camera.png" alt="파일선택" class="selectFileImg">
                        </label> 
                        <input type="file" name="upfile" id="selectfile" onchange="readURL(this);">
                         
                        <input type="hidden" value="${loginUserC.cusNum }" name="cusNum">
                      
							
                    </td>
                </tr>
            
			   
                <tr>
                    <th><label for="name">이름</label></th>
                    <td><input id="name" name="name" value="${loginUserC.name }"></td>
                </tr>
                <tr>
                    <th><label for="id">아이디</label></th>
                    <td><input id="userId" name="userId" value="${loginUserC.userId }" readonly></td>
                </tr>
              
                <tr>
                    <th><label for="phone">전화번호</label></th>
                    <td><input id="phone" name="phone" value="${loginUserC.phone}"></td>
                </tr>
                
                
                 <tr>
                    <th><label for="pw">패스워드</label></th>
                    <td><input type="password" name="pass" value="" id="pw"></td>
                </tr>
                <tr>
                    <th><label for="cpw">패스워드 확인</label></th>
                    <td><input type="password"  value="" id="cpw"></td>
                </tr>
            </table>

            <button type="button" class="editBtn" onclick="submitCheck();">수정하기</button>
 			<script>
 			 function readURL(input) {
                 if (input.files && input.files[0]) {
                     var reader = new FileReader();
                     reader.onload = function (e) {
                         document.getElementById('upfile').src = e.target.result;
                         document.getElementById('selectfile').style.display = "none";
                     };
                     reader.readAsDataURL(input.files[0]);
                 } else {
                     document.getElementById('upfile').src = "";
                 }
             }
			
					
		 	 </script>     
        	<button type="submit" class="deleteBtn openMask">탈퇴하기</button>

        </form>
        	
       </div>
        
        <form action="cusDelete.me" method="post">
            <div id="mask"></div>
            <div class="window">
                <div class="delete_title">
                    <span>회원탈퇴</span>
                   <div class="close">X</div>
                </div>
                <div class="delete_form">
                    <div class="quest1">
                        <div class="question1">탈퇴사유를 알려주시면 저희가 더 나은 서비스를 제공하는 데<br>큰 도움이 된답니다!</div>
                        <textarea></textarea>
                    </div>
                    <div class="quest2">
                  		<div class="question2">비밀번호  <input id="pass" type="password" name="pass" required>
                      								  <input type="hidden" name="cusNum" value="${loginUserC.cusNum}">
                      	
                 		</div>
               		</div>
                 	<button type="submit" value="sendRequest" class="request_send" onclick="warning()">탈퇴하기</button>
               
	                 <script>
						function warning() {
						alert("탈퇴 후 복구가 불가능합니다.\n정말로 탈퇴 하시겠습니까? ");
						}
						</script>
						<script>
						function submitCheck(){
							if($("#name").val() == ""){
								alert("이름을 입력해주세요");
								return;
							}
							if($("#phone").val() == ""){
								alert("전화번호를 입력해주세요");
								return;
							}
							if($("#pw").val() == ""){
								alert("비밀번호를 입력해주세요");
								return;
							}
							if($("#pw").val() != $("#cpw").val()){
								alert("비밀번호가 일치하지 않습니다");
								return;
							}
							
							editFrm.submit();
						};	
					
					</script>
					
				</div>
            </div>
        </form>
          
        <!--  myInfoEdit 창 고객 프리랜서 2개로 나눠서 만들면 될거같음 -->      
  

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
	
</body>
</html>