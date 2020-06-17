<%@page import="jdk.jshell.spi.ExecutionControl.ExecutionControlException"%>
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
		String Id = null;
		
		try {
			STDNUM = Integer.parseInt(stdNum);
			Id = UserDAO.findUserId(STDNUM);
			
			if(Id == null) {
				response.sendRedirect("./searchId.jsp?searchRedirect=-1");
			}
			else {
				response.sendRedirect("./searchId.jsp?searchRedirect=" + Id);
			}
		} catch (NumberFormatException e) {
			response.sendRedirect("./searchId.jsp?searchRedirect=-1");
		} catch (Exception e) {
			response.sendRedirect("./searchId.jsp?searchRedirect=-1");
		}
		
		
	%>
	
	
	<%@ include file="../include/footer.jsp"%>
</body>
</html>