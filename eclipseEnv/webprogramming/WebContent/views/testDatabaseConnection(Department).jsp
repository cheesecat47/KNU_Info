<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="dept.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<table>
		<thead>
			<th>Num</th>
			<th>Name</th>
			<th>Url</th>
		</thead>
		<tbody>
<%
	ArrayList<DeptDTO> departmentInfos=DeptDAO.getDepartmentInfo();
	for(DeptDTO department : departmentInfos){
		%>
		<tr>
			<td><%=department.getDeptNum()%></td>
			<td><%=department.getDeptName()%></td>
			<td><%=department.getDeptUrl()%></td>
		</tr>
		<%
	}
%>
		</tbody>
	</table>
</body>
</html>