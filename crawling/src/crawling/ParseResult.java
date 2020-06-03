package crawling;

import java.util.ArrayList;

public class ParseResult {

	private ArrayList<String> info_num;
	private ArrayList<String> info_name;
	private ArrayList<String> info_date;
	private ArrayList<String> link_addr;
	
	public ParseResult() {
		// TODO Auto-generated constructor stub
		this.info_num = new ArrayList<String>();
		this.info_name = new ArrayList<String>();
		this.info_date = new ArrayList<String>();
		this.link_addr = new ArrayList<String>();
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
	public void addAddr(String a) {
		link_addr.add(a);
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
	public ArrayList<String> getAddr() {
		return link_addr;
	}
	
}
