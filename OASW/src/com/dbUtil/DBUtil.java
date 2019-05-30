package com.dbUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DBUtil {
	public static Connection openConnection() {
		Connection con = null;
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String userName = "PROJECT";
		String password = "PROJECT";
		

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

		} catch (ClassNotFoundException ex) {
			System.out.println(ex);
		}
 
		try {
			con = DriverManager.getConnection(url, userName, password);
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		return con;
	}

	public static void closeResultSet(ResultSet rs) {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
		} catch (SQLException ex) {
			System.out.println(ex);
		}
	}

	public static void closeStatement(Statement stmt) {
		try {
			if (stmt != null) {
				stmt.close();
				stmt = null;
			}
		} catch (SQLException ex) {
			System.out.println(ex);
		}
	}

	public static void closeConnection(Connection con) {

		try {
			if (con != null) {
				con.close();
				con = null;
			}
		} catch (SQLException ex) {
			System.out.println(ex);
		}

	}
}
