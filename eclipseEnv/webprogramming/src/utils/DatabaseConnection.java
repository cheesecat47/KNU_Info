package utils;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {
	static String url = "jdbc:mysql://";
	static String ip="";
	static String port="";
	static String userID="";
	static String userPW="";
	static String dbName="";

	public static Connection getDatabaseConnection() {
		Connection conn = null;
		// Driver Loading
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String db = url + ip + ":" + port + "/" + dbName+ "?serverTimezone=UTC";
			conn = DriverManager.getConnection(db, userID, userPW);
			System.out.println("Connectection Succeded");
			return conn;
		}
		
		catch (ClassNotFoundException | SQLException e) {
			System.out.println("Connectection Failed");
			e.printStackTrace();
			return null;
		} 
	}
	public static String getIP() {
		return ip;
	}
	public static String getPort() {
		return port;
	}

}
