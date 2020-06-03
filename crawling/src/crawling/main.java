package crawling;
import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.nodes.Element;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.jsoup.Connection;

class ParseResult{

	private ArrayList<String> info_num;
	private ArrayList<String> info_name;
	private ArrayList<String> info_date;
	
	public ParseResult() {
		// TODO Auto-generated constructor stub
		this.info_num = new ArrayList<String>();
		this.info_name = new ArrayList<String>();
		this.info_date = new ArrayList<String>();
	}
	
	public void addNum(String a) {
		info_num.add(a);
	}
	public void addName(String a) {
		info_name.add(a);
	}
	public void addDate(String a) {
		info_date.add(a);
	}
	public ArrayList<String> getNum() {
		return info_num;
	}
	public ArrayList<String> getName() {
		return info_name;
	}
	public ArrayList<String> getDate() {
		return info_date;
	}
}
 
public class main {
	
	
	static ParseResult ListCrawling(String URL, int pdate) {
		
		ParseResult parseResult = new ParseResult();
		
		try {
            // 2. Connection 생성
            Connection conn = Jsoup.connect(URL);
 
            // 3. HTML 파싱.
            Document html = conn.get(); // conn.post();
            
            Elements trs = html.select("tr");
            for(Element e1 : trs) {
            	if(e1.child(0).text().equals("번호")) {
            		continue;
            	}else {
            		parseResult.addNum(e1.child(0).text());
            		parseResult.addName(e1.child(1).text());
            		parseResult.addDate(e1.child(pdate).text());
            	}
            }
            
        } catch (IOException e) {
            e.printStackTrace();
        }
		return parseResult;
	}
	static String ParseContents(String URL) {
		String result = null;
		try {
            // 2. Connection 생성
            Connection conn = Jsoup.connect(URL);
 
            // 3. HTML 파싱.
            Document html = conn.get(); // conn.post();
            
            Elements contents = html.getElementsByClass("content-view");
            if(contents.isEmpty()) {
            	contents = html.getElementsByClass("board_cont");
            	if(contents.isEmpty()) {
            		contents = html.getElementsByClass("cont");
                	if(contents.isEmpty()) {
                		contents = html.getElementsByClass("contentview");
                    	if(contents.isEmpty()) {
                    		
                    	}else {
                    		//System.out.println(contents);
            	            result = contents.toString();
                    	}
                	}else {
                		//System.out.println(contents);
        	            result = contents.toString();
                	}
            	}else {
            		//System.out.println(contents);
    	            result = contents.toString();
            	}
            }else {
	           // System.out.println(contents);
	            result = contents.toString();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
		return result;
	}
	
    public static void main(String args[]){
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
    	
        ParseResult parse = ListCrawling("http://child.knu.ac.kr/HOME/knuchild/sub.htm?nav_code=knu1468564874", 4);
        System.out.println(parse.getNum());
        System.out.println(parse.getName());
        System.out.println(parse.getDate());
        
        
        System.out.println(ParseContents("http://see.knu.ac.kr/content/board/news.html?pg=vv&fidx=97388&gtid=bodo&opt=&sword=&page=1"));
        
    }
}
