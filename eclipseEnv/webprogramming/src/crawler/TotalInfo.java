package crawler;

public class TotalInfo{
	String info_num;
	String info_name;
	String info_date;
	String link_addr;
	
	public TotalInfo(String info_num, String info_name, String info_date, String link_addr) {
		this.info_num = info_num;
		this.info_name = info_name;
		this.info_date = info_date;
		this.link_addr = link_addr;
	}
	
	public String getNum() {
		return info_num;
	}
	public String getName() {
		return info_name;
	}
	public String getDate() {
		return info_date;
	}
	public String getAddr() {
		return link_addr;
	}

}