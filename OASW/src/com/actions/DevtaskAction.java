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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
import com.forms.DevtaskForm;
import com.forms.EmpViewTasksForm;


public class DevtaskAction extends DispatchAction {
	
	public ActionForward display(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		DevtaskForm empViewForm = (DevtaskForm) form;
		HttpSession session = request.getSession();
		String com=(String) session.getAttribute("companyname"); 
		
		ArrayList al =(ArrayList)session.getAttribute("empName");
		String empName = (String) al.get(0);
		Connection con = DBUtil.openConnection();
		ResultSet rs = null;
		Statement stmt = null;
		String taskNo = (String) session.getAttribute("idTaskNo");
		String Sql = "SELECT * FROM ASSIGNED_TASK_DETAILS WHERE STATUS='0' AND EMP_NAME = '"+empName+"' AND  UNIT = '"+com+"'ORDER BY TASK_NUMBER DESC";
		ArrayList a = new ArrayList();

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(Sql);
			while (rs.next()) {
				empViewForm = new DevtaskForm();
				empViewForm.setTaskNo(rs.getString("TASK_NUMBER"));
				empViewForm.setTaskName(rs.getString("TASK_NAME"));

				empViewForm.setDate1(rs.getDate("ASSIGNED_DATE"));
				String dt = "";
				DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
				dt = dateFormat.format(empViewForm.getDate1());
				empViewForm.setAssignDate(dt);
				
				empViewForm.setDate2(rs.getDate("TARGET_DATE"));
				String dt1 = "";
				DateFormat dateFormat1 = new SimpleDateFormat("dd/MM/yyyy");
				dt1 = dateFormat1.format(empViewForm.getDate2());
				empViewForm.setTargetDate(dt1);
				
				empViewForm.setAboutTask(rs.getString("ABOUT_TASK"));
				empViewForm.setAssignedBy(rs.getString("ASSIGNED_BY"));
				
				empViewForm.setIdTaskNo("Update:" + rs.getString("TASK_NUMBER"));
				empViewForm.setIdTaskNo1("Download:" + rs.getString("TASK_NUMBER"));
				
				a.add(empViewForm);
			}
			rs.close();
			stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("taskDetails", a);

		return mapping.findForward("display");
	}
	
	public ActionForward updateTask(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		DevtaskForm empViewForm = (DevtaskForm) form;
		HttpSession session = request.getSession();
		String param1 = request.getParameter("idTaskNo");
		String id[] = param1.split(":");
		String idTaskNo = id[1].trim();
		System.out.println("idTaskNo--------"+idTaskNo);
		session.setAttribute("idTaskNo", idTaskNo);
		return mapping.findForward("update");
	}
	
	public ActionForward downloadTask(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		DevtaskForm empViewForm = (DevtaskForm) form;
		
		HttpSession session = request.getSession();
		String param1 = request.getParameter("idTaskNo1");
		String id[] = param1.split(":");
		String idTaskNo1 = id[1].trim();
		System.out.println("idTaskNo1--------"+idTaskNo1);
		session.setAttribute("idTaskNo1", idTaskNo1);
		
		String path = "C:\\OASW\\ASSIGNED_TASKS";
		String files;
		File folder = new File(path);
		File[] listOfFiles = folder.listFiles();
		try 
		{
			for (int i = 0; i < listOfFiles.length; i++) 
			{
				if (listOfFiles[i].isFile()) 
				{
					files = listOfFiles[i].getName();
					String filename[] = files.split("\\.");
					if (filename[0].equalsIgnoreCase(idTaskNo1)) 
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
						else if (filename[1].equalsIgnoreCase("txt")) 
						{
							response.setContentType("gif");
						}
						response.setHeader("Content-Disposition","attachment;filename=" + files + "");
						File file = new File("C:\\OASW\\ASSIGNED_TASKS\\"+ files);
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
						empViewForm.setMessage(message);*/
					}
				}
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		return mapping.findForward("display1");
	}
}