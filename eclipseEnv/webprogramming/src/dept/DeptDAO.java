package dept;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dept.DeptDTO;
import utils.DatabaseConnection;

public class DeptDAO {

	public static ArrayList<DeptDTO> getDepartmentInfo() {
		String sql="SELECT * FROM DEPARTMENT";
		ArrayList<DeptDTO> departmentInfo=new ArrayList<>();
		DatabaseConnection dbAPI=new DatabaseConnection();
		ResultSet res=null;
		try {
			PreparedStatement psmt = dbAPI.getPreparedStatement(sql);
			res=psmt.executeQuery();
			while(res.next()) {
				int deptNum=res.getInt(1);
				String deptName=res.getString(2);
				String deptUrl=res.getString(3);
				departmentInfo.add(new DeptDTO(deptNum,deptName,deptUrl));
			}
		} catch (SQLException e) {
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
		return departmentInfo;
	}
}
