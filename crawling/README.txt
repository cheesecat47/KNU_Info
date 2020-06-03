// 경북대학교 공지사항 "http://knu.ac.kr/wbbs/wbbs/bbs/btin/list.action?bbs_cde=1&menu_idx=67", 4
    	// 컴퓨터학부 공지사항 "http://computer.knu.ac.kr/06_sub/02_sub.html", 0, 1, 3
    	// 독어독문학과 공지사항 "http://german.knu.ac.kr/HOME/german/sub.htm?nav_code=ger1465864578", 4
    	// 문헌정보학과 공지사항 "http://lis.knu.ac.kr/HOME/lis/sub.htm?nav_code=lis1465563308", 4
    	// 수학과 공지사항 "http://math.knu.ac.kr/HOME/math/sub.htm?nav_code=mat1465820713", 4
    	// 경영학부 공지사항 "http://biz.knu.ac.kr/HOME/kbiz/sub.htm?nav_code=kbi1534123689", 4
    	// 기계공학부 공지사항 "http://me.knu.ac.kr/HOME/me/sub.htm?nav_code=me1465822154", 4
    	// 전자공학부 공지사항 "http://see.knu.ac.kr/content/board/news.html", 3
    	// 원예과학과 공지사항 "http://horti.knu.ac.kr/HOME/horti/sub.htm?nav_code=hor1465816287", 4
    	// 음악학과 공지사항 "http://music.knu.ac.kr/HOME/music/sub.htm?nav_code=mus1465820342", 4
    	// 영어교육과 공지사항 "http://enged.knu.ac.kr/HOME/enged/sub.htm?nav_code=eng1465563428", 4
    	// 아동학부 공지사항 "http://child.knu.ac.kr/HOME/knuchild/sub.htm?nav_code=knu1468564874", 4
    
ParseResult class (ParseResult.java 파일에 존재)
	ArrayList<String> getNum(); //공지번호 반환
	ArrayList<String> getName(); //글 제목 반환
	ArrayList<String> getDate() //게시 날짜 반환

공지사항 목록파서 (ParseFunc.java 파일의 ParseFunc. 클래스 내부 static 함수)
	static ParseResult ListCrawling(String URL, int pdate);
		위의 내용 중 하나를 매개변수로 주면  ParseResult클래스로 반환

공지사항 내용 파서(ParseFunc.java 파일의 ParseFunc. 클래스 내부 static 함수)
	static String ParseContents(String URL);
		공지 게시물 주소를 매개변수로 주면 내용부분 html을 String으로 반환

실제 사용 예시는 main.java 참고