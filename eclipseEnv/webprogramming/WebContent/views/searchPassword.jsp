<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link href="../assets/css/password.css" rel="stylesheet" type="text/css">
    <%@ include file="../include/head.jsp"%>
</head>
<body>
	<%@ include file="../include/navbar.jsp"%>
	<div class="wrapper fadeInDown">
		<div id="formContent">
			<form name="searchPasswordForm" action="../processes/searchPasswordProcess.jsp" method="post" onsubmit="return searchPassword()">
				<input type="text" name="stdNum" class="fadeIn second" maxlength="10" required placeholder="학번">
				<input type="text" name="id" id="id" class="fadeIn third" maxlength="15" required placeholder="아이디">
				<hr>
				<input type="submit" class="fadeIn fourth" value="비밀번호 찾기">
			</form>
			<div id="formFooter">
				<a class="underlineHover" href="searchId.jsp" style="margin-right:20px;">아이디 찾기</a>
				<a class="underlineHover" href="searchPassword.jsp" style="margin-right:20px;">비밀번호 찾기</a>
				<a class="underlineHover" href="signUp.jsp">회원가입</a>	
			</div>
		</div>
	</div>
	
	<%-- 학번,아이디 입력 유무 체크 --%>
	<script type="text/javascript">
		function searchPassword() {
			var form = document.searchPasswordForm;
		
			if(form.stdNum.value == "") {
				alert("학번을 입력하세요");
				form.stdNum.focus();
				return false;
			}
			else if(isNaN(form.stdNum.value)) {
				alert("학번은 숫자로 입력하세요");
				form.stdNum.focus();
				return false;
			}
			
			if(form.id.value == "") {
				alert("아이디를 입력하세요");
				form.id.focus();
				return false;
			}
		}
	</script>
	
	<%-- submit을 통해 ./searchPasswordProcess.jsp 실행 한 뒤, 다시 돌아옴 --%>
	<%
		String searchValue = request.getParameter("searchRedirect");
		
		if(searchValue != null && searchValue.equals("-1")) {
	%>
		<script type="text/javascript">
			alert("학번 혹은 아이디가 존재하지 않습니다");
		</script>
	<%
		}
		else if(searchValue != null) {
			String password = searchValue;
			out.println("<script>alert('비밀번호는 "+ password + "입니다'); location.href='login.jsp';</script>");
		}
	%>
	
	<%@ include file="../include/footer.jsp"%>
</body>
</html>