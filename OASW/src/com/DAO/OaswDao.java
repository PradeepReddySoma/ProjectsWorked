package com.DAO;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.dbUtil.DBUtil;
import com.forms.AssignTaskForm;
import com.forms.EmployeeMaster;
import com.forms.LoginDetails;
import com.forms.UserMngmentForm;

public class OaswDao {
	public static void getEmpInfo(LoginDetails form, HttpSession session)
			throws Exception {
		String userType = form.getRole();
		String userName = form.getUserName();
		String password = form.getPassword();
		String empId = "";
		String username = "";
		// String empDept= "";
		String designation = "";
		String dept = "";
		String empname = "";
		Connection con = DBUtil.openConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = null;
		String com=(String) session.getAttribute("companyname");

		String sql = "SELECT * FROM EMPLOYEES WHERE USER_TYPE='" + userType + "' AND USERNAME='" + userName + "' AND PASS_WORD='" + password + "' AND UNIT = '"+com+"'";
		rs = stmt.executeQuery(sql);
        System.out.println("sql is "+sql);
		while (rs.next()) {
			empId = rs.getString("EMP_ID");
			username = rs.getString("USERNAME");
			// empDept = rs.getString("DEPARTMENT");
			dept = rs.getString("USER_TYPE");
			designation = rs.getString("DESIGNATION");
			empname = rs.getString("EMP_NAME");
			session.setAttribute("userName", username);
			session.setAttribute("password",password );

			session.setAttribute("roletype", userType);
		}
		DBUtil.closeResultSet(rs);
		DBUtil.closeStatement(stmt);
		DBUtil.closeConnection(con);
		ArrayList al = new ArrayList();
		al.add(empId);
		al.add(username);
		// al.add(empDept);
		al.add(designation);
		al.add(dept);
		al.add(empname);
		session.setAttribute("empDetails", al);
	}

	public static int authenticate(LoginDetails loginDetails,
			HttpServletRequest req) throws Exception {
		HttpSession session = req.getSession();
		Connection con = DBUtil.openConnection();
		Statement stmt = con.createStatement();
		String role = loginDetails.getRole();
		String unit = loginDetails.getRole1();
		session.setAttribute("role", role);
		ResultSet rs = null;
		String empName = "";
		String sql = "SELECT * FROM USER_MANAGEMENT WHERE UNIT = '"+unit+"' AND USERNAME='" + loginDetails.getUserName() + "' AND PASS_WORD='" + loginDetails.getPassword() + "' AND USER_TYPE='" + role + "'";
		rs = stmt.executeQuery(sql);
		int status = 0;
		if (rs.next()) {
			empName = rs.getString("EMP_NAME");
			status = 1;
			
		}
		session.setAttribute("user", loginDetails.getUserName());
		DBUtil.closeResultSet(rs);
		DBUtil.closeStatement(stmt);
		DBUtil.closeConnection(con);
		
		ArrayList al = new ArrayList();
		al.add(empName);
		session.setAttribute("empName", al);
	
		session.setAttribute("unit", unit);
		
		return status;
	}

	public static int addEmployees(EmployeeMaster empMasterForm)
			throws SQLException {
		String sql = "INSERT INTO EMPLOYEE_MASTER (EMP_ID,EMP_NAME,DESIGNATION,DEPARTMENT,ACCOUNT_FOR,UNIT,STATUS) VALUES(?,?,?,?,?,?,?)";
		Connection con = DBUtil.openConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, empMasterForm.getEmpId());
		pstmt.setString(2, empMasterForm.getEmpName());
		pstmt.setString(3, empMasterForm.getDesg());
		pstmt.setString(4, empMasterForm.getDept());
		pstmt.setString(5, empMasterForm.getAccount());
		pstmt.setString(6, empMasterForm.getUnit());
        pstmt.setString(7, "0");
		int status = pstmt.executeUpdate();
		try {
			pstmt.close();
		} catch (SQLException ex) {
			System.out.println(ex);
		}
		pstmt.close();
		DBUtil.closeConnection(con);
		return status;
	}

	public static int checkEmployee(String empId) throws Exception {
		int status = 0;
		Connection con = DBUtil.openConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = null;


		String sql = "SELECT * FROM EMPLOYEE_MASTER WHERE EMP_ID='" + empId + "'";
		rs = stmt.executeQuery(sql);
		if (rs.next()) {
			status = 1;
		}
		DBUtil.closeResultSet(rs);
		DBUtil.closeStatement(stmt);
		DBUtil.closeConnection(con);
		return status;
	}

	public static void setEmpIdList(HttpSession session) {
		ArrayList EmpIdList = new ArrayList();
		String com=(String) session.getAttribute("companyname");

		Connection con = DBUtil.openConnection();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM EMPLOYEE_MASTER WHERE UNIT = '"+com+"' ";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String empId = rs.getString("EMP_ID");
				EmpIdList.add(empId);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// System.out.println("ARRAY VehicleNoList" + EmpIdList);
		session.setAttribute("EmpIDList", EmpIdList);
		DBUtil.closeResultSet(rs);
		DBUtil.closeStatement(stmt);
		DBUtil.closeConnection(con);
	}

	public static Vector getEmpIdList(HttpSession session) {
		Vector EmpIdList = new Vector();
		try {
			System.out.println("..............In getEmpIdList(HttpSession session) : OasDao");
			ArrayList empList = (ArrayList) session.getAttribute("EmpIDList");
			 System.out.println("----------------OasDao---------------"+empList);
			String[] empIds = new String[empList.size()];
			for (int i = 0; i < empList.size(); i++) {
				String empId = (String) empList.get(i);
				/* String getval[] = new String[]{empId}; */
				empIds[i] = empId;
				EmpIdList.add(empIds[i]);
			}
			System.out.println("..............end of try : OasDao");
		} catch (Exception e) {
			System.out.println("e.getMessage()----inside BinList vector-"+ e.getMessage());
		}
		 System.out.println("...................EmpIdList "+EmpIdList);
		return EmpIdList;
	}

	
	public static void setEmpIdList1(HttpSession session) {
		ArrayList EmpIdList = new ArrayList();
		String com=(String) session.getAttribute("companyname");

		Connection con = DBUtil.openConnection();
		Statement stmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM EMPLOYEE_MASTER WHERE UNIT = '"+com+"' AND STATUS = '0' ";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				String empId = rs.getString("EMP_ID");
				EmpIdList.add(empId);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		// System.out.println("ARRAY VehicleNoList" + EmpIdList);
		session.setAttribute("EmpIDList", EmpIdList);
		DBUtil.closeResultSet(rs);
		DBUtil.closeStatement(stmt);
		DBUtil.closeConnection(con);
	}

	public static Vector getEmpIdList1(HttpSession session) {
		Vector EmpIdList = new Vector();
		try {
			ArrayList empList = (ArrayList) session.getAttribute("EmpIDList");
			// System.out.println("-------------------------------"+empList);
			String[] empIds = new String[empList.size()];
			for (int i = 0; i < empList.size(); i++) {
				String empId = (String) empList.get(i);
				/* String getval[] = new String[]{empId}; */
				empIds[i] = empId;
				EmpIdList.add(empIds[i]);
			}
		} catch (Exception e) {
			System.out.println("e.getMessage()----inside BinList vector-"+ e.getMessage());
		}
		// System.out.println(EmpIdList);
		return EmpIdList;
	}

	
	public static AssignTaskForm getEmpdetails(String a1) throws Exception {
		AssignTaskForm a2 = null;
		Connection con = DBUtil.openConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = null;
		String sql = "SELECT DESIGNATION,USER_TYPE FROM EMPLOYEES WHERE EMP_NAME='"+ a1 + "'";
		rs = stmt.executeQuery(sql);
		if (rs.next()) {
			a2 = new AssignTaskForm();
			a2.setDesg(rs.getString("DESIGNATION"));
			a2.setDept(rs.getString("USER_TYPE"));
		}
		DBUtil.closeResultSet(rs);
		DBUtil.closeStatement(stmt);
		DBUtil.closeConnection(con);
		return a2;
	}
	
	public static AssignTaskForm getEmpDetails(String a1) throws Exception {
		AssignTaskForm a2 = null;
		Connection con = DBUtil.openConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = null;
		String sql = "SELECT EMP_NAME,DEPARTMENT FROM EMPLOYEE_MASTER WHERE EMP_ID='"+ a1 + "'";
		rs = stmt.executeQuery(sql);
		if (rs.next()) {
			a2 = new AssignTaskForm();
			a2.setDesg(rs.getString("EMP_NAME"));
			a2.setDept(rs.getString("DEPARTMENT"));
		}
		DBUtil.closeResultSet(rs);
		DBUtil.closeStatement(stmt);
		DBUtil.closeConnection(con);
		return a2;
	}
	
	public static AssignTaskForm getEmplDetails(String a1) throws Exception {
		AssignTaskForm a2 = null;
		Connection con = DBUtil.openConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = null;

/*
			String dt="";
			DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
			try{
			//	dt=dateFormat.format(dbDate);
			}catch (Exception e) {
				dt="";
			}
*/




		
		String sql = "SELECT EMP_NAME,DEPARTMENT FROM ASSIGNED_TASK_DETAILS WHERE EMP_ID='"+ a1 + "'";
		rs = stmt.executeQuery(sql);
		if (rs.next()) {
			a2 = new AssignTaskForm();
			a2.setDesg(rs.getString("EMP_NAME"));
		//	a2.setDept(rs.getString("DEPARTMENT"));
			
		//	dt=dateFormat.format(rs.getDate("ASSIGNED_DATE"));
		//	a2.setDate(dt);
		//	a2.setDate2(rs.getString("TARGET_DATE"));
		}
		DBUtil.closeResultSet(rs);
		DBUtil.closeStatement(stmt);
		DBUtil.closeConnection(con);
		return a2;
	}

	public static int getNextTaskNumber() throws Exception {
		int taskNumber = 0;
		Connection con = DBUtil.openConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = null;
		String sql = "SELECT MAX(TASK_NUMBER) AS TASK_NUMBER FROM ASSIGNED_TASK_DETAILS";
		rs = stmt.executeQuery(sql);
		if (rs.next()) {
			taskNumber = rs.getInt("TASK_NUMBER");
		}
		taskNumber += 1;
		DBUtil.closeResultSet(rs);
		DBUtil.closeStatement(stmt);
		DBUtil.closeConnection(con);
		return taskNumber;
	}

	public static int insertTaskDetails(AssignTaskForm taskForm)
			throws Exception {
		int status = 0;
		Connection con = DBUtil.openConnection();
		Statement stmt = con.createStatement();
		String sql = "INSERT INTO ASSIGNED_TASK_DETAILS(TASK_NUMBER,TASK_NAME,ABOUT_TASK,EMP_ID,EMP_NAME,DEPARTMENT,ASSIGNED_DATE,TARGET_DATE,ASSIGNED_BY,DESIGNATION1,DEPARTMENT1,UNIT) VALUES ('"
				+ taskForm.getTaskNumber()
				+ "','"
				+ taskForm.getTaskTitle()
				+ "','"
				+ taskForm.getAboutWork()
				+ "','"
				+ taskForm.getEmpName()
				+ "','"
				+ taskForm.getDesg()
				+ "','"
				+ taskForm.getDept()
				+ "',to_date('"
				+ taskForm.getDate()
				+ "','DD/MM/YYYY'),to_date('"
				+ taskForm.getDate2()
				+ "','DD/MM/YYYY'),'"
				+ taskForm.getAssignedBy()
				+ "','"
				+ taskForm.getDesg1() + "','" + taskForm.getDept1() + "','"+taskForm.getUnit()+"')";
		status = stmt.executeUpdate(sql);
		DBUtil.closeStatement(stmt);
		DBUtil.closeConnection(con);
		return status;
	}
}