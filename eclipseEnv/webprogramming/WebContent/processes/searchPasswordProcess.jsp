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
		String stdNum = request.getParameter("stdNum");
		int STDNUM = 0;
		String id = request.getParameter("id");
		String Password = null;
		
		try {
			STDNUM = Integer.parseInt(stdNum);
			Password = UserDAO.findUserId(STDNUM);
			
			Password = UserDAO.findUserPw(STDNUM, id);
			if(Password == null) {
				response.sendRedirect("../views/searchPassword.jsp?searchRedirect=-1");
			}
			else {
				response.sendRedirect("../views/searchPassword.jsp?searchRedirect=" + Password);
			}
		} catch (NumberFormatException e) {
			response.sendRedirect("../views/searchPassword.jsp?searchRedirect=-1");
		} catch (Exception e) {
			response.sendRedirect("../views/searchPassword.jsp?searchRedirect=-1");
		}
	%>
	
	
	<%@ include file="../include/footer.jsp"%>
</body>
</html>