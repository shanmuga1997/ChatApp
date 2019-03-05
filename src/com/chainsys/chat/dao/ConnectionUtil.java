package com.chainsys.chat.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConnectionUtil {

	public static Connection getConnection() {
		Connection connection=null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:XE";
			connection = DriverManager.getConnection(url, "hr", "hr");
					
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	
	public static void close(Connection connection,PreparedStatement preparestatement,ResultSet resultset) throws SQLException
	{
                 if(connection!=null)
                 {
                	 connection.close();
                 }
                 if(preparestatement!=null)
                 {
                	 preparestatement.close();
                 }
                 if(resultset!=null)
                 {
                	 resultset.close();
                 }

	}
    
}
