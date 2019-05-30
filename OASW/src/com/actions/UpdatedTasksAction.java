package com.actions;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.dbUtil.DBUtil;
import com.forms.UpdatedTasksForm;

public class UpdatedTasksAction extends DispatchAction {

	public ActionForward display(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		UpdatedTasksForm updateTaskForm = (UpdatedTasksForm) form;
		HttpSession session = request.getSession();
		 String com=(String) session.getAttribute("companyname"); 

		ArrayList al =(ArrayList)session.getAttribute("empName");
		String empName = (String) al.get(0);
		Connection con = DBUtil.openConnection();
		ResultSet rs = null;
		Statement stmt = null;
		String Sql = "SELECT * FROM TASK_UPDATE_DETAILS WHERE STATUS='0' AND UPDATED_BY = '"+empName+"' AND UNIT = '"+com+"' ORDER BY TASK_NUMBER DESC";
		ArrayList a = new ArrayList();

		try { 
			stmt = con.createStatement();
			rs = stmt.executeQuery(Sql);
			while (rs.next()) {
				updateTaskForm = new UpdatedTasksForm();
				updateTaskForm.setTaskNo(rs.getString("TASK_NUMBER"));
				updateTaskForm.setTaskName(rs.getString("TASK_NAME"));

				updateTaskForm.setDate1(rs.getDate("UPDATE_DATE"));
				String dt = "";
				DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
				dt = dateFormat.format(updateTaskForm.getDate1());
				updateTaskForm.setUpdatedDate(dt);
				
				updateTaskForm.setStatus(rs.getString("TASK_STATUS"));
				updateTaskForm.setRemarks(rs.getString("EMP_REMARKS"));
				a.add(updateTaskForm);
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("updatedTasks", a);
 
		return mapping.findForward("display");
	}
}