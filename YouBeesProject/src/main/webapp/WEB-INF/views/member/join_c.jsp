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
    

    <title>Document</title>

<body>
<!-- header -->
	<jsp:include page="../common/header.jsp"/>
	
    <div class="container">
        <form action="CustomerInsert.me" method="post" name="customerEnrollFrm" id="customerEnrollFrm">
            <table id="loginTable">
                <div class="title">일반 회원가입</div>
                <tr>
                    <td class="closer">*이름</td>
                    <td><input name="name" type="text" required placeholder=""></td>
                </tr>
                <tr>
                    <td class="closer">*아이디</td>
                    <td><input id="userId" name="userId" type="text" required placeholder=""><br>
                    <span class="idCheck"></span>
                    </td>
                </tr>
                <tr>
                    <td class="closer">*비밀번호</td>
                    <td><input type="password" name="pass" required placeholder=""></td></br>
                </tr>
                <tr>
                    <td class="closer">*비밀번호 확인</td>
                    <td><input type="password" name="repwd" required placeholder=""></td>
                </tr>
                <tr>
                    <td class="closer">*전화번호</td>
                    <td><input name="phone" required placeholder=""></td>
                </tr>
            </table>

            <div class="tou">
                <div class="tou1" colspan="2"><input class="agree" type="checkbox" name="agree" required
                        value="Y,N">이용약관 동의 (필수)
                </div>
                <div class="tou2" colspan="2"><input class="agree" type="checkbox" name="agree" required
                        value="Y,N">개인정보
                    수집 및 동의
                    (필수)</div>

                <div class="tou3" colspan="2"><input class="agree" type="checkbox" name="agree" required value="Y,N">만
                    14세 이상 (필수)
                </div>
            </div>

            <div class="joinSubmit">
                <input class="submit" type="button" value="회원가입" onClick="inputCheck();" id="submitBtn">
                <input class="submit" type="reset" value="돌아가기">
            </div>
        </form>
        	<script type="text/javascript">
        		function inputCheck(){
        			if(customerEnrollFrm.pass.value != customerEnrollFrm.repwd.value){
        				alert("비밀번호가 일치하지 않습니다");
        				customerEnrollFrm.repwd.focus();
        				return;
        			}
        				customerEnrollFrm.submit();
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