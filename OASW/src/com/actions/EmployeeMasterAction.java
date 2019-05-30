package com.actions;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.DAO.OaswDao;
import com.dbUtil.DBUtil;
import com.forms.EmployeeMaster;

public class EmployeeMasterAction extends DispatchAction {
	public ActionForward display(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		EmployeeMaster empMasterForm = (EmployeeMaster) form;

		HttpSession session = request.getSession();

		String com=(String) session.getAttribute("companyname");

		empMasterForm.setUnit(com);
		return mapping.findForward("display");
	}

	public ActionForward empDetails(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		EmployeeMaster empMasterForm = (EmployeeMaster) form;
		int count = OaswDao.checkEmployee(empMasterForm.getEmpId());
		if (count == 1) {
			empMasterForm.setMessage("Employee details For Id '"+ empMasterForm.getEmpId() + "' are already exist");
			empMasterForm.setEmpId("");
			empMasterForm.setEmpName("");
			empMasterForm.setDept("");
			empMasterForm.setDesg("");
		} else {
			int status = OaswDao.addEmployees(empMasterForm);
			if (status == 1) {
				request.setAttribute("msg"," data inserted successfully ");
				//empMasterForm.setMessage("Employee details are added succesfully");
				empMasterForm.setEmpId("");
				empMasterForm.setEmpName("");
				empMasterForm.setDept("");
				empMasterForm.setDesg("");
			} else { 
				empMasterForm.setMessage("Employee details insertion unsuccessfull");
			}
		}
		return mapping.findForward("display");
	}

	public ActionForward displayDetails(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		EmployeeMaster empMasterForm = (EmployeeMaster) form;

		HttpSession session = request.getSession();
		String com=(String) session.getAttribute("companyname");

		Connection con = DBUtil.openConnection();
		ResultSet rs = null;
		Statement stmt = null;
		String Sql = "SELECT * FROM EMPLOYEE_MASTER WHERE UNIT = '"+com+"' ORDER BY EMP_ID";
		ArrayList a = new ArrayList();

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(Sql);
			while (rs.next()) {
				empMasterForm = new EmployeeMaster();
				empMasterForm.setEmpId1("Delete:" + rs.getString("EMP_ID"));
				empMasterForm.setEmpName1(rs.getString("EMP_NAME"));
				empMasterForm.setDepartment1(rs.getString("DEPARTMENT"));
				empMasterForm.setDesignation1(rs.getString("DESIGNATION"));
				empMasterForm.setAccount1(rs.getString("ACCOUNT_FOR"));
				a.add(empMasterForm);
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("empmaster", a);
		return mapping.findForward("display");
	}

	public ActionForward deleteMasterRow(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		EmployeeMaster empMasterForm = (EmployeeMaster) form;
		String param1 = request.getParameter("empId1");
		String id[] = param1.split(":");
		String empId1 = id[1].trim();
		Connection con = DBUtil.openConnection();
		Statement stmt = null;
		String sql = "DELETE FROM EMPLOYEE_MASTER WHERE EMP_ID = '"+empId1+"'";
		stmt = con.createStatement();
		int i = stmt.executeUpdate(sql);
		if (i > 0) {
			empMasterForm.setMessage("Deleted " + i + " rows from Employee Master table");
		} else {
			empMasterForm.setMessage("No rows Deleted ");
		}
		stmt.close();
		con.close();
		return mapping.findForward("display");
	}
}