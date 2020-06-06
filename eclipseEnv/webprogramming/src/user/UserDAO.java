package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

import utils.DatabaseConnection;
import user.UserDTO;
public class UserDAO {
	private Connection conn;
	public UserDAO() {
		conn=DatabaseConnection.getDatabaseConnection();
	}
	
	public UserDTO getUserData(String id) {
		String sql="SELECT U.User_num, U.Name, U.Id, U.Pw, U.BgImg, U.Keyword_list, D.Name FROM USER U,DEPARTMENT D WHERE U.Dept_num=D.Dept_num and U.Id=?";
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			ResultSet res=psmt.executeQuery();
			if(res.next()) {
				int userNum=res.getInt(1);
				String userName=res.getString(2);
				String userId=res.getString(3);
				String userPw=res.getString(4);
				String userBgImg=res.getString(5);
				String keyword_list=res.getString(6);
				ArrayList<String> userKeywords=new ArrayList<>();
				String userDept=res.getString(7);
				if(keyword_list==null)
					userKeywords=new ArrayList<>();
				else {
					String[] temp=keyword_list.split(",");
					for(String s: temp)
						userKeywords.add(s);
				}
				return new UserDTO(userNum,userName,userId,userPw,userBgImg,userKeywords,userDept);
			}
			else
				return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}		
	}
	
	public boolean signUp(String userName,String userId,String userPw,int userMajor) {
		String sql="INSERT INTO USER(userName, userId, userPw, userMajor) VALUES(?,?,?,?)";
		int result=0;
		try {
			PreparedStatement psmt=conn.prepareStatement(sql);
			psmt.setString(1,userName);
			psmt.setString(2,userId);
			psmt.setString(3,userPw);
			psmt.setInt(4,userMajor);
			result=psmt.executeUpdate();
			if(result!=0)
				return true;
			else
				return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean login(String userId,String userPw) {
		UserDTO userInfo=getUserData(userId);
		if(userInfo.getUserPw()==userPw)
			return true;
		else
			return false;
	}
}
