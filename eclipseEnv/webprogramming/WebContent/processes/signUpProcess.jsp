<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%@ page import="dept.DeptDAO" %>
<%@ page import="dept.DeptDTO" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/head.jsp"%>
</head>
<body>
	<%@ include file="../include/navbar.jsp"%>
	
	<%		
		request.setCharacterEncoding("utf-8");
		
		int stdNum = Integer.parseInt(request.getParameter("stdNum"));
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String passwordCheck = request.getParameter("passwordCheck");
		String major = request.getParameter("major");
		int majorNum = 0;
		
		ArrayList<DeptDTO> deptInfo = DeptDAO.getDepartmentInfo();
		
		for(int i=0; i<deptInfo.size(); i++) {
			if(major.equals(deptInfo.get(i).getDeptName())) {
				majorNum = deptInfo.get(i).getDeptNum();
				
			}
		}
		
		boolean status = UserDAO.signUp(stdNum, name, id, password, majorNum);
	%>
	
	<script type="text/javascript">
		alert("회원가입이 완료되었습니다.\n로그인 페이지로 돌아갑니다.");		
		location.href = "../views/login.jsp";
	</script>

	<%@ include file="../include/footer.jsp"%>
</body>
</html>