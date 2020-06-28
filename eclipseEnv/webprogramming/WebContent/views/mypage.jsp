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
	<%@ include file="../include/isLogIn.jsp"%>
	<Button type="button" class="btn btn-outline-dark" id="settings" onclick="location.href='customizePage.jsp'">설정</Button>
	<div class="container backgroundColor" id="Notice">
  		<h2>학과 공지 사항</h2>       
  		<table class="table" id="noticeList">
		    <thead>
		      <tr>
		        <th>번호</th>
		        <th>제목</th>
		        <th>등록일</th>
		      </tr>
		    </thead>
		    <tbody>
		    <% 
		    String URL=(String)session.getAttribute("UserDeptURL");
		    ParseResult noticeList=ParseFunc.ListCrawling(URL);
		    for(TotalInfo notice : noticeList.getResult()){
		    %>
		    <tr>
		    	<td><%=notice.getNum()%></td>
		    	<td><a target="_blank" href=<%=notice.getAddr()%> ><%=notice.getName() %></a></td>
		    	<td><%=notice.getDate() %></td>
		    </tr>
		    <%} %>	
		    </tbody>
		  </table>
	</div>
	
	<p><br></p>
	
	<div class="container backgroundColor" id="Notice">
  		<h2>본관 공지 사항 - 학사 공지</h2>       
  		<table class="table" id="schoolNoticeList">
		    <thead>
		      <tr>
		        <th>번호</th>
		        <th>제목</th>
		        <th>등록일</th>
		      </tr>
		    </thead>
		    <tbody>
		    <% 
		    noticeList=SchoolInfoParse.ListCrawling();
		    for(TotalInfo notice : noticeList.getResult()){
		    %>
		    <tr>
		    	<td><%=notice.getNum()%></td>
		    	<td><a target="_blank" href=<%=notice.getAddr()%> ><%=notice.getName() %></a></td>
		    	<td><%=notice.getDate() %></td>
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
	var table = $('#noticeList').DataTable();
	var table2 = $('#schoolNoticeList').DataTable();
	
// to Process keywords	
<% 
	Enumeration<String> en_kwd = session.getAttributeNames();
		
	while (en_kwd.hasMoreElements()) {
		String name = en_kwd.nextElement().toString();
		String value = session.getAttribute(name).toString();
			
		//out.println(name + " " + value);
		if (name.equals("UserKeywords")) {
			// 만약 이미 설정된 키워드가 있으면
%>
	/* https://datatables.net/reference/api/draw() */
	table.search("<%=value%>").draw();
	table2.search("<%=value%>").draw();
<%
		}
	}
%>
});

</script>

</html>