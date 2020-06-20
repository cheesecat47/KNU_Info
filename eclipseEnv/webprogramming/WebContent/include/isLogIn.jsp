<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String isLogined = (String)session.getAttribute("UserName");
	if (isLogined == null) {
		response.sendRedirect("login.jsp");	
	}
%>