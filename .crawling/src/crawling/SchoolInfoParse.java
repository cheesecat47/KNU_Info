package crawling;

import java.io.IOException;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class SchoolInfoParse {
	static ParseResult ListCrawling() {
			
			ParseResult parseResult = new ParseResult();
			
			String URL = "http://knu.ac.kr/wbbs/wbbs/bbs/btin/stdList.action?menu_idx=42";
			
			try {
			            
	            Connection conn = Jsoup.connect(URL);
	 
	         
	            Document html = conn.get(); 

	            Elements trs = html.select("tr");
	            
	            for(Element e1 : trs) {
	            	if(e1.child(0).text().equals("¹øÈ£")) {
	            		continue;
	            	}
	            	String a = e1.child(0).text();
            		String b = e1.child(1).text();
            		
            		//String c = URL + e1.child(1).select("a").first().attr("href").split("'")[1];
            		String c = "http://knu.ac.kr/wbbs/wbbs/bbs/btin/stdViewBtin.action?btin.doc_no=" + e1.child(1).select("a").first().attr("href").split("'")[1] + "&btin.appl_no=000000&btin.page=1&btin.search_type=&btin.search_text=&popupDeco=&btin.note_div=row&menu_idx=42";
            		String d = e1.child(4).text();
            		parseResult.result.add(new TotalInfo(a, b, d, c));
	            	
	            }
			            
			}catch (IOException e) {
	            e.printStackTrace();
	        }
			//parseResult.sort();
			return parseResult;
	}
}
