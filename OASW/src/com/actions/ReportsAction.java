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
import com.forms.AccountHistoryForm;
import com.forms.AccountantForm;
import com.forms.AdminaccountForm;
import com.forms.ClientHistoryForm;
import com.forms.HistoryForm;
import com.forms.ReportsForm;

public class ReportsAction extends DispatchAction {
	
	public ActionForward display(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ReportsForm reports = (ReportsForm) form;// TODO Auto-generated method stub
		
		System.out .println("control in display");
		HttpSession session = request.getSession();

		 String com=(String) session.getAttribute("companyname");
			 
		 reports.setUnit(com);
		 
		return mapping.findForward("display");
	}
	
	public ActionForward show4(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ReportsForm reports = (ReportsForm) form;// TODO Auto-generated method stub
		String fromdate = reports.getFromdate();
		String todate = reports.getTodate();

		HttpSession session = request.getSession();

		 String com=(String) session.getAttribute("companyname"); 
		 String str = reports.getReport();
		Connection con = DBUtil.openConnection();
		ResultSet rs = null;
		Statement stmt = null;
		String  reportQuerry="";
		String  reportFname="";
		if (str.equalsIgnoreCase("AdminAccount")) {  

			 reportQuerry = "SELECT * FROM ADMINACCOUNT WHERE  DATEOF BETWEEN TO_DATE('"+fromdate+"','DD/MM/YYYY') AND TO_DATE('"+todate+"','DD/MM/YYYY')  AND UNIT = '"+com+"' ORDER BY ID ASC";
			System.out.println("report query "+reportQuerry);
		    reportFname="admin.rpt";
			reports.setReportShow("YES");
			session.setAttribute("query", reportQuerry);
			session.setAttribute("report", reportFname);
			session.setAttribute("showRep", "showRep");
			
			
			/*ArrayList a = new ArrayList();

			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(Sql); 
				while (rs.next()) {
					ReportsForm hf=new ReportsForm();
					hf.setSlno1(rs.getString(1));
					hf.setDate1(rs.getString(2));
					hf.setParticulars1(rs.getString(3));
					hf.setInvoice1(rs.getString(4));
					hf.setFor12(rs.getString(5));
					hf.setTransaction1(rs.getString(6));
					hf.setAmount1(rs.getString(7));
					hf.setRemarks1(rs.getInt(8));
					hf.setProcess1(rs.getString(9));
					hf.setUnit1(rs.getString(10));
					hf.setYear1(rs.getString(11));
				
					a.add(hf);
					
				}
				request.setAttribute("accountdetails", a);
	*/
			
			
			return mapping.findForward("display");

		}
		else if (str.equalsIgnoreCase("Accountant"))
		  {
			
			reportQuerry = "SELECT * FROM ACCOUNTANT WHERE   DATEOF BETWEEN TO_DATE('"+fromdate+"','DD/MM/YYYY') AND TO_DATE('"+todate+"','DD/MM/YYYY')  AND UNIT = '"+com+"' ORDER BY ID ASC";
			System.out.println("report query "+reportQuerry);
		    reportFname="accountant.rpt";
			reports.setReportShow("YES");
			session.setAttribute("query", reportQuerry);
			session.setAttribute("report", reportFname);
			session.setAttribute("showRep", "showRep");
/*
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(Sql);
				while (rs.next()) {
					ReportsForm hf=new ReportsForm();
					hf.setSlno2(rs.getString(1));
					hf.setDate2(rs.getString(2));
					hf.setParticulars2(rs.getString(3));
					hf.setInvoice2(rs.getString(4));
					hf.setFor1(rs.getString(5));
					hf.setAmount2(rs.getString(6));
					hf.setCredit1(rs.getString(7));
					hf.setRemarks2(rs.getInt(8));
					hf.setUnit3(rs.getString(9));
					hf.setYear2(rs.getString(10));
					a.add(hf);
				}
				rs.close();
				stmt.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("empmaster", a);*/
			return mapping.findForward("display");
		}
		else {

			reportQuerry = "SELECT * FROM CLIENTPAYMENT WHERE  DATEOFPAY BETWEEN TO_DATE('"+fromdate+"','DD/MM/YYYY') AND TO_DATE('"+todate+"','DD/MM/YYYY') AND UNIT = '"+com+"' ORDER BY ID ASC";
			System.out.println("report query "+reportQuerry);
		    reportFname="client1.rpt";
			reports.setReportShow("YES");
			session.setAttribute("query", reportQuerry);
			session.setAttribute("report", reportFname);
			session.setAttribute("showRep", "showRep");

			/*try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(Sql);
				while (rs.next()) {
					ReportsForm cl=new ReportsForm();
					cl.setSlno121(rs.getString(1));
					cl.setDate121(rs.getString(2));
					cl.setProject1(rs.getString(3));
					cl.setInvoice121(rs.getString(4));
					cl.setInvoice4(rs.getString(5));
					cl.setType1(rs.getString(6));
					cl.setAmount121(rs.getString(7));
					cl.setAccnumber1(rs.getString(10));
					cl.setUnit5(rs.getString(8));
					cl.setTotalamount("12345");
				
					cl.setYear5(rs.getString(9));
					
					a.add(cl);
				}
				rs.close();
				stmt.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("clientlist", a);*/
			return mapping.findForward("display");
		}
		
		
		
	}
}

