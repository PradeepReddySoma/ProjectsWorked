package com.actions;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.displaytag.tags.el.ELSetPropertyTag;

import com.DAO.OaswDao;
import com.dbUtil.DBUtil;
import com.forms.AdminViewWorkForm;

public class AdminViewWorkAction extends DispatchAction {
	public ActionForward display(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		AdminViewWorkForm viewWorkForm = (AdminViewWorkForm) form;
		HttpSession session = request.getSession();
		String com=(String) session.getAttribute("companyname");
		viewWorkForm.setUnit(com);
		viewWorkForm.setEmpNameList(OaswDao.getEmpIdList(session));
		return mapping.findForward("display");
	}
	
	public ActionForward getEmpNameData(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws SQLException{
		AdminViewWorkForm viewWorkForm = (AdminViewWorkForm) form;
		HttpSession session = request.getSession();
		String com=(String) session.getAttribute("companyname");

		Connection con = DBUtil.openConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = null;
		String empId = viewWorkForm.getEmpName();
		String sql = "SELECT EMP_NAME FROM EMPLOYEE_MASTER WHERE EMP_ID='"+ empId + "'";
		rs = stmt.executeQuery(sql);
		if (rs.next()) {
			viewWorkForm.setEmployeeName(rs.getString("EMP_NAME"));
		}
		viewWorkForm.setEmpNameList(OaswDao.getEmpIdList(session));
		System.out.println("+++++++++++++++++++++OaswDao.getEmpIdList(session) :"+OaswDao.getEmpIdList(session));
		return mapping.findForward("display");
	}

	public ActionForward viewTaskDetails(ActionMapping mapping,
			ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		AdminViewWorkForm viewWorkForm = (AdminViewWorkForm) form;
		HttpSession session = request.getSession();
		String com=(String) session.getAttribute("companyname");

		Connection con = DBUtil.openConnection();
		ResultSet rs = null;
		Statement stmt = null;
		String date = ""; 
		String date1 = "";
		String empId = viewWorkForm.getEmpName();
		String empName = viewWorkForm.getEmployeeName();
		String fromDate = viewWorkForm.getDate1();
		String toDate = viewWorkForm.getDate2();  
		if(empId.equalsIgnoreCase("all")){
			String Sql2 = "SELECT * FROM TASK_UPDATE_DETAILS WHERE UNIT = '"+com+"' AND  TRUNC(UPDATE_DATE)>= TO_DATE('"+fromDate+"','DD/MM/YYYY') AND TRUNC(UPDATE_DATE)<= TO_DATE('"+toDate+"','DD/MM/YYYY') ORDER BY DATESTAMP";
			ArrayList a = new ArrayList();

			try {
				AdminViewWorkForm viewWorkForm1 = null;
				stmt = con.createStatement();
				rs = stmt.executeQuery(Sql2); 
				while (rs.next()) {
					viewWorkForm1 = new AdminViewWorkForm();
					viewWorkForm1.setTaskNo(rs.getString("TASK_NUMBER"));
					viewWorkForm1.setTaskName(rs.getString("TASK_NAME"));
					viewWorkForm1.setAssignedDate(rs.getDate("ASSIGNEDDATE"));
					viewWorkForm1.setTargetDate(rs.getDate( "TARGETDATE"));
					viewWorkForm1.setDate13(rs.getDate("UPDATE_DATE"));
					String dt2 = "";
					DateFormat dateFormat2 = new SimpleDateFormat("dd/MM/yyyy");
					dt2 = dateFormat2.format(viewWorkForm1.getDate13()); 
					viewWorkForm1.setClosedDate(dt2);
					System.out.println(".........assigned darte :"+rs.getString("ASSIGNEDDATE")+"..........target datwe :"+rs.getString( "TARGETDATE"));
					viewWorkForm1.setStatus(rs.getString("TASK_STATUS"));
					a.add(viewWorkForm1);
				}
				rs.close();
				stmt.close(); 
				con.close();  
			} catch (Exception e) {
				e.printStackTrace(); 
			}
			viewWorkForm.setEmpNameList(OaswDao.getEmpIdList(session));
			request.setAttribute("workDetails", a);
			return mapping.findForward("display"); 
	} 
		else {
			String Sql = "SELECT * FROM ASSIGNED_TASK_DETAILS WHERE  UNIT = '"+com+"' AND EMP_ID = '"+empId+"' AND EMP_NAME = '"+empName+"'";
			stmt = con.createStatement(); 
			rs = stmt.executeQuery(Sql); 
			if(rs.next()){ 
				Date dt = rs.getDate("ASSIGNED_DATE");
				DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
				date = dateFormat.format(dt);
				request.setAttribute("date", date);
				 
				Date dt1 = rs.getDate("TARGET_DATE");
				DateFormat dateFormat1 = new SimpleDateFormat("dd/MM/yyyy");
				date1 = dateFormat1.format(dt1);
				request.setAttribute("date1", date1); 
			}
			
			String Sql2 = "SELECT * FROM TASK_UPDATE_DETAILS WHERE  UNIT = '"+com+"' AND UPDATED_BY = '"+empName+"' AND TRUNC(UPDATE_DATE)>= TO_DATE('"+fromDate+"','DD/MM/YYYY') AND TRUNC(UPDATE_DATE)<= TO_DATE('"+toDate+"','DD/MM/YYYY') ORDER BY DATESTAMP";
			ArrayList a = new ArrayList();

			try {
				AdminViewWorkForm viewWorkForm1 = null;
				stmt = con.createStatement();
				rs = stmt.executeQuery(Sql2); 
				while (rs.next()) {
					viewWorkForm1 = new AdminViewWorkForm();
					viewWorkForm1.setTaskNo(rs.getString("TASK_NUMBER"));
					viewWorkForm1.setTaskName(rs.getString("TASK_NAME"));
					viewWorkForm1.setAssignedDate(rs.getDate("ASSIGNEDDATE"));
					viewWorkForm1.setTargetDate(rs.getDate("TARGETDATE")); 
					viewWorkForm1.setDate13(rs.getDate("UPDATE_DATE"));
					String dt2 = "";
					DateFormat dateFormat2 = new SimpleDateFormat("dd/MM/yyyy");
					dt2 = dateFormat2.format(viewWorkForm1.getDate13()); 
					viewWorkForm1.setClosedDate(dt2);
						
					viewWorkForm1.setStatus(rs.getString("TASK_STATUS"));
					a.add(viewWorkForm1);
				}
				rs.close();
				stmt.close(); 
				con.close();  
			} catch (Exception e) {
				e.printStackTrace(); 
			}
			viewWorkForm.setEmpNameList(OaswDao.getEmpIdList(session));
			request.setAttribute("workDetails", a);
			return mapping.findForward("display"); 
		}
	}
	
}