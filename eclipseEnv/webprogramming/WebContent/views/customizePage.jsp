<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<% session.setAttribute("Name","홍길동"); %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/head.jsp"%>
    <style>
    	.customizeBox {
    		border: 1px solid grey;
    		padding: 10px;
    	}
    </style>
</head>
<body>
	<%@ include file="../include/navbar.jsp"%>
	
	<div class="container customizeBox">
		<form method="post" class="form-horizontal" enctype="multipart/form-data" action="../views/customizePageProcess.jsp">
			<div class="row form-group">
				<p class="text-center col-md-2">키워드 : </p>
				<input type="text" class="form-control col-md-9" name="keywords" placeholder="ex) 대회, 졸업, 설명회 - 콤마(,)로 구분해서 최대 10개까지 입력 가능합니다."/>
			</div>
			<div class="row form-group">
				<p class="text-center col-md-2">배경 사진 : </p>
				<input type="file" class="form-control col-md-9" name="bgimage" />
			</div>
			<div class="row form-group">
				<input type="submit" class="btn btn-secondary" value="저장"/>
			</div>
		</form>
	</div>
	
	<%@ include file="../include/footer.jsp"%>
	
	<% 
		String name;
		String value;
		
		Enumeration en = session.getAttributeNames();
		
		while (en.hasMoreElements()) {
			name = en.nextElement().toString();
			value = session.getAttribute(name).toString();
			
			out.println(name + " " + value);
			if (name.equals("BgImg")) {
	%>
	<script>	
		function setImageUrl(imgName) {
			var host = document.location.host;
			//console.log('host ' + host);
			baseURL = host+"/webprogramming/assets/customImages/"
			return baseURL + imgName
		}
		
		function changeBgImg(imgName) {
			//console.log("changeBgImg "+imgName);
			var imgURL = setImageUrl(imgName);
			console.log("imgURL "+ imgURL);
			document.body.style.backgroundImage=imgURL;
		}
		changeBgImg("<%=value%>");
	</script>
	<%
			}
		}
	%>
</body>
</html>