package crawling;

 
public class main {
	
	//��� ��� ���� �����Դϴ�.
	
	
    public static void main(String args[]){
    	// ��ϴ��б� �������� "http://knu.ac.kr/wbbs/wbbs/bbs/btin/list.action?bbs_cde=1&menu_idx=67", 4
    	// ��ǻ���к� �������� "http://computer.knu.ac.kr/06_sub/02_sub.html", 0, 1, 3
    	// ������а� �������� "http://german.knu.ac.kr/HOME/german/sub.htm?nav_code=ger1465864578", 4
    	// ���������а� �������� "http://lis.knu.ac.kr/HOME/lis/sub.htm?nav_code=lis1465563308", 4
    	// ���а� �������� "http://math.knu.ac.kr/HOME/math/sub.htm?nav_code=mat1465820713", 4
    	// �濵�к� �������� "http://biz.knu.ac.kr/HOME/kbiz/sub.htm?nav_code=kbi1534123689", 4
    	// �����к� �������� "http://me.knu.ac.kr/HOME/me/sub.htm?nav_code=me1465822154", 4
    	// ���ڰ��к� �������� "http://see.knu.ac.kr/content/board/news.html", 3
    	// �������а� �������� "http://horti.knu.ac.kr/HOME/horti/sub.htm?nav_code=hor1465816287", 4
    	// �����а� �������� "http://music.knu.ac.kr/HOME/music/sub.htm?nav_code=mus1465820342", 4
    	// ������� �������� "http://enged.knu.ac.kr/HOME/enged/sub.htm?nav_code=eng1465563428", 4
    	// �Ƶ��к� �������� "http://child.knu.ac.kr/HOME/knuchild/sub.htm?nav_code=knu1468564874", 4
    	
        ParseResult parse = ParseFunc.ListCrawling("http://child.knu.ac.kr/HOME/knuchild/sub.htm?nav_code=knu1468564874", 4);
        System.out.println(parse.getNum());
        System.out.println(parse.getName());
        System.out.println(parse.getDate());
        System.out.println(parse.getAddr());
        
        System.out.println(ParseFunc.ParseContents("http://see.knu.ac.kr/content/board/news.html?pg=vv&fidx=97388&gtid=bodo&opt=&sword=&page=1"));
        
    }
}
