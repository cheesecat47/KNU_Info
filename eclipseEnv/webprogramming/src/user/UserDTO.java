package user;
import java.util.ArrayList;

public class UserDTO {
	private int userNum;
	private String userName;
	private String userId;
	private String userPw;
	private String userBgImg;
	private ArrayList<String> userKeywords;
	private String userDept;
	
	public UserDTO(int userNum, String userName, String userId, String userPw, String userBgImg,
			ArrayList<String> userKeywords,String userDept) {
		this.userNum = userNum;
		this.userName = userName;
		this.userId = userId;
		this.userPw = userPw;
		this.userBgImg = userBgImg;
		this.userKeywords = userKeywords;
		this.userDept = userDept;
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

	public ArrayList<String> getUserKeywords() {
		return userKeywords;
	}

	public void setUserKeywords(ArrayList<String> userKeywords) {
		this.userKeywords = userKeywords;
	}

	public String getUserDept() {
		return userDept;
	}

	public void setUserDept(String userDept) {
		this.userDept = userDept;
	}
		
}
