/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
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

import com.dbUtil.DBUtil;
import com.forms.CompanyAccountForm;
import com.forms.EmployeeAccountForm;

/** 
 * MyEclipse Struts
 * Creation date: 10-08-2016
 * 
 * XDoclet definition:
 * @struts.action path="/employeeAccount" name="employeeAccountForm" input="/jsp/employeeAccount.jsp" parameter="method" scope="request" validate="true"
 */
public class EmployeeAccountAction extends DispatchAction {
	
	public ActionForward diaplay(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		EmployeeAccountForm employeeAccountForm = (EmployeeAccountForm) form;// TODO Auto-generated method stub
		return mapping.findForward("display");
	}
	
	public ActionForward empsub(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws SQLException {
		EmployeeAccountForm employeeAccountForm = (EmployeeAccountForm) form;// TODO Auto-generated method stub
		
		String empname=employeeAccountForm.getEmpname();
		String name = employeeAccountForm.getName();
		String accnumber = employeeAccountForm.getAcc();
		String code = employeeAccountForm.getCode();
		String address = employeeAccountForm.getAddress();
		String unit=employeeAccountForm.getUnit();
		String year=employeeAccountForm.getYear();
		
		System.out.println("Employee name is "+empname+" Bank name is  "+name+" Account Number "+accnumber+" code "+code+" Address "+address);
		
		Connection con = DBUtil.openConnection();
		Statement stmt = con.createStatement();
		ResultSet rs=null;
		
		String sql = "INSERT INTO EMPACCOUNT VALUES('"+empname+"','"+name+"','"+accnumber+"','"+code+"','"+address+"','"+unit+"','"+year+"')";
		stmt.executeUpdate(sql);
		
		
		request.setAttribute("msg"," data inserted successfully ");

		
		return mapping.findForward("display");
	}
	
	public ActionForward empDetails(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		EmployeeAccountForm employeeAccountForm = (EmployeeAccountForm) form;// TODO Auto-generated method stub
		
			HttpSession session = request.getSession();
			Connection con = DBUtil.openConnection();
			ResultSet rs = null;
			Statement stmt = null;
			String Sql = "SELECT * FROM EMPACCOUNT";
			ArrayList a = new ArrayList();

			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(Sql);
				while (rs.next()) {
					EmployeeAccountForm ac=new EmployeeAccountForm();
					ac.setUnit1(rs.getString(6));
					ac.setYear1(rs.getString(7));
					ac.setEmpname1(rs.getString(1));
					ac.setName1(rs.getString(2));
					ac.setAcc1(rs.getString(3));
					ac.setCode1(rs.getString(4));
					ac.setAddress1(rs.getString(5));
					
					a.add(ac);
				}
				rs.close();
				stmt.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("empmaster", a);
			
			System.out.println(a);
	
		return mapping.findForward("display");
	}
	
}