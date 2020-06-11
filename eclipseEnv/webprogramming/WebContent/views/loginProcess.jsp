<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/head.jsp"%>
</head>
<body>
	<%@ include file="../include/navbar.jsp"%>
	
	<%
		String id =	request.getParameter("id");
		String password = request.getParameter("password");
		
		// 로그인 성공 시 logCheck = 1, 실패 시 logCheck = -1
		int logCheck = 0;
		/* 
			DB에 저장된 아이디, 패스워드 확인
			...
			...
		*/
		
		
		// 로그인 성공 시 ./myPage.jsp로 redirect, 실패 시 ./login.jsp로 redirect
		String loginRedirect = "";
		
		if(logCheck == 1) {
			session.setAttribute("sessionId", id);	// 세션 생성
			loginRedirect = "./myPage.jsp";
		}
		else if(logCheck == -1) {
			loginRedirect = "./login.jsp?loginRedirect=-1";
		}
		
		response.sendRedirect(loginRedirect);		
	%>
	
	
	<%@ include file="../include/footer.jsp"%>
</body>
</html>