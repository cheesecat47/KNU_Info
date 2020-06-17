<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body onload="signUpValue()">

	
	<!-- String signUpRedirect = "";
	
	if(idDupCheck == 1) {
		signUpRedirect = "./signUp.jsp?idDup=1";
	}
	else if(idDupCheck == -1) {
		signUpRedirect = "./signUp.jsp?idDup=-1";
	}
	
	response.sendRedirect(signUpRedirect); -->
	
	<script type="text/javascript">
		function signUpValue() {
			document.getElementById("userId").value = opener.document.signUpForm.id.value;
		}
		
		function idDupCheck() {
			var id = document.getElementById("userId").value;
			
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
			
			else
			{
				<%
					String id =	request.getParameter("id");
					int idDupCheck = 0;
				
					UserDTO userInfo = null;

					userInfo = UserDAO.getUserInfo(id);
					if(userInfo == null) { %>
						alert("사용가능한 아이디 입니다");
						opener.document.signUpForm.id.value = document.getElementById("userId").value;
						opener.document.signUpForm.idDup.value = "ididchecked";
				<% }
				else { %>
						alert("이미 사용중인 아이디 입니다. 다시 입력해주세요");
					
				<% } %>
			}
				
		}
	</script>
</body>
</html>