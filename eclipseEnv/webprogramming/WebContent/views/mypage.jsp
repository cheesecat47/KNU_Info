<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="crawler.*" %>
<!DOCTYPE html>
<html>
<head>
<head>
    <%@ include file="../include/head.jsp"%>
    <link rel="stylesheet" href="../assets/css/mypagesettings.css"/>
    <link rel="stylesheet" href="../assets/css/datatables.min.css"/>
</head>
<body>
	<%@ include file="../include/navbar.jsp"%>
	<Button type="button" class="btn btn-outline-dark" id="settings" onclick="location.href='customizePage.jsp'">설정</Button>
	<div class="container backgroundColor" id="Notice">
  		<h2>공지 사항</h2>       
  		<table class="table" id="noticeList">
		    <thead>
		      <tr>
		        <th>번호</th>
		        <th>제목</th>
		        <th>등록일</th>
		      	<th>알림</th>
		      </tr>
		    </thead>
		    <tbody>
		    <% String URL="http://computer.knu.ac.kr/06_sub/02_sub.html?";
		    ParseResult noticeList=ParseFunc.ListCrawling(URL);
		    for(TotalInfo notice : noticeList.getResult()){
		    %>
		    <tr>
		    	<td><%=notice.getNum()%></td>
		    	<td><a target="_blank" href=<%=notice.getAddr()%> ><%=notice.getName() %></a></td>
		    	<td><%=notice.getDate() %></td>
		    	<td><div class="alarm"><input type="radio"><label>&#9734;</label></input></div></td>
		    </tr>
		    <%} %>	
		    </tbody>
		  </table>
	</div>
	<%@ include file="../include/footer.jsp"%>
	
	<!-- to Process Background Image -->
	<%@ include file="../include/bgImgProcess.jsp"%>
</body>
<script src="../assets/js/datatables.min.js" type="text/javascript"></script>
<script>
$(document).ready(function(){
	$('#noticeList').DataTable();
});

</script>

</html>