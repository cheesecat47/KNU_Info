<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<head>
    <%@ include file="../include/head.jsp"%>
    <link rel="stylesheet" href="../assets/css/mypagesettings.css"/>
</head>
<body>
	<%@ include file="../include/navbar.jsp"%>
	<Button type="button" class="btn btn-outline-dark" id="settings" onclick="location.href='customizePage.jsp'">설정</Button>
	<div class="container backgroundColor" id="Notice">
  		<h2>공지 사항</h2>       
  		<table class="table">
		    <thead>
		      <tr>
		        <th>번호</th>
		        <th>제목</th>
		        <th>등록일</th>
		      	<th>알림</th>
		      </tr>
		    </thead>
		    <tbody>
		      <tr>
		        <td>1</td>
		        <td>고급웹프로그래밍 수행계획서 제출</td>
		        <td>2020.06.02</td>
		        <td><div class="alarm"><input type="radio"><label>&#9734;</label></input></div></td>
		      </tr>
		      <tr>
		        <td>2</td>
		        <td>고급웹프로그래밍 과제 제출</td>
		        <td>2020.06.01</td>
		        <td><div class="alarm"><input type="radio"><label>&#9734;</label></input></div></td>
		      </tr>
		      <tr>
		        <td>3</td>
		        <td>여름방학 계정학기 수강 변경</td>
		        <td>2020.05.31</td>
		        <td><div class="alarm"><input type="radio"><label>&#9734;</label></input></div></td>
		      </tr>
		    </tbody>
		  </table>
	</div>
	<%@ include file="../include/footer.jsp"%>
	
	<!-- to Process Background Image -->
	<%@ include file="../include/bgImgProcess.jsp"%>
</body>
<script>
$(document).ready(function(){
	/*
	$(".alarm > label").mouseenter(
		function(){
			this.innerHTML="★";
		}
	)
	$(".alarm > label").mouseleave(
		function(){
			this.innerHTML="☆";
		}
	)
	*/
	$(".alarm > label").click(
		function(){
			if(this.innerHTML=="☆")
				this.innerHTML="★";
			else if(this.innerHTML=="★")
				this.innerHTML="☆";
		}
	)
});

</script>
</html>