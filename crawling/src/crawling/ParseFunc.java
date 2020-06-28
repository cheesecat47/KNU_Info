package crawling;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.internal.StringUtil;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class ParseFunc {
static ParseResult ListCrawling(String URL) {
		
		ParseResult parseResult = new ParseResult();
		String mainURL = URL.split(".kr/")[0] + ".kr/";
		int type = 0;
		int pdate = 4;
		
		if(URL.contains("computer.knu.ac.kr") || URL.contains("see.knu.ac.kr"))
			pdate = 3;
		
		
		try {
            
            Connection conn = Jsoup.connect(URL);
 
         
            Document html = conn.get(); 
            int size = 3;

            if(html.getElementsByClass("paging").get(0).select("a").get(0).attr("href").charAt(0) == '/') {
            	type = 1;
            }else {
            	type = 2;
            }
            
            for(int i = 1 ; i < size + 1 ; i++) {
	            Elements trs = html.select("tr");
	            for(Element e1 : trs) {
	            	if(e1.child(0).text().equals("번호")) {
	            		continue;
	            	}else if(e1.child(0).text().equals("공지") && i !=1){
	            		continue;
	            	}else {
	            		String a = e1.child(0).text();
	            		String b = e1.child(1).text();
	            		String c;
	            		if(e1.child(1).select("a").first().attr("href").charAt(0) =='?') {
	            			c = URL + e1.child(1).select("a").first().attr("href");
	            			//System.out.println(URL + e1.child(1).select("a").first().attr("href"));
	            		}else {
	            			c = URL.split(".kr/")[0] + ".kr" + e1.child(1).select("a").first().attr("href");
	            			//System.out.println(URL.split(".kr/")[0] + ".kr" + e1.child(1).select("a").first().attr("href"));
	            		}
	            		String d = e1.child(pdate).text();
	            		parseResult.result.add(new TotalInfo(a, b, d, c));
	            	}
	            }
	            String tmpURL;
	            if(type == 1) {
	            	tmpURL = mainURL + html.getElementsByClass("paging").get(0).select("a").get(0).attr("href");
	            }else {
	            	if(URL.contains("computer."))
	            		tmpURL = URL + "?&page=" + (i+1);
	            	else
	            		tmpURL = URL + "&btin.page=" + (i+1);
	            }
	            
	            conn = Jsoup.connect(tmpURL);
	            
	            html = conn.get(); 
            }
            
        } catch (IOException e) {
            e.printStackTrace();
        }
		//parseResult.sort();
		return parseResult;
	}
	static String ParseContents(String URL) {
		String result = null;
		try {
         
            Connection conn = Jsoup.connect(URL);
 
          
            Document html = conn.get();
           
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
}
