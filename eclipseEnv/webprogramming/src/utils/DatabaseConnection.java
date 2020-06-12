package utils;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class DatabaseConnection {

	public static Connection getDatabaseConnection() {
	    Connection conn=null;
	    try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/MySQLDB");
			conn = ds.getConnection();
			System.out.println("연결o");
			return conn;
	    }catch(NamingException | SQLException e){
	    	System.out.println("연결x");
	    	e.printStackTrace();
	    	return null;
	    }

	}
}
