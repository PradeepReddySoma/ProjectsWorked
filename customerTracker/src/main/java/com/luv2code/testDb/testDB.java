package com.luv2code.testDb;

import java.sql.Connection;
import java.sql.DriverManager;

public class testDB {
	
	public static void main(String[] args) {
		String url="jdbc:mysql://localhost:3306/customermanager?useSSL=false";
		String user="springstudent";
		String pass="springstudent";
		String driver="com.mysql.cj.jdbc.Driver";
		
		try {
			Class.forName(driver);
			
			System.out.println("Establishing Connection :"+url);
			Connection conn =DriverManager.getConnection(url, user, pass);
			conn.close();
			System.out.println("SUCCESS !!!");
			System.out.println("You are Welcome");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
