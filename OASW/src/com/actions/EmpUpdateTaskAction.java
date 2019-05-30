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
import com.forms.EmpUpdateTaskForm;
import com.forms.EmpViewTasksForm;

public class EmpUpdateTaskAction extends DispatchAction {

	public ActionForward display(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		EmpUpdateTaskForm empUpdateForm = (EmpUpdateTaskForm) form;
		HttpSession session = request.getSession();
		 String com=(String) session.getAttribute("companyname"); 
		 empUpdateForm.setUnit(com);

		String taskNo = (String) session.getAttribute("idTaskNo");
		empUpdateForm.setTaskNumber(taskNo);
		
		ArrayList al =(ArrayList)session.getAttribute("empName");
		empUpdateForm.setEmpName((String) al.get(0));
		
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		String s1 = df.format(date);
		empUpdateForm.setTaskUpdateDate(s1);
		
		Connection con = DBUtil.openConnection();
		ResultSet rs = null;
		Statement stmt = null;
		String Sql = "SELECT * FROM ASSIGNED_TASK_DETAILS WHERE TASK_NUMBER = '"+taskNo+"'";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(Sql);
			if (rs.next()) {
				empUpdateForm.setTaskName(rs.getString("TASK_NAME"));
				empUpdateForm.setDate2(rs.getDate("ASSIGNED_DATE"));
				System.out.println("assigned date is "+rs.getDate("ASSIGNED_DATE"));
				empUpdateForm.setDate3(rs.getDate("TARGET_DATE"));
				System.out.println("target date is "+rs.getDate("ASSIGNED_DATE"));
			}
			rs.close(); 
			stmt.close(); 
		} catch (Exception e) { 
			e.printStackTrace();
		}
		return mapping.findForward("display");
	}
	
	public ActionForward updateTaskDetails(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		EmpUpdateTaskForm empUpdateForm = (EmpUpdateTaskForm) form;
		String taskNo = empUpdateForm.getTaskNumber();
		String taskName = empUpdateForm.getTaskName();
		String updateDate = empUpdateForm.getTaskUpdateDate();
		String name = empUpdateForm.getEmpName();
		String remarks = empUpdateForm.getEmpRemarks();
	System.out.println("aaaaaaaaaaa");
		 
		String taskstatus = empUpdateForm.getStatus(); 
		String unit = empUpdateForm.getUnit();
		System.out.println("ccccccccccccc");
		int status = 0;
		Connection con = DBUtil.openConnection();
		Statement stmt = con.createStatement();
		Statement stmt1 = con.createStatement();
		ResultSet rs = null;
		String Sql = "SELECT * FROM ASSIGNED_TASK_DETAILS WHERE TASK_NUMBER = '"+taskNo+"'";
	
			rs = stmt.executeQuery(Sql);
			if (rs.next()) {
				empUpdateForm.setDate2(rs.getDate("ASSIGNED_DATE"));
			        System.out.println("00000000000000"+rs.getDate("ASSIGNED_DATE"));
					String dt1 = "";
					DateFormat dateFormat1 = new SimpleDateFormat("dd/MM/yyyy");
					dt1 = dateFormat1.format(empUpdateForm.getDate2());
					empUpdateForm.setDate(dt1); 
			         System.out.println("assigned date "+dt1);
			         
			         empUpdateForm.setDate3(rs.getDate("TARGET_DATE"));
				        System.out.println("00000000000000"+rs.getDate("TARGET_DATE"));
			     	String dt2 = "";
					DateFormat dateFormat2 = new SimpleDateFormat("dd/MM/yyyy");
					dt2 = dateFormat2.format(empUpdateForm.getDate3());
					empUpdateForm.setDate4(dt2); 
			         System.out.println("target date "+dt2);
				
			}
			String assigneddate = empUpdateForm.getDate();
			System.out.println("assindeddate is " +assigneddate);
			String targetdate = empUpdateForm.getDate4();
			System.out.println("targetdate is "+targetdate);
		if(taskstatus.equalsIgnoreCase("complete")){
			System.out.println("dddddddddd");
		String sql = "INSERT INTO TASK_UPDATE_DETAILS(TASK_NUMBER,TASK_NAME,UPDATE_DATE,UPDATED_BY,EMP_REMARKS,TASK_STATUS,UNIT,ASSIGNEDDATE,TARGETDATE) VALUES ('"
				+ taskNo
				+ "','"
				+ taskName
				+ "',to_date('"
				+ updateDate
				+ "','DD/MM/YYYY'),'"
				+ name + "','" + remarks + "','" + taskstatus + "','"+unit+"',TO_DATE('"+assigneddate+"','DD/MM/YYYY'),TO_DATE('"+targetdate+"','DD/MM/YYYY'))";
		System.out.println("sql is "+sql);
		status = stmt.executeUpdate(sql);  
		
		if(status>0){
			String sql1 = "UPDATE ASSIGNED_TASK_DETAILS SET STATUS ='1' WHERE TASK_NUMBER = '"+taskNo+"'";
			stmt1.executeQuery(sql1);
			  request.setAttribute("msg"," Task Details Updated Successfully");
			//empUpdateForm.setMessage("Task Details Updated Successfully");
			empUpdateForm.setEmpRemarks("");
			empUpdateForm.setStatus("");
		}
		else{
			  request.setAttribute("msg1"," Task Details Updated UnSuccessfully");

			empUpdateForm.setMessage("Task Details Updated UnSuccessfully");
		}
		}
		else
		{
			String sql = "INSERT INTO TASK_UPDATE_DETAILS(TASK_NUMBER,TASK_NAME,UPDATE_DATE,UPDATED_BY,EMP_REMARKS,TASK_STATUS,UNIT,ASSIGNEDDATE,TARGETDATE) VALUES ('"
				+ taskNo
				+ "','"
				+ taskName
				+ "',to_date('"
				+ updateDate
				+ "','DD/MM/YYYY'),'"
				+ name + "','" + remarks + "','" + taskstatus + "','"+unit+"',TO_DATE('"+assigneddate+"','DD/MM/YYYY'),TO_DATE('"+targetdate+"','DD/MM/YYYY'))";
	System.out.println("sql is "+sql);
			status = stmt.executeUpdate(sql);
		
		if(status>0){
			  request.setAttribute("msg"," Task Details Updated Successfully");

			//empUpdateForm.setMessage("Task Details Updated Successfully");
			empUpdateForm.setEmpRemarks("");
			empUpdateForm.setStatus("");
		}
		else{
			  request.setAttribute("msg1"," Task Details Updated UnSuccessfully");

			//empUpdateForm.setMessage("Task Details Updated UnSuccessfully");
		}
	}
		return mapping.findForward("display");
	}
}