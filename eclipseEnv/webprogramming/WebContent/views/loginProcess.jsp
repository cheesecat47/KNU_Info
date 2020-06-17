<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
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
		
		UserDTO userInfo = null;

		userInfo = UserDAO.getUserInfo(id);		//서버에 있는 user정보를 가져옴
		if(userInfo == null) {
			logCheck = -1;
		}
		else
		{
			if(password.equals(userInfo.getUserPw()))	//서버에 있는 password값 가져와서 비교
			{
				logCheck = 1;
			}
			else
				logCheck = -1;
		}
				
		// 로그인 성공 시 ./myPage.jsp로 redirect, 실패 시 ./login.jsp로 redirect
		String loginRedirect = "";
		
		if(logCheck == 1) {
			session.setAttribute("Name", id);	// 세션 생성
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