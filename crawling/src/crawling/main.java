package crawling;

 
public class main {
	
	//사용 방법 예시 파일입니다.
	
	
    public static void main(String args[]){
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
    	
        ParseResult parse = ParseFunc.ListCrawling("http://computer.knu.ac.kr/06_sub/02_sub.html?");

        
        for(int i = 0 ; i < parse.result.size(); i++) {
        	System.out.print(parse.result.get(i).getNum() + " ");
        	System.out.print(parse.result.get(i).getName() + " ");
        	System.out.print(parse.result.get(i).getDate() + " ");
        	System.out.print(parse.result.get(i).getAddr());
        	System.out.println();
        }
        
        System.out.println(ParseFunc.ParseContents("http://see.knu.ac.kr/content/board/news.html?pg=vv&fidx=97388&gtid=bodo&opt=&sword=&page=1"));
        
    }
}
