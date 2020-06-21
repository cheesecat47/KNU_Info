	// 경북대학교 공지사항 "http://knu.ac.kr/wbbs/wbbs/bbs/btin/list.action?bbs_cde=1&menu_idx=67"
    	// 컴퓨터학부 공지사항 "http://computer.knu.ac.kr/06_sub/02_sub.html?"
    	// 독어독문학과 공지사항 "http://german.knu.ac.kr/HOME/german/sub.htm?nav_code=ger1465864578"
    	// 문헌정보학과 공지사항 "http://lis.knu.ac.kr/HOME/lis/sub.htm?nav_code=lis1465563308"
    	// 수학과 공지사항 "http://math.knu.ac.kr/HOME/math/sub.htm?nav_code=mat1465820713"
    	// 경영학부 공지사항 "http://biz.knu.ac.kr/HOME/kbiz/sub.htm?nav_code=kbi1534123689"
    	// 기계공학부 공지사항 "http://me.knu.ac.kr/HOME/me/sub.htm?nav_code=me1465822154"
    	// 전자공학부 공지사항 "http://see.knu.ac.kr/content/board/news.html"
    	// 원예과학과 공지사항 "http://horti.knu.ac.kr/HOME/horti/sub.htm?nav_code=hor1465816287"
    	// 음악학과 공지사항 "http://music.knu.ac.kr/HOME/music/sub.htm?nav_code=mus1465820342"
    	// 영어교육과 공지사항 "http://enged.knu.ac.kr/HOME/enged/sub.htm?nav_code=eng1465563428"
    	// 아동학부 공지사항 "http://child.knu.ac.kr/HOME/knuchild/sub.htm?nav_code=knu1468564874"

TotalInfo class
	String getNum() //공지번호 반환
	String getName() //글 제목 반환
	String getDate() //게시 날짜 반환
	String getAddr() //본문 링크 반환

ParseResult class
	public ArrayList<TotalInfo> result //전체 공지 목록 보유

공지사항 목록파서
	static ParseResult ListCrawling(String URL);
		위의 내용 중 하나를 매개변수로 주면  ParseResult클래스로 반환

		반환 받은 ParseResult 객채.result로 공지 목록 접근

공지사항 내용 파서
	static String ParseContents(String URL);
		공지 게시물 주소를 매개변수로 주면 내용부분 html을 String으로 반환