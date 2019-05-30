/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.actions;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.ResultSet;
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
import org.apache.struts.upload.FormFile;


import com.forms.TenderDisplayForm;
import com.forms.TenderDetailsForm;
import com.forms.TenderhistoryForm;


import com.dbUtil.DBUtil;

public class TenderDisplayAction extends DispatchAction {
	
	public ActionForward display(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		TenderDisplayForm tenderdisplayForm = (TenderDisplayForm) form;// TODO Auto-generated method stub
		return mapping.findForward("display");
	}

	public ActionForward view(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		TenderDisplayForm tenderdisplayForm = (TenderDisplayForm) form;
		HttpSession session = request.getSession();
		String com=(String) session.getAttribute("companyname");
		String fdate = tenderdisplayForm.getFromdate();
		String tdate = tenderdisplayForm.getTodate();
		   System.out.println("control in display");
		Connection con = DBUtil.openConnection();
		ResultSet rs = null;
		Statement stmt = null;
		String Sql = "SELECT * FROM TENDERDETAILS WHERE DOE BETWEEN TO_DATE('"+fdate+"','DD/MM/YYYY') AND TO_DATE('"+tdate+"','DD/MM/YYYY') AND UNIT = '"+com+"' ORDER BY ID 	ASC";
		ArrayList a = new ArrayList();

		TenderDisplayForm tf = null;
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(Sql);
			while (rs.next()) {
				tf = new TenderDisplayForm();
				tf.setSlno(rs.getString(1));
				tf.setDat1(rs.getString(2));
				tf.setTend(rs.getString(3));
				tf.setSub(rs.getString(4));
				tf.setLastdat(rs.getString(5));
				tf.setEmd(rs.getString(6));
				tf.setName(rs.getString(11));
				tf.setNo(rs.getString(12));
				tf.setSlno1("Download:"+rs.getString(1));
				tf.setUserdoc((String)session.getAttribute("userName"));
			    tf.setDeleterec("Delete:"+rs.getString(1));

				a.add(tf); 
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

		request.setAttribute("displaymanag", a);
		return mapping.findForward("tenderdisplay");
	}

	public ActionForward deleterecords(ActionMapping mapping, ActionForm form,
	        HttpServletRequest request, HttpServletResponse response)
	        throws Exception {
		TenderDisplayForm tenderdisplayForm = (TenderDisplayForm) form;
	  
	  String param1 = request.getParameter("deleterec");
	  System.out.println("aaaaa");
	  System.out.println("delete row "+param1);
		String id[] = param1.split(":");
		System.out.println("ID IS "+id[0]); 
		
		String empId1 = id[1].trim();
      System.out.println("EMPID "+empId1);
		HttpSession session = request.getSession();
		Connection con = DBUtil.openConnection();
		Statement stmt = null;
		String sql2 = "SELECT ID FROM TENDERDETAILS WHERE SERNUM = '"+empId1+"'";
		stmt = con.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql2);
		String id1 = null;
		if (rs.next()) {
			id1 = rs.getString("ID");
			 System.out.println("");
		}
		System.out.println(id1);
		
		String Sql = "DELETE FROM TENDERDETAILS WHERE SERNUM like '" + empId1 + "'";
		stmt = con.createStatement();
		int i = stmt.executeUpdate(Sql);
		if (i>0) {
		    request.setAttribute("msg1"," data deleted successfully ");

		}
		   String sql1 = "insert into TENDERDETAILS values('"+empId1+"',TO_DATE('','DD/MM/YYYY'),'','','','','','','"+id1+"','','','')";
	       stmt.executeUpdate(sql1);
		   return mapping.findForward("display"); 
  }
	  public ActionForward download(ActionMapping mapping, ActionForm form,
		        HttpServletRequest request, HttpServletResponse response)
		        throws Exception {
		   TenderDisplayForm tenderdisplayForm = (TenderDisplayForm) form;
		   
			  System.out.println("aaaaa");

				HttpSession session = request.getSession();
				String param1 = request.getParameter("slno1");
				String id[] = param1.split(":");
				String slno1 = id[1].trim();
				System.out.println("idTaskNo1--------"+slno1);
				//session.setAttribute("slno1", slno1);
				System.out.println("bbbbbbbb");
				String path = "C:\\OASW\\TENDER";
				String files;
				File folder = new File(path);
				File[] listOfFiles = folder.listFiles();
				System.out.println("ccccc");
				try 
				{
					System.out.println("eeeeeeeeee");
					for (int i = 0; i < listOfFiles.length; i++) 
					{
						System.out.println("ddddddddd");
						if (listOfFiles[i].isFile()) 
						{
							files = listOfFiles[i].getName();
							String filename[] = files.split("\\.");
							if (filename[0].equalsIgnoreCase(slno1)) 
							{
								if (filename[1].equalsIgnoreCase("txt")) 
								{
									response.setContentType("text/plain");
								} 
								else if (filename[1].equalsIgnoreCase("pdf")) 
								{
									response.setContentType("application/pdf");
								}
								else if (filename[1].equalsIgnoreCase("xls")) 
								{
									response.setContentType("application/xls");
								}
								else if (filename[1].equalsIgnoreCase("html")) 
								{
									response.setContentType("text/html");
								} 
								else if (filename[1].equalsIgnoreCase("jpg")) 
								{
									response.setContentType("image/jpg");
								} 
							/*	else if (filename[1].equalsIgnoreCase("txt")) 
								{
									response.setContentType("gif");
								}*/
								response.setHeader("Content-Disposition","attachment;filename=" + files + "");
								File file = new File("C:\\OASW\\TENDER\\"+ files);
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

				      /*String message = "No document found for given Task";
				      tenderdisplayForm.setMessage(message);*/
				     }
				    }
				   }
				  } 
				  catch (Exception e) 
				  {
				   e.printStackTrace();
				  }
				  return mapping.findForward("display");
				 }
}