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
import com.forms.DisplayworkForm;

public class AssignReportAction extends DispatchAction {
	
	public ActionForward showreporthistory(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws SQLException {
		DisplayworkForm displayworkForm = (DisplayworkForm) form;// TODO Auto-generated method stub
		HttpSession session = request.getSession();

		 String com=(String) session.getAttribute("companyname"); 
		 String query = (String)request.getParameter("name");

			System.out.println("name="+query);

		Connection con = DBUtil.openConnection();
		ResultSet rs = null; 
		Statement stmt = null;
		if (query.equalsIgnoreCase("All")) {
			String sql1 ="SELECT * FROM ASSIGNED_TASK_DETAILS WHERE UNIT ='"+com+"'";
			ArrayList a1 = new ArrayList();

			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql1); 
				DisplayworkForm ds1 = null;
				
				while (rs.next()) {
					ds1 = new DisplayworkForm();
					ds1.setFromtime1(rs.getString("EMP_ID"));
					ds1.setTotime1(rs.getString("EMP_NAME"));
ds1.setWork(rs.getString("ASSIGNED_DATE"));
					ds1.setStatus(rs.getString("TARGET_DATE"));
					ds1.setUsername1(rs.getString("ABOUT_TASK"));
	
					a1.add(ds1);
					
				}
	   			
	   			rs.close();
	   			stmt.close();
	   			con.close();
	   		} catch (Exception e) {
	   			e.printStackTrace();
	   		}
	   		request.setAttribute("empmaster", a1);
	   		
			}
				else {
					
		String sql ="SELECT * FROM ASSIGNED_TASK_DETAILS WHERE UPPER(EMP_NAME) like '%' || UPPER('"+query+"')";
		ArrayList a = new ArrayList();
		try {
	
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql); 
			DisplayworkForm ds = null;
			while (rs.next()) {
				ds = new DisplayworkForm();
				ds.setFromtime1(rs.getString("EMP_ID"));
				ds.setTotime1(rs.getString("EMP_NAME"));
				ds.setWork(rs.getString("ASSIGNED_DATE"));
				ds.setStatus(rs.getString("TARGET_DATE"));
				ds.setUsername1(rs.getString("ABOUT_TASK"));
				
				a.add(ds);
			}
				rs.close();
	   			stmt.close();
	   			con.close();
	   		} catch (Exception e) {
	   			e.printStackTrace();
	   		}
	   		request.setAttribute("empmaster", a);
	   		
			}
			
			 
			return mapping.findForward("displayReport");
	}

}
