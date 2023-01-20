<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="${path}/resources/css/join_c.css?l">
    <title>YouBees</title>

<body>
	<!-- header -->
	<jsp:include page="../common/header.jsp"/>
	
    <div class="container">
        <form action="CustomerInsert.me" method="post" name="customerEnrollFrm" id="customerEnrollFrm">
            <table id="loginTable">
                <div class="title">일반 회원가입</div>
                <tr>
                    <td class="closer">*이름</td>
                    <td><input name="name" type="text"  placeholder=""></td>
                   <!--  <tr colspan="2" id="name_hidden"></tr> -->
                </tr>
                
                <tr>
                    <td class="closer">*아이디</td>
                    <td><input id="userId" name="userId" type="text"  placeholder="5자 이상 입력하세요"><br>
                    <span class="idCheck"></span>
                    </td>
                </tr>
                <tr>
                    <td class="closer">*비밀번호</td>
                    <td><input type="password" name="pass"  placeholder=""></td></br>
                </tr>
                <tr>
                    <td class="closer">*비밀번호 확인</td>
                    <td><input type="password" name="repwd"  placeholder=""></td>
                </tr>
                <tr>
                    <td class="closer">*전화번호</td>
                    <td><input name="phone"  placeholder=""></td>
                </tr>
            </table>

            <div class="tou">
            	<div class="tou1" colspan="2"><input class="agree" id="agree1" type="checkbox" name="agree"  value="Y,N">
					<label for="agree1">이용약관 동의 (필수)</label>
				</div>
				<div class="tou2" colspan="2"><input class="agree" id="agree2" type="checkbox" name="agree2"  value="Y,N">
					<label for="agree2">개인정보 수집 및 동의 (필수)</label></div>

				<div class="tou3" colspan="2"><input class="agree" id="agree3" type="checkbox" name="agree3"  value="Y,N">
					<label for="agree3">만 14세 이상 (필수)</label>
				</div>
			</div>

            <div class="joinSubmit">
                <input class="submit" type="button" id="submitBtn" value="회원가입" onclick="inputCheck();">
              
                <input class="submit" type="reset" value="돌아가기">
            </div>
        </form>
        
        	<script type="text/javascript">
        		function inputCheck(){
        			if(customerEnrollFrm.name.value == ""){
        				alert("이름을 입력해주세요");
        				return;
        			}
        			if(customerEnrollFrm.userId.value== ""){
        				alert("아이디를 입력해주세요");
        				return;
        			}
        			if(customerEnrollFrm.pass.value== ""){
        				alert("비밀번호를 입력해주세요");
        				return;
        			}
        			if(customerEnrollFrm.pass.value != customerEnrollFrm.repwd.value){
        				alert("비밀번호가 일치하지 않습니다");
        				customerEnrollFrm.repwd.focus();
        				return;
        			}
					if(customerEnrollFrm.phone.value == ""){
						alert("전화번호를 입력해주세요");
						return;
        			}
        			if(!customerEnrollFrm.agree.checked || !customerEnrollFrm.agree2.checked || !customerEnrollFrm.agree3.checked){
        				alert("약관동의를 해주세요");
        				return;
        			}
        			
        			customerEnrollFrm.submit()
        			alert("회원가입이 완료되었습니다😀")
        			
        			
        		}
        		
        	

        		$(function(){
        			const $idInput = $("#userId");
        			       $idInput.keyup(function(){
        			    	   if($idInput.val().length >= 5) {
        			    	   $.ajax({
        			    		   url:"idCheck.me",
        			    		   data:{checkId:$idInput.val()},
        			    		   success:function(result){
        			    			   if(result == "NNN"){
        			    				   $(".idCheck").show();
        			    				   $(".idCheck").css("color", "red").text("중복된 아이디 입니다");
        			    				   $("#customerEnrollFrm #submitBtn").attr("disabled", true);
        			    			   } else{
        			    				   $(".idCheck").show();
        			    				   $(".idCheck").css("color", "green").text("사용가능한 아이디 입니다");
        			    				   $("#customerEnrollFrm #submitBtn").attr("disabled", false);
        			    			   }
        			    		   }, error:function(){
        			    			   console.log("오류가 발생했습니다");
        			    		   }
        			    	   });
        			    	 } else{
        			    		 $(".idCheck").hide();
        		    				$("#customerEnrollFrm #submitBtn").attr("disabled", true);
        		    			}    			
        			    	   
        			       })                          
        		})
        	</script> 
        
    </div>
    
	<!-- footer -->
	<jsp:include page="../common/footer.jsp"/>
	
</body>

</html>