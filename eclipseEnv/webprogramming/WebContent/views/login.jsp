<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link href="../assets/css/login.css" rel="stylesheet" type="text/css">
    <%@ include file="../include/head.jsp"%>
</head>
<body>
	<%@ include file="../include/navbar.jsp"%>
	<div class="wrapper fadeInDown">
		<div id="formContent">
			<form name="loginForm" action="./loginProcess.jsp" method="post" onsubmit="return loginCheck()">
				<input type="text" name="id" class="fadeIn second" maxlength="15" required placeholder="아이디">
				<input type="password" name="password" class="fadeIn third" maxlength="15" required placeholder="비밀번호">
				<hr>
				<input type="submit" class="fadeIn fourth" value="로그인">
			</form>
			<div id="formFooter">
				<a class="underlineHover" href="searchId.jsp" style="margin-right:20px;">아이디 찾기</a>
				<a class="underlineHover" href="searchPassword.jsp" style="margin-right:20px;">비밀번호 찾기</a>
				<a class="underlineHover" href="signUp.jsp">회원가입</a>	
			</div>
		</div>
	</div>
	
	<%-- 아이디와 비밀번호 입력 유무 체크 --%>
	<script type="text/javascript">
		function loginCheck() {
			var form = document.loginForm;
		
			if(form.id.value == "") {
				alert("아이디를 입력하세요");
				form.id.focus();
				return false;
			}
		
			if(form.password.value == "") {
				alert("패스워드를 입력하세요");
				form.password.focus();
				return false;
			}
		}
	</script>
	
	<%-- submit을 통해 ./loginProcess.jsp 실행 한 뒤, 로그인 실패 시 --%>
	<%
		String loginFail = request.getParameter("loginRedirect");
		
		if(loginFail != null && loginFail.equals("-1")) {
	%>
	
	<script type="text/javascript">
		alert("아이디 혹은 패스워드가 틀렸습니다");
	</script>
	
	<%
		}
	%>
	<%@ include file="../include/footer.jsp"%>
</body>
</html>