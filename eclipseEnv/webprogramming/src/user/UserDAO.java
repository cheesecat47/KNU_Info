package user;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import utils.DatabaseConnection;
import user.UserDTO;
public class UserDAO {
	
	public static UserDTO getUserInfo(String id) {
		String sql="SELECT U.User_num, U.Name, U.Id, U.Pw, U.BgImg, U.Keyword_list, D.Name FROM USER U,DEPARTMENT D WHERE U.Dept_num=D.Dept_num and U.Id=?";
		UserDTO userInfo = null;
		DatabaseConnection dbAPI=new DatabaseConnection();
		ResultSet res=null;
		try {
			PreparedStatement psmt = dbAPI.getPreparedStatement(sql);
			psmt.setString(1, id);
			res=psmt.executeQuery();
			if(res.next()) {
				int userNum=res.getInt(1);
				String userName=res.getString(2);
				String userId=res.getString(3);
				String userPw=res.getString(4);
				String userBgImg=res.getString(5);
				String userKeywords=res.getString(6);
				String userDept=res.getString(7);
				userInfo=new UserDTO(userNum,userName,userId,userPw,userBgImg,userKeywords,userDept);
			}			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(res!=null)
					res.close();
				dbAPI.closeAll();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}

		return userInfo;
	}
	
	public static boolean signUp(String userName,String userId,String userPw,int userMajor) {
		String sql="INSERT INTO USER(userName, userId, userPw, userMajor) VALUES(?,?,?,?)";
		DatabaseConnection dbAPI=new DatabaseConnection();
		int result=0;
		try {
			PreparedStatement psmt=dbAPI.getPreparedStatement(sql);
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
		}finally {
			dbAPI.closeAll();
		}
	}
	
	public static boolean login(String userId,String userPw) {
		UserDTO userInfo=getUserInfo(userId);
		if(userInfo.getUserPw()==userPw)
			return true;
		else
			return false;
	}
	
	public static boolean setBackgroundImage(int accountNum, String imgPath) {
		String sql="UPDATE USER SET BgImg=? WHERE User_num= ?";
		DatabaseConnection dbAPI=new DatabaseConnection();
		int result=0;
		try {
			PreparedStatement psmt=dbAPI.getPreparedStatement(sql);
			psmt.setString(1,imgPath);
			psmt.setInt(2,accountNum);
		
			result=psmt.executeUpdate();
			if(result!=0)
				return true;
			else
				return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally {
			dbAPI.closeAll();
		}
	}
	public static boolean setKeyWords(int accountNum, String keywordList) {
		String sql="UPDATE USER SET Keyword_list=? WHERE User_num= ?";
		DatabaseConnection dbAPI=new DatabaseConnection();
		int result=0;
		try {
			PreparedStatement psmt=dbAPI.getPreparedStatement(sql);
			psmt.setString(1,keywordList);
			psmt.setInt(2,accountNum);
			result=psmt.executeUpdate();
			if(result!=0)
				return true;
			else
				return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}finally {
			dbAPI.closeAll();
		}
	}
	
	public static ArrayList<String> parseKeyWords(String keywordString){
		ArrayList<String> keywordList=new ArrayList<>();
		String[] temp=keywordString.split(",");
		for(String s: temp)
			keywordList.add(s);
		return keywordList;
		
	}
	
	public static ArrayList<String> getIdList() {
		String sql="SELECT U.Id FROM USER U";
		ArrayList<String> idList = new ArrayList<>();
		DatabaseConnection dbAPI=new DatabaseConnection();
		ResultSet res=null;
		try {
			PreparedStatement psmt = dbAPI.getPreparedStatement(sql);
			res=psmt.executeQuery();
			while(res.next()) {
				String id=res.getString(1);
				idList.add(id);
			}			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(res!=null)
					res.close();
				dbAPI.closeAll();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return idList;
	}
}
