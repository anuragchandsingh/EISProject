package com.eis.Connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	public static Connection getConnection() throws Exception
	{
		String driver ="oracle.jdbc.driver.OracleDriver";
		String url ="jdbc:oracle:thin:@localhost:1521:xe";
		String userName ="SYSTEM";
		String password ="Manager";
		
		Class.forName(driver);
        return DriverManager.getConnection(url,userName,password);
	}

}
