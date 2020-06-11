<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/head.jsp"%>
</head>
<body>
	<%@ include file="../include/navbar.jsp"%>
	
	<%
		
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String passwordCheck = request.getParameter("passwordCheck");
		String major = request.getParameter("major");
		
		
		/*Enumeration paramNames = request.getParameterNames();
		
		while(paramNames.hasMoreElements()) {
			String name = (String)paramNames.nextElement();
			out.print(name + " : ");
			String paramValue = request.getParameter(name);
			out.print(paramValue + "<br>");
			
		}*/
	%>



	<script type="text/javascript">
		alert("회원가입이 완료되었습니다.\n로그인 페이지로 돌아갑니다.");		
		location.href = "login.jsp";
	</script>
	
	
	
	
	
	
	<%@ include file="../include/footer.jsp"%>
</body>
</html>