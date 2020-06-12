package utils;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DatabaseConnection {
	private Connection conn;
	private ArrayList<Statement> statementList;	
	public DatabaseConnection() {
		 try{
				Context init = new InitialContext();
				DataSource ds = (DataSource) init.lookup("java:comp/env/MySQLDB");
				conn = ds.getConnection();
				System.out.println("연결o");
		    }catch(NamingException | SQLException e){
		    	System.out.println("연결x");
		    	e.printStackTrace();
		    }
		 statementList=new ArrayList<>();
	}
	
	public PreparedStatement getPreparedStatement(String sql) {
		PreparedStatement psmt=null;
		try {
			psmt=conn.prepareStatement(sql);
			statementList.add(psmt);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return psmt;
	}
	
	public Statement getStatement() {
		Statement st=null;
		try {
			st=conn.createStatement();
			statementList.add(st);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return st;
	}
	public void closeAll() {
		try {
			for(Statement st:statementList) {
				if(st!=null)
					st.close();
			}
			conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
}
