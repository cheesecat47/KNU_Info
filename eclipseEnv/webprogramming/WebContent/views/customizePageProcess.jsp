<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<%
	request.setCharacterEncoding("UTF-8");

	String filePath = request.getServletContext().getRealPath("assets/customImages");
	//...webprogramming\eclipseEnv\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\webprogramming\assets\customImages
	// 이클립스 톰캣은 소스를 바로 사용하지 않고 다른데서 시뮬레이션? 하는듯.
	out.println(filePath);
	
	int maxSize = 2 * 1024 * 1024; // 2MB
	String encType = "utf-8";
	MultipartRequest multi = new MultipartRequest(request, filePath, maxSize, encType, new DefaultFileRenamePolicy());

	Enumeration params = multi.getParameterNames();
	
	String keywords = "";
	
	while (params.hasMoreElements()) {
		String name = (String) params.nextElement();
		String value = multi.getParameter(name);
		out.println(name + " : " + value + "<br>");
		if (name.equals("keyword")) {
			keywords = value;
			out.println("keyword : " + keywords + "<br>");
			session.setAttribute(name, value);
		}
	}
	
	Enumeration files = multi.getFileNames();
	
	while (files.hasMoreElements()) {
		String name = (String) files.nextElement();
		String filename = multi.getFilesystemName(name);
		String original = multi.getOriginalFileName(name);
		String type = multi.getContentType(name);
		File file = multi.getFile(name);
		
		out.println(name+"<br>");
		out.println(filename+"<br>");
		out.println(original+"<br>");
		out.println(type+"<br>");
		if (file != null) {
			// 파일 있으면
			out.println(file.length()+"<br>");
			session.setAttribute("BgImg", filename);
			out.println("session.BgImg = " + (String) session.getAttribute("BgImg"));
		}
	}
	
	//response.sendRedirect("mypage.jsp");
%>