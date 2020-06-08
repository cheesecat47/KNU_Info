<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link href="../assets/css/signUp.css" rel="stylesheet" type="text/css">
    <%@ include file="../include/head.jsp"%>
</head>
<body>
	<%@ include file="../include/navbar.jsp"%>
	<div class="wrapper fadeInDown">
		<div id="formContent">
			<form name="signUpForm" action="./signUpComplete.jsp" method="post" onsubmit="return signUpCheck()">
				<br>
				<h4>Welcome to join us</h4>
				<br>
				<input type="text" name="name" class="fadeIn first" maxlength="15" required placeholder="이름">
				<div>
					<span><input type="text" name="id" id="id" class="fadeIn second" onkeydown="inputId()" maxlength="15" required placeholder="아이디"></span>
					<span><input type="button" value="중복확인" class="fadeIn second" onclick="checkIdDup()"></span>
					<span><input type="hidden" name="idDup" id="idDup" value="idUnchecked"></span>	<!-- id 중복 확인이 되었는지 체크하기 위한 용도 -->
				</div>
				<input type="password" name="password" class="fadeIn third" maxlength="15" required placeholder="비밀번호">
				<input type="password" name="passwordCheck" class="fadeIn fourth" maxlength="15" required placeholder="비밀번호 확인">
				<input type="text" list="majorlist" name="major" class="fadeIn fourth" required placeholder="학과를 입력하세요">
				<datalist id="majorlist">
					<%@ include file="../include/majority.jsp" %>
				</datalist>
				
				<script type="text/javascript">
					<%-- 학과명 입력 제대로 했는지 검사 --%>
					var inputs = document.querySelectorAll("input[list]");
			
					for(var i = 0; i < inputs.length; i++) {
						inputs[i].addEventListener("change", function() {
							var optionFound = false;
							var datalist = this.list;
		    		
				 			for(var j = 0; j < datalist.options.length; j++) {
				 				if (this.value == datalist.options[j].value) {
		 							optionFound = true;
		            				break;
			        			}
			    			}
		    		
			 				if(optionFound) {
		    	  				this.setCustomValidity("");
		    				}
		 					else {
		      					this.setCustomValidity("학과명을 정확히 입력해주세요");
		    				}
		  				});
					}
				</script>
				
				<hr>
				<input type="submit" class="fadeIn fourth" value="회원가입">
			</form>
		</div>
	</div>
	<script type="text/javascript">
		<%-- 회원가입 버튼 클릭 시 확인 --%>
		function signUpCheck() {
			var form = document.signUpForm;
			
			if(form.name.value == "") {
				alert("이름을 입력하세요");
				return false;
			}
			
			if(form.idDup.value == "idUnchecked") {
				alert("아이디 중복체크를 해주세요");
				return false;
			}
			
			if(form.password.value == "") {
				alert("패스워드를 입력하세요");
				return false;
			}
			else if(form.password.value.length < 4) {
				alert("패스워드는 4자리 이상 입력해주세요");
				return false;
			}
			
			if(form.password.value != form.passwordCheck.value) {
				alert("패스워드를 동일하게 입력해주세요");
				return false;
			}
			
			
			//form.submit();
			return true;
		}
		
		<%-- 아이디 중복확인 버튼 클릭 시 --%>
		function checkIdDup() {
			var id = document.getElementById("id").value;
			var idDup = document.getElementById("idDup").value;
			
			
			if(!id) {
				alert("아이디를 입력해 주세요");
				return false;
			}
			else if(id.length < 4) {
				alert("아이디는 4자리 이상 입력해주세요");
				return false;
			}
			<%--
			else if() {
				alert("한글 및 특수문자는 사용할 수 없습니다");
				return false;
			}
			--%>
			
			
			<%-- 서버에 있는 아이디 값과 비교
			else {
				var param = "id=" + id;
				
				서버 관련 코드
				...
				...
				...
				...
			}
			--%>
			
			
			document.signUpForm.idDup.value = "idchecked";
			
			return true;
		}
		
		<%-- 아이디 중복체크 후, 다시 아이디를 수정할 시 실행 --%>
		function inputId() {
			document.signUpForm.idDup.value = "idUnchecked";
			return true;
		}
	</script>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>