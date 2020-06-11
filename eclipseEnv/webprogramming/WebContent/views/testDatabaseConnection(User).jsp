<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.*" %>
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
			<th>Id</th>
			<th>Pw</th>
			<th>Background Image</th>
			<th>Keyword_list</th>
			
		</thead>
		<tbody>
<%
	UserDAO userDAO=new UserDAO();
	UserDTO userInfo=userDAO.getUserData("user01");
		%>
		<tr>
			<td><%=userInfo.getUserNum()%></td>
			<td><%=userInfo.getUserName()%></td>
			<td><%=userInfo.getUserId()%></td>
			<td><%=userInfo.getUserPw()%></td>
			<td><%=userInfo.getUserBgImg()%></td>
			<td><%=String.join(",", userInfo.getUserKeywords())%></td>
		</tr>
		<%
%>
		</tbody>
	</table>
</body>
</html>