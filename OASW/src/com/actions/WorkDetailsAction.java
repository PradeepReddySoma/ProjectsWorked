package com.actions;

import java.sql.Connection;
import java.sql.ResultSet;
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

import com.DAO.OaswDao;
import com.dbUtil.DBUtil;
import com.forms.WorkDetailsForm;

public class WorkDetailsAction extends DispatchAction {
	public ActionForward display(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		WorkDetailsForm workDetailsForm = (WorkDetailsForm) form;
		HttpSession session = request.getSession();
		String com=(String) session.getAttribute("companyname");
		workDetailsForm.setUnit(com);
		workDetailsForm.setEmpNameList(OaswDao.getEmpIdList(session));
		return mapping.findForward("display");
	}
	
	public ActionForward viewTaskDetails(ActionMapping mapping,
			ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		WorkDetailsForm workDetailsForm = (WorkDetailsForm) form;
		HttpSession session = request.getSession();
		String com=(String) session.getAttribute("companyname");

		Connection con = DBUtil.openConnection();
		ResultSet rs = null;
		Statement stmt = null;
		String date = "";
		String date1 = "";
		String empId = workDetailsForm.getEmpName();
		String fromDate = workDetailsForm.getDate1();
		String toDate = workDetailsForm.getDate2();
		String Sql = "SELECT * FROM ASSIGNED_TASK_DETAILS WHERE EMP_ID = '"+empId+"' AND TRUNC(ASSIGNED_DATE)>= TO_DATE('"+fromDate+"','DD/MM/YYYY') AND TRUNC(TARGET_DATE)<= TO_DATE('"+toDate+"','DD/MM/YYYY') AND UNIT ='"+com+"' ORDER BY TASK_NUMBER";
		stmt = con.createStatement();
		rs = stmt.executeQuery(Sql);
		ArrayList a = new ArrayList(); 
			try {
				WorkDetailsForm workDetailsForm1 = null;
				stmt = con.createStatement();
				rs = stmt.executeQuery(Sql);
				while (rs.next()) {
					workDetailsForm1 = new WorkDetailsForm();
					workDetailsForm1.setEmpId1(rs.getString("EMP_ID"));
					workDetailsForm1.setEmpName(rs.getString("EMP_NAME"));
					workDetailsForm1.setTaskNo(rs.getString("TASK_NUMBER"));
					workDetailsForm1.setTaskName(rs.getString("TASK_NAME"));
					workDetailsForm1.setTaskDesc(rs.getString("ABOUT_TASK"));
					
					Date dt = rs.getDate("ASSIGNED_DATE");
					DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
					date = dateFormat.format(dt); 
					workDetailsForm1.setAssignedDate(date);
					
					Date dt1 = rs.getDate("TARGET_DATE");
					DateFormat dateFormat1 = new SimpleDateFormat("dd/MM/yyyy");
					date1 = dateFormat1.format(dt1);
					workDetailsForm1.setTargetDate(date1);
					
					a.add(workDetailsForm1);
				}
				if(empId.equalsIgnoreCase("all")){
					String Sql1 = "SELECT * FROM ASSIGNED_TASK_DETAILS WHERE TRUNC(ASSIGNED_DATE)>= TO_DATE('"+fromDate+"','DD/MM/YYYY') AND TRUNC(TARGET_DATE)<= TO_DATE('"+toDate+"','DD/MM/YYYY') AND UNIT ='"+com+"' ORDER BY TASK_NUMBER";
					stmt = con.createStatement();
					rs = stmt.executeQuery(Sql1);
					stmt = con.createStatement();
					rs = stmt.executeQuery(Sql1);
					while (rs.next()) {
						workDetailsForm1 = new WorkDetailsForm();
						workDetailsForm1.setEmpId1(rs.getString("EMP_ID"));
						workDetailsForm1.setEmpName(rs.getString("EMP_NAME"));
						workDetailsForm1.setTaskNo(rs.getString("TASK_NUMBER"));
						workDetailsForm1.setTaskName(rs.getString("TASK_NAME"));
						workDetailsForm1.setTaskDesc(rs.getString("ABOUT_TASK"));
							
						Date dt = rs.getDate("ASSIGNED_DATE");
						DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
						date = dateFormat.format(dt);
						workDetailsForm1.setAssignedDate(date);
							
						Date dt1 = rs.getDate("TARGET_DATE");
						DateFormat dateFormat1 = new SimpleDateFormat("dd/MM/yyyy");
						date1 = dateFormat1.format(dt1);
						workDetailsForm1.setTargetDate(date1);
							
						a.add(workDetailsForm1);
					}  
				rs.close();
				stmt.close();
				con.close();
			}
			}catch (Exception e) {
				e.printStackTrace();
			}
		workDetailsForm.setEmpNameList(OaswDao.getEmpIdList(session));
		request.setAttribute("workDetails", a);
		return mapping.findForward("display");
	}
}