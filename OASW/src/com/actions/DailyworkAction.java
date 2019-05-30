/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.actions;

import java.sql.Connection;
import java.sql.PreparedStatement;
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

import com.dbUtil.DBUtil;
import com.forms.AccworkForm;
import com.forms.DailyworkForm;

public class DailyworkAction extends DispatchAction {
	
	public ActionForward display(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		DailyworkForm dailyworkForm = (DailyworkForm) form;// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		 String com=(String) session.getAttribute("companyname");
		 
		 dailyworkForm.setUnit(com);
		ArrayList al =(ArrayList)session.getAttribute("empDetails");
		String username = (String)al.get(1);
		System.out.println("username------"+username);
		dailyworkForm.setUser(username);
		
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		Date date = new Date();
		dailyworkForm.setDate(dateFormat.format(date));
		
		System.out.println(dateFormat.format(date)); //2016/11/16 12:08:43
		return mapping.findForward("display");
	}
	
	public ActionForward sendwork(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws SQLException {
		DailyworkForm dailyworkForm = (DailyworkForm) form;
		System.out.println("88888888888");
		String fromtime = dailyworkForm.getFromtime(); 
		String totime = dailyworkForm.getTotime(); 
		String work = dailyworkForm.getWork(); 
		String status =dailyworkForm.getStatus();
		String user1=dailyworkForm.getUser(); 
		String unit = dailyworkForm.getUnit();
		String date1 = dailyworkForm.getDate();
		 String username = dailyworkForm.getUsername(); 
		System.out.println("THE FROM TIME IS "+fromtime+"the To time is "+totime+"work is "+work+" status is "+status+" username is"+username+" unit is"+unit+" date is "+date1+"" );
		System.out.println("username"+ user1);
		Connection con = null;
		 PreparedStatement prepare = null;
		 con = DBUtil.openConnection();
		 System.out.println("--------------"); 
		 String sql = "INSERT INTO DAILYWORKDETAILS   VALUES ('"+fromtime+"','"+totime+"','"+work+"','"+status+"','"+user1+"','"+unit+"',TO_DATE('"+date1+"','DD/MM/YYYY') )";
		 prepare = con.prepareStatement(sql);
		  int i = prepare.executeUpdate();  
		  System.out.println("==============="); 
		  if (i>0) { 
			  System.out.println("00000000000");
			  request.setAttribute("msg"," data inserted successfully");
			  dailyworkForm.setFromtime(""); 
				dailyworkForm.setTotime(""); 
				dailyworkForm.setWork(""); 
				dailyworkForm.setStatus("");
			 
			  return mapping.findForward("display");
		  } 
		  else { 
			  System.out.println("1111111111111");
			  request.setAttribute("msg1"," data inserted Unsuccessfully");
			  return mapping.findForward("display");
		}
		 
	}

	public ActionForward showhistory(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws SQLException {
		DailyworkForm dailyworkForm = (DailyworkForm) form;

		HttpSession session = request.getSession();

		 String com=(String) session.getAttribute("companyname"); 
		Connection con = DBUtil.openConnection();
		ResultSet rs = null; 
		String user1=dailyworkForm.getUser(); 

		Statement stmt = null;
		String sql ="SELECT * FROM DAILYWORKDETAILS WHERE UNIT = '"+com+"' AND USERNAME='"+user1+"'";
		ArrayList a = new ArrayList();
		

			stmt = con.createStatement();
			rs = stmt.executeQuery(sql); 
			DailyworkForm ac = null;
			while (rs.next()) {
				ac = new DailyworkForm();
				ac.setFromtime1(rs.getString("FROMTIME"));
				ac.setTotime1(rs.getString("TOTIME"));
				ac.setWork1(rs.getString("WORKDETAILS"));
				ac.setStatus1(rs.getString("STATUS"));
				ac.setUsername1(rs.getString("USERNAME"));
				ac.setDate1(rs.getString("DATE"));

				a.add(ac);
			}
				
	   		
	   		request.setAttribute("empmaster", a);
	   		
			
			  return mapping.findForward("display");
	}
} 