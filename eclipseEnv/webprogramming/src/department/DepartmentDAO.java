package department;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import department.DepartmentDTO;
import utils.DatabaseConnection;

public class DepartmentDAO {
	private Connection conn;
	public DepartmentDAO() {
		conn=DatabaseConnection.getDatabaseConnection();
	}
	
	public ArrayList<DepartmentDTO> getDepartmentData() {
		String sql="SELECT * FROM DEPARTMENT";
		ArrayList<DepartmentDTO> departmentInfo=new ArrayList<>();
		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			ResultSet res=psmt.executeQuery();
			while(res.next()) {
				int deptNum=res.getInt(1);
				String deptName=res.getString(2);
				String deptUrl=res.getString(3);
				departmentInfo.add(new DepartmentDTO(deptNum,deptName,deptUrl));
			}
			return departmentInfo;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}		
	}
}
