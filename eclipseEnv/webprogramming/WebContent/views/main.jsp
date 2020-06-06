<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/head.jsp"%>
    <link rel="stylesheet" href="../assets/css/main.css"/>
</head>
<body>
	<%@ include file="../include/navbar.jsp"%>
	
	<div class="img_wrapper">
		<div id="img1">
			<h1 class="text-center">KNU Info</h1>
			<img id="main_img1" src="../assets/images/main_img1.jpg" alt="main_img1"/>
		</div>
	</div>
	
	<div class="img_wrapper">
		<div id="img3">
			<h2>학교 홈페이지에 공지글이 너무 많은가요?</h2>
			<img id="main_img3" src="../assets/images/main_img3.png" alt="main_img3"/>
		</div>
	</div>
	
	<div class="img_wrapper">
		<div id="bottom_text">
			<h1>여러분에게 필요한 공지만 저희가 찾아드릴게요!</h1>
			<input type="button" class="btn btn-secondary" value="Log In" onclick="location.href='#'"/>
		</div>
	</div>
	
	<%@ include file="../include/footer.jsp"%>
	<script src="../assets/js/main.js"></script>
</body>
</html>