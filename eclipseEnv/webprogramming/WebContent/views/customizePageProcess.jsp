<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="user.*" %>
<%@ page import="java.util.ArrayList" %>

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
			session.setAttribute("UserKeywords", value);
			out.println("session keyword : " + session.getAttribute("UserKeywords") + "<br>");
		}
	}
	
	Enumeration files = multi.getFileNames();
	String imgName = "";
	
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
			imgName = filename;
			session.setAttribute("UserBgImg", filename);
			out.println("session.UserBgImg = " + (String) session.getAttribute("UserBgImg"));
		} else {
			if ((String) session.getAttribute("UserBgImg") != ""){
				session.removeAttribute("UserBgImg");
			}
		}
	}
	
	
	// update db
	UserDTO userInfo=UserDAO.getUserInfo((String) session.getAttribute("UserId"));
	//UserDTO userInfo=UserDAO.getUserInfo("user01");
	
	int userNum = userInfo.getUserNum();
	String userName = userInfo.getUserName();
	String userId = userInfo.getUserId();
	String userPw = userInfo.getUserPw();
	String userBgImg = userInfo.getUserBgImg();
	String userKeywords = userInfo.getUserKeywords();
	
	System.out.println("유저 이름:" + userName);
	System.out.println("유저 아이디: "+ userId);
	System.out.println("유저 비밀번호:" + userPw);
	System.out.println("유저 배경화면 소스: " + userBgImg);
	System.out.println("유저 키워드 목록: "+ userKeywords);
	
	if (imgName != ""){
		// 이미지 존재하면
		//System.out.println("\n*******************배경화면을 sample.png로 등록한 다음*******************\n");
		UserDAO.setBackgroundImage(userNum, imgName);  //1번 user_num을 가지고 있는 사람의 배경화면 정보를 변경
		
		userInfo=UserDAO.getUserInfo("user01");
		System.out.println("유저 배경화면 소스: " + userInfo.getUserBgImg());
	} else {
		UserDAO.setBackgroundImage(userNum, null);  //1번 user_num을 가지고 있는 사람의 배경화면 정보를 변경
		
		userInfo=UserDAO.getUserInfo("user01");
		System.out.println("유저 배경화면 소스: " + userInfo.getUserBgImg());
	}
	
	String sessionKeywords = (String) session.getAttribute("UserKeywords");
	System.out.println("sessionKeywords " + sessionKeywords);
	if (sessionKeywords != ""){
		//System.out.println("\n*******************키워드를  채용,인턴으로 등록한 다음*******************\n");
		UserDAO.setKeyWords(userNum, keywords);  //1번 user_num을 가지고 있는 사람의 키워드 정보를 변경
		
		userInfo=UserDAO.getUserInfo("user01");
		System.out.println("유저 키워드 목록: "+ userInfo.getUserKeywords());
	} else {
		UserDAO.setKeyWords(userNum, null);  //1번 user_num을 가지고 있는 사람의 키워드 정보를 변경
		
		userInfo=UserDAO.getUserInfo("user01");
		System.out.println("유저 키워드 목록: "+ userInfo.getUserKeywords());
	}
	
	userName = userInfo.getUserName();
	userId = userInfo.getUserId();
	userPw = userInfo.getUserPw();
	userBgImg = userInfo.getUserBgImg();
	userKeywords = userInfo.getUserKeywords();
	
	System.out.println("유저 이름:" + userName);
	System.out.println("유저 아이디: "+ userId);
	System.out.println("유저 비밀번호:" + userPw);
	System.out.println("유저 배경화면 소스: " + userBgImg);
	System.out.println("유저 키워드 목록: "+ userKeywords);
	System.out.println();
	
	//response.sendRedirect("mypage.jsp");
%>