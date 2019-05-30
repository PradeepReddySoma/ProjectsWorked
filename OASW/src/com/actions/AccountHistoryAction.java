/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.actions;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.dbUtil.DBUtil;
import com.forms.AccountHistoryForm;
import com.forms.HistoryForm;


public class AccountHistoryAction extends DispatchAction {
	
	public ActionForward display(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		AccountHistoryForm accountHistoryForm = (AccountHistoryForm) form;// TODO Auto-generated method stub
		return mapping.findForward("display");
	}
	
	public ActionForward accounthistory(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws SQLException {
		AccountHistoryForm accountHistoryForm = (AccountHistoryForm) form;
		HttpSession session = request.getSession();

		 String com=(String) session.getAttribute("companyname"); 	
		String fromdate=accountHistoryForm.getFromdate();
		String todate=accountHistoryForm.getTodate();
	  /*  String name = accountHistoryForm.getName();
		String type = accountHistoryForm.getType();*/
	    String query = (String)request.getParameter("name");

		System.out.println("from date is "+fromdate+" to date is  "+todate);

	
		 Connection con = DBUtil.openConnection();
		ResultSet rs = null;
		Statement stmt = null;
		stmt = con.createStatement();
			
		System.out.println("PARTICULARS");
		String Sql = "SELECT * FROM ACCOUNTANT WHERE (UNIT = '"+com+"') AND (DATEOF BETWEEN TO_DATE('"+fromdate+"','DD/MM/YYYY') AND TO_DATE('"+todate+"','DD/MM/YYYY')) AND UPPER(PARTICULARS) like '%' || UPPER('"+query+"') || '%' ORDER BY ID ASC";
		rs = stmt.executeQuery(Sql);

		ArrayList a = new ArrayList();

			while (rs.next()) {
				AccountHistoryForm hf=new AccountHistoryForm();
				hf.setSlno1("download:"+rs.getString(1));
				hf.setDate1(rs.getString(2));
				hf.setParticulars1(rs.getString(3));
				hf.setInvoice1(rs.getString(4));
				hf.setFor12(rs.getString(5));
				hf.setAmount1(rs.getString(6));
				hf.setCredit1(rs.getString(7));
				hf.setRemarks1(rs.getString(8));
				hf.setUnit2(rs.getString(9));
				hf.setYear1(rs.getString(10));
				a.add(hf);
			}
			
		
		request.setAttribute("empmaster", a);
		
		/*else if (type.equalsIgnoreCase("INVOICENUMBER")) {
			
			System.out.println("INVOICENO");
			String Sql = "SELECT * FROM ACCOUNTANT WHERE (UNIT = '"+com+"') AND (DATEOF BETWEEN TO_DATE('"+fromdate+"','DD/MM/YYYY') AND TO_DATE('"+todate+"','DD/MM/YYYY')) AND INVOICENUMBER LIKE '%"+name+"%'  ORDER BY ID ASC";
			rs = stmt.executeQuery(Sql);

			ArrayList a = new ArrayList();

				while (rs.next()) {
					AccountHistoryForm hf=new AccountHistoryForm();
					hf.setSlno1("download:"+rs.getString(1));
					hf.setDate1(rs.getString(2));
					hf.setParticulars1(rs.getString(3));
					hf.setInvoice1(rs.getString(4));
					hf.setFor12(rs.getString(5));
					hf.setAmount1(rs.getString(6));
					hf.setCredit1(rs.getString(7));
					hf.setRemarks1(rs.getString(8));
					hf.setUnit2(rs.getString(9));
					hf.setYear1(rs.getString(10));
					a.add(hf);
				}
				
			request.setAttribute("empmaster", a);
			}
		else if (type.equalsIgnoreCase("PAYFOR")) {
			
			System.out.println("PAYFOR");
			String Sql = "SELECT * FROM ACCOUNTANT WHERE (UNIT = '"+com+"') AND (DATEOF BETWEEN TO_DATE('"+fromdate+"','DD/MM/YYYY') AND TO_DATE('"+todate+"','DD/MM/YYYY')) AND PAYFOR LIKE '%"+name+"%' ORDER BY ID ASC";
			rs = stmt.executeQuery(Sql);

			ArrayList a = new ArrayList();

				while (rs.next()) {
					AccountHistoryForm hf=new AccountHistoryForm();
					hf.setSlno1("download:"+rs.getString(1));
					hf.setDate1(rs.getString(2));
					hf.setParticulars1(rs.getString(3));
					hf.setInvoice1(rs.getString(4));
					hf.setFor12(rs.getString(5));
					hf.setAmount1(rs.getString(6));
					hf.setCredit1(rs.getString(7));
					hf.setRemarks1(rs.getString(8));
					hf.setUnit2(rs.getString(9));
					hf.setYear1(rs.getString(10));
					a.add(hf);
				}
				
			
			request.setAttribute("empmaster", a);
			}
		else if (type.equalsIgnoreCase("PAYMODE")) {
			
			System.out.println("PAYMODE");
			String Sql = "SELECT * FROM ACCOUNTANT WHERE (UNIT = '"+com+"') AND (DATEOF BETWEEN TO_DATE('"+fromdate+"','DD/MM/YYYY') AND TO_DATE('"+todate+"','DD/MM/YYYY')) AND PAYMODE LIKE '%"+name+"%'  ORDER BY ID ASC";
			rs = stmt.executeQuery(Sql);

			ArrayList a = new ArrayList();

				while (rs.next()) {
					AccountHistoryForm hf=new AccountHistoryForm();
					hf.setSlno1("download:"+rs.getString(1));
					hf.setDate1(rs.getString(2));
					hf.setParticulars1(rs.getString(3));
					hf.setInvoice1(rs.getString(4));
					hf.setFor12(rs.getString(5));
					hf.setAmount1(rs.getString(6));
					hf.setCredit1(rs.getString(7));
					hf.setRemarks1(rs.getString(8));
					hf.setUnit2(rs.getString(9));
					hf.setYear1(rs.getString(10));
					a.add(hf);
				}
				
			
			request.setAttribute("empmaster", a);
			}
		else if (type.equalsIgnoreCase("CHEQUENO")) {
			System.out.println("CHEQUENO");
			
			String Sql = "SELECT * FROM ACCOUNTANT WHERE (UNIT = '"+com+"') AND (DATEOF BETWEEN TO_DATE('"+fromdate+"','DD/MM/YYYY') AND TO_DATE('"+todate+"','DD/MM/YYYY')) AND CHEQUENO LIKE '%"+name+"%' ORDER BY ID ASC";
			rs = stmt.executeQuery(Sql);

			ArrayList a = new ArrayList();

				while (rs.next()) {
					AccountHistoryForm hf=new AccountHistoryForm();
					hf.setSlno1("download:"+rs.getString(1));
					hf.setDate1(rs.getString(2));
					hf.setParticulars1(rs.getString(3));
					hf.setInvoice1(rs.getString(4));
					hf.setFor12(rs.getString(5));
					hf.setAmount1(rs.getString(6));
					hf.setCredit1(rs.getString(7));
					hf.setRemarks1(rs.getString(8));
					hf.setUnit2(rs.getString(9));
					hf.setYear1(rs.getString(10));
					a.add(hf);
				}
				
			
			request.setAttribute("empmaster", a);
			}
		else if(type.equalsIgnoreCase("AMOUNT")) {
			
			System.out.println("AMOUNT");
			String Sql = "SELECT * FROM ACCOUNTANT WHERE (UNIT = '"+com+"') AND (DATEOF BETWEEN TO_DATE('"+fromdate+"','DD/MM/YYYY') AND TO_DATE('"+todate+"','DD/MM/YYYY')) AND  AMOUNT LIKE '%"+name+"%'  ORDER BY ID ASC";
			rs = stmt.executeQuery(Sql);

			ArrayList a = new ArrayList();

				while (rs.next()) {
					AccountHistoryForm hf=new AccountHistoryForm();
					hf.setSlno1("download:"+rs.getString(1));
					hf.setDate1(rs.getString(2));
					hf.setParticulars1(rs.getString(3));
					hf.setInvoice1(rs.getString(4));
					hf.setFor12(rs.getString(5));
					hf.setAmount1(rs.getString(6));
					hf.setCredit1(rs.getString(7));
					hf.setRemarks1(rs.getString(8));
					hf.setUnit2(rs.getString(9));
					hf.setYear1(rs.getString(10));
					a.add(hf);
				}
				
			
			request.setAttribute("empmaster", a);
			}
else {
			
		
			
			System.out.println("aaaaaaaaaaaaa");
			String Sql = "SELECT * FROM ACCOUNTANT WHERE (UNIT = '"+com+"') AND (DATEOF BETWEEN TO_DATE('"+fromdate+"','DD/MM/YYYY') AND TO_DATE('"+todate+"','DD/MM/YYYY'))  ORDER BY ID ASC";
			rs = stmt.executeQuery(Sql);

			ArrayList a = new ArrayList();

				while (rs.next()) {
					AccountHistoryForm hf=new AccountHistoryForm();
					hf.setSlno1("download:"+rs.getString(1));
					hf.setDate1(rs.getString(2));
					hf.setParticulars1(rs.getString(3));
					hf.setInvoice1(rs.getString(4));
					hf.setFor12(rs.getString(5));
					hf.setAmount1(rs.getString(6));
					hf.setCredit1(rs.getString(7));
					hf.setRemarks1(rs.getString(8));
					hf.setUnit2(rs.getString(9));
					hf.setYear1(rs.getString(10));
					a.add(hf);
				}
				
			
			request.setAttribute("empmaster", a);
			}
		
				
		return mapping.findForward("display");
	
	}
	public ActionForward downloadaccount(ActionMapping mapping, ActionForm form,
			   HttpServletRequest request, HttpServletResponse response)
			   throws Exception {
			  AccountHistoryForm accountHistoryForm = (AccountHistoryForm) form;
			  
			  HttpSession session = request.getSession();
			 
			  String param1 = request.getParameter("slno1");
			  String id[] = param1.split(":");
			  String slno1 = id[1].trim();
			  System.out.println("slno1--------"+slno1);
			  session.setAttribute("slna", slno1);
			  
			  String path = "C:\\OASW\\ACCOUNT";
			  String files;
			  File folder = new File(path);
			  File[] listOfFiles = folder.listFiles();
			  System.out.println(listOfFiles.length);
			  System.out.println("////////////");
			
			  try 
			  {
			   for (int i = 0; i < listOfFiles.length; i++) 
			   {
			    
			    if (listOfFiles[i].isFile()) 
			    {
			     files = listOfFiles[i].getName();
			     System.out.println(files);
			     String filename[] = files.split("\\.");
			     System.out.println(filename[0]);
			     if (filename[0].equalsIgnoreCase(slno1)) 
			     {
			      if (filename[0].equalsIgnoreCase("txt")) 
			      {
			       response.setContentType("text/plain");
			      } 
			      else if (filename[0].equalsIgnoreCase("pdf")) 
			      {
			       response.setContentType("application/pdf");
			      }
			      else if (filename[0].equalsIgnoreCase("xls")) 
			      {
			       response.setContentType("application/xls");
			      }
			      else if (filename[0].equalsIgnoreCase("html")) 
			      {
			       response.setContentType("text/html");
			      } 
			      else if (filename[0].equalsIgnoreCase("jpg")) 
			      {
			       response.setContentType("image/jpg");
			      } 
			      else if (filename[0].equalsIgnoreCase("txt")) 
			      {
			       response.setContentType("gif");
			      }
			      response.setHeader("Content-Disposition","attachment;filename=" + files + "");
			      File file = new File("C:\\OASW\\ACCOUNT\\"+ files);
			      System.out.println(file);
			      try 
			      {
			       FileInputStream fileIn = new FileInputStream(file);
			       ServletOutputStream out = response.getOutputStream();
			       byte[] outputByte = new byte[4096];
			       while (fileIn.read(outputByte, 0, 4096) != -1) 
			       {
			        out.write(outputByte, 0, 4096);
			       }
			       fileIn.close();
			       out.flush();
			       out.close();
			      } 
			      catch (Exception e) 
			      {
			       e.printStackTrace();
			      }
			     } 
			     else 
			     {
					  request.setAttribute("msg"," No document found for given Task");

			      String message = "No document found for given Task";
			      accountHistoryForm.setMessage(message);
			     }
			    }
			   }
			  } 
			  catch (Exception e) 
			  {
			   e.printStackTrace();
			  }*/
			  return mapping.findForward("display");
			 }
	

}