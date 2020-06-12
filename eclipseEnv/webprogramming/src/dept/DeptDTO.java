package dept;

public class DeptDTO {
	private int deptNum;
	private String deptName;
	private String deptUrl;
	
	public DeptDTO(int deptNum, String deptName, String deptUrl) {
		this.deptNum = deptNum;
		this.deptName = deptName;
		this.deptUrl = deptUrl;
	}
	
	public int getDeptNum() {
		return deptNum;
	}
	public void setDeptNum(int deptNum) {
		this.deptNum = deptNum;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getDeptUrl() {
		return deptUrl;
	}
	public void setDeptUrl(String deptUrl) {
		this.deptUrl = deptUrl;
	}
	

}
