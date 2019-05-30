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
import org.displaytag.tags.el.ELSetPropertyTag;

import com.dbUtil.DBUtil;
import com.forms.DailyreportForm;

public class DailyreportAction extends DispatchAction {

	public ActionForward display(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws SQLException {
		DailyreportForm dailyreportForm = (DailyreportForm) form;// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		 String com=(String) session.getAttribute("companyname");
			Connection con = DBUtil.openConnection();

		 dailyreportForm.setUnit(com);
			System.out.println("inside action class");
			System.out.println("connection------"+con);
		   
		     Statement stmt = (Statement) con.createStatement();
		      
		        String sql = "Select EMP_ID From EMPLOYEES WHERE UNIT = '"+com+"' ORDER BY EMP_ID ASC";
		       
		        ResultSet rs = stmt.executeQuery(sql);
		        ArrayList<String> List1 = new ArrayList<String>();
		        while (rs.next()) {

		            List1.add(rs.getString("EMP_ID"));
		            
		      }
		        if( List1!=null){
		         System.out.println("inside if");
		         session.setAttribute("plist",  List1);
		      return mapping.findForward("display");
		      
		       
		        }
				return mapping.findForward("display");
		        
		 
	} 

	public ActionForward displayrecord(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws SQLException {
		DailyreportForm dailyreportForm = (DailyreportForm) form;// TODO Auto-generated method stub
		{		

	        System.out.println("inside action class");

			Connection con1 = DBUtil.openConnection();

		
		        System.out.println("inside action class");
				System.out.println("connection1------"+con1);
			 
			     Statement stmt1 = (Statement) con1.createStatement();
					String slno = dailyreportForm.getSlno();

			        String sql1 = "Select USERNAME,DESIGNATION From EMPLOYEES WHERE EMP_ID = '"+slno+"'";
			       
			        ResultSet rs1 = stmt1.executeQuery(sql1);
			        if(rs1.next()) {
						
			
			        dailyreportForm.setName(rs1.getString("USERNAME"));
			        dailyreportForm.setDesgn(rs1.getString("DESIGNATION"));
			        
		   
			        }
		     
		     
		return mapping.findForward("display");
		}
	}
	
	public ActionForward generatereport(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws SQLException {
		DailyreportForm dailyreportForm = (DailyreportForm) form;// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		 String com=(String) session.getAttribute("companyname");
		String slno = dailyreportForm.getSlno();
		String name = dailyreportForm.getName();
		String desg = dailyreportForm.getDesgn();
		String fdate = dailyreportForm.getFdate();
		String tdate = dailyreportForm.getTdate();
		String  reportQuerry="";
		String  reportFname="";
		String daily = dailyreportForm.getDaily();
		if (daily.equalsIgnoreCase("attendance")) 
		{
               if (slno.equalsIgnoreCase("all")) 
               {
    reportQuerry = "SELECT * FROM WORKTIME WHERE  STARTTIME IS NOT NULL AND CURRENTDATE BETWEEN TO_DATE('"+fdate+"','DD/MM/YYYY') AND TO_DATE('"+tdate+"','DD/MM/YYYY') AND UNIT ='"+com+"' ORDER BY  EMPID ASC";
	System.out.println("report query "+reportQuerry);
    reportFname="dailyReport1.rpt";
	dailyreportForm.setReportShow("YES");
	session.setAttribute("query", reportQuerry);
	session.setAttribute("report", reportFname);
	session.setAttribute("showRep", "showRep");
		      }
               
else 
{	reportQuerry = "SELECT * FROM WORKTIME WHERE STARTTIME IS NOT NULL AND CURRENTDATE BETWEEN TO_DATE('"+fdate+"','DD/MM/YYYY') AND TO_DATE('"+tdate+"','DD/MM/YYYY') AND UNIT ='"+com+"' AND USERNAME ='"+name+"' ORDER BY  EMPID ASC";
		reportFname="dailyReport1.rpt";
		dailyreportForm.setReportShow("YES");
		session.setAttribute("query", reportQuerry);
		session.setAttribute("report", reportFname);
		session.setAttribute("showRep", "showRep");
}
}
		else  {
			if (slno.equalsIgnoreCase("all")) {
				reportQuerry = "SELECT * FROM WORKTIME WHERE CURRENTDATE BETWEEN TO_DATE('"+fdate+"','DD/MM/YYYY') AND TO_DATE('"+tdate+"','DD/MM/YYYY') AND UNIT ='"+com+"' ORDER BY  EMPID ASC ";			
				reportFname="timeReport1.rpt";
				dailyreportForm.setReportShow("YES");
				session.setAttribute("query", reportQuerry);
				session.setAttribute("report", reportFname);
				session.setAttribute("showRep", "showRep");
					}
			else {		
					reportQuerry = "SELECT * FROM WORKTIME WHERE CURRENTDATE BETWEEN TO_DATE('"+fdate+"','DD/MM/YYYY') AND TO_DATE('"+tdate+"','DD/MM/YYYY') AND TOTIME IS NOT NULL AND UNIT ='"+com+"' AND USERNAME ='"+name+"' ORDER BY  EMPID ASC";
					reportFname="timeReport1.rpt";
					dailyreportForm.setReportShow("YES");
					session.setAttribute("query", reportQuerry);
					session.setAttribute("report", reportFname);
					session.setAttribute("showRep", "showRep");
			}
		} 
	
		return mapping.findForward("display");

	}
	
}
