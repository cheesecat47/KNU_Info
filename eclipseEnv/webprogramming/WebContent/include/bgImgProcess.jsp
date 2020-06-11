<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>

<% 
	// 세션은 일정 시간 지나면 없어진다
	// db에 유저가 저장한 배경이미지가 있는지 확인하고, 없으면 세션을 확인
	
	Enumeration<String> en_img = session.getAttributeNames();
	
	while (en_img.hasMoreElements()) {
		String name = en_img.nextElement().toString();
		String value = session.getAttribute(name).toString();
		
		//out.println(name + " " + value);
		if (name.equals("BgImg")) {
%>
<script>	
	function setImageUrl(imgName) {
		var host = document.location.host;
		//console.log('host ' + host);
		baseURL = "http://"+host+"/webprogramming/assets/customImages/"
		return baseURL + imgName
	}
	
	function changeBgImg(imgName) {
		//console.log("changeBgImg "+imgName);
		var imgURL = setImageUrl(imgName);
		//console.log("imgURL "+ imgURL);
		document.body.style.backgroundRepeat = "repeat-y";
		document.body.style.backgroundImage="url('"+imgURL+"')";
		document.body.style.backgroundSize="100%";
	}
	changeBgImg("<%=value%>");
</script>
<%
		}
	}
%>