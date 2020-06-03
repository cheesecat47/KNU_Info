package crawling;

import java.io.IOException;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class ParseFunc {
static ParseResult ListCrawling(String URL, int pdate) {
		
		ParseResult parseResult = new ParseResult();
		
		try {
            
            Connection conn = Jsoup.connect(URL);
 
         
            Document html = conn.get(); 
            
            Elements trs = html.select("tr");
            for(Element e1 : trs) {
            	if(e1.child(0).text().equals("¹øÈ£")) {
            		continue;
            	}else {
            		parseResult.addNum(e1.child(0).text());
            		parseResult.addName(e1.child(1).text());
            		if(e1.child(1).select("a").first().attr("href").charAt(0) =='?') {
            			parseResult.addAddr(URL + e1.child(1).select("a").first().attr("href"));
            			//System.out.println(URL + e1.child(1).select("a").first().attr("href"));
            		}else {
            			parseResult.addAddr(URL.split(".kr/")[0] + ".kr" + e1.child(1).select("a").first().attr("href"));
            			//System.out.println(URL.split(".kr/")[0] + ".kr" + e1.child(1).select("a").first().attr("href"));
            		}
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
