<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="department.*" %>
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
	DepartmentDAO departmentDAO=new DepartmentDAO();
	ArrayList<DepartmentDTO> departmentInfos=departmentDAO.getDepartmentData();
	for(DepartmentDTO department : departmentInfos){
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