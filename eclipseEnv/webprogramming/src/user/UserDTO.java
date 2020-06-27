package user;
import java.util.ArrayList;

public class UserDTO {
	private int userNum;
	private String userName;
	private String userId;
	private String userPw;
	private String userBgImg;
	private String userKeywords;
	private String userDept;
	private String userDeptURL;
	
	public UserDTO(int userNum, String userName, String userId, String userPw, String userBgImg,
			String userKeywords,String userDept,String userDeptURL) {
		this.userNum = userNum;
		this.userName = userName;
		this.userId = userId;
		this.userPw = userPw;
		this.userBgImg = userBgImg;
		this.userKeywords = userKeywords;
		this.userDept = userDept;
		this.userDeptURL = userDeptURL;
	}

	public int getUserNum() {
		return userNum;
	}

	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserBgImg() {
		return userBgImg;
	}

	public void setUserBgImg(String userBgImg) {
		this.userBgImg = userBgImg;
	}

	public String getUserKeywords() {
		return userKeywords;
	}

	public void setUserKeywords(String userKeywords) {
		this.userKeywords = userKeywords;
	}

	public String getUserDept() {
		return userDept;
	}

	public void setUserDept(String userDept) {
		this.userDept = userDept;
	}

	public String getUserDeptURL() {
		return userDeptURL;
	}

	public void setUserDeptURL(String userDeptURL) {
		this.userDeptURL = userDeptURL;
	}
		
}
