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
		String UId = request.getParameter("id");
		String UPwd = request.getParameter("password");
		
		// 로그인 성공 시 logCheck = 1, 실패 시 logCheck = -1
		int logCheck = 0;
		
		UserDTO userInfo = null;

		userInfo = UserDAO.getUserInfo(UId);		//서버에 있는 user정보를 가져옴
		if(userInfo == null) {
			logCheck = -1;	
		}
		else
		{
			if(UPwd.equals(userInfo.getUserPw())) {	//서버에 있는 password값 가져와서 비교
				logCheck = 1;
			}
			else {
				logCheck = -1;
			}
		}
		
		int UNum = 0;
		try {
			// 세션 설정을 위한 변수
			UNum = userInfo.getUserNum();
			String UName = userInfo.getUserName();
			String UBgImg = userInfo.getUserBgImg();
			String UKeywords = userInfo.getUserKeywords();
			String UDept = userInfo.getUserDept();
			String UDeptURL = userInfo.getUserDeptURL();
			
			// 세션 생성
			session.setAttribute("UserNum", UNum);
			session.setAttribute("UserName", UName);
			session.setAttribute("UserId", UId);
			session.setAttribute("UserPw", UPwd);
			session.setAttribute("UserBgImg", UBgImg);
			session.setAttribute("UserKeywords", UKeywords);
			session.setAttribute("UserDept", UDept);
			session.setAttribute("UserDeptURL", UDeptURL);
		} catch(NullPointerException e) {
			logCheck = -1;
		}
	
		if(logCheck == 1) {
			response.sendRedirect("./mypage.jsp");
		}
		else if(logCheck == -1) {
			// 로그인 실패하면 세션에 저장해둔 정보 지우고 새로 로그인하도록
			session.invalidate();
			response.sendRedirect("./login.jsp?loginRedirect=-1");
		}
		
	%>
	
	
	<%@ include file="../include/footer.jsp"%>
</body>
</html>