package com.actions;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.upload.FormFile;

import com.DAO.OaswDao;
import com.dbUtil.DBUtil;
import com.forms.AssignTaskForm;
import com.forms.DisplayworkForm;
import com.forms.TenderhistoryForm;

public class AssignTaskAction extends DispatchAction {
	public ActionForward display(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		AssignTaskForm taskForm = (AssignTaskForm) form;
		HttpSession session = request.getSession();
		String com=(String) session.getAttribute("companyname");

		taskForm.setUnit(com);
		ArrayList al =(ArrayList)session.getAttribute("empName");
		String empName = (String) al.get(0);
		taskForm.setAssignedBy(empName);

		AssignTaskForm taskForm1 = OaswDao.getEmpdetails(empName);
		taskForm.setDept1(taskForm1.getDept());  
		taskForm.setDesg1(taskForm1.getDesg());
 
		int taskNumber = OaswDao.getNextTaskNumber();
		// System.out.println("The Task Number is----------------------"+taskNumber);
		String taskNo = Integer.toString(taskNumber);
		// System.out.println(taskNo+"---------------------");
		taskForm.setTaskNumber(taskNo); 
		 System.out.println(".......In OaswDao : "+ OaswDao.getEmpIdList(session));
		taskForm.setEmpNameList(OaswDao.getEmpIdList(session));
		Date d1 = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("dd/MM/yyyy");
		String d2 = sd.format(d1);
		taskForm.setDate(d2);
		return mapping.findForward("display");
	}
	
	public ActionForward displayReport1(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		AssignTaskForm taskForm = (AssignTaskForm) form;
		/*String param = request.getParameter("param");
		if(param != null){
			System.out.println("$$$$$In get param not null");
			
			
			ArrayList a1 = new ArrayList();
		System.out.println(".................Empl id:"+taskForm.getEmpName());
			String empId = param;
			/////////new code////
			Connection con = DBUtil.openConnection();
			Statement stmt = null;
			ResultSet rs = null;
			try {
				String sql = "SELECT * FROM ASSIGNED_TASK_DETAILS WHERE EMP_ID = '"+empId+"'  ";
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs.next()) {
					String empId1 = rs.getString("EMP_ID");
					System.out.println("$$$$$$$$$$$$$emp id is in rs :"+empId1);
					//EmpIdList.add(empId1);
					taskForm.setEmpName(empId1);
					taskForm.setDesg(rs.getString("EMP_NAME"));
					System.out.println("$$$$$$$$$$$$$emp NAME is in rs :"+rs.getString("EMP_NAME"));
					
					a1.add(taskForm);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			


			request.setAttribute("EmpDetails", a1);
		}
		*/
	//	AssignTaskForm taskForm = (AssignTaskForm) form;
		HttpSession session = request.getSession();
		String com=(String) session.getAttribute("companyname");

		taskForm.setUnit(com);
		ArrayList al =(ArrayList)session.getAttribute("empName");
		String empName = (String) al.get(0);
		taskForm.setAssignedBy(empName);

		AssignTaskForm taskForm1 = OaswDao.getEmpdetails(empName);
		taskForm.setDept1(taskForm1.getDept());  
		taskForm.setDesg1(taskForm1.getDesg());
 
		int taskNumber = OaswDao.getNextTaskNumber();
		// System.out.println("The Task Number is----------------------"+taskNumber);
		String taskNo = Integer.toString(taskNumber);
		// System.out.println(taskNo+"---------------------");
		taskForm.setTaskNumber(taskNo); 
		 System.out.println(OaswDao.getEmpIdList(session));
		taskForm.setEmpNameList(OaswDao.getEmpIdList(session));
		Date d1 = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("dd/MM/yyyy");
		String d2 = sd.format(d1);
		taskForm.setDate(d2);
		
		
		return mapping.findForward("displayReport1");
	}
	
	public ActionForward showreporthistory(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws SQLException {
		/*DisplayworkForm displayworkForm = (DisplayworkForm) form;// TODO Auto-generated method stub*/
		AssignTaskForm displayworkForm = (AssignTaskForm) form;// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		displayworkForm.setEmpNameList(OaswDao.getEmpIdList(session));
		System.out.println("---------------------OaswDao.getEmpIdList(session) :"+OaswDao.getEmpIdList(session));
		 String com=(String) session.getAttribute("companyname"); 
		 String query = (String)request.getParameter("empName");

			System.out.println("............name="+query);

		Connection con = DBUtil.openConnection();
		ResultSet rs = null; 
		Statement stmt = null;
	//	if (query.equalsIgnoreCase("All")) {
			String sql1 ="SELECT * FROM ASSIGNED_TASK_DETAILS WHERE EMP_ID = '"+query+"'  ";
			ArrayList a1 = new ArrayList();

			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql1); 
				/*DisplayworkForm ds1 = null;*/
				AssignTaskForm ds1 = null;
				
				while (rs.next()) {
					ds1 = new AssignTaskForm();
					ds1.setEmpName(rs.getString("EMP_ID"));
					ds1.setDesg(rs.getString("EMP_NAME"));
                    ds1.setDate(rs.getString("ASSIGNED_DATE"));
					ds1.setDate2(rs.getString("TARGET_DATE"));
					ds1.setAboutWork(rs.getString("ABOUT_TASK"));
					
					a1.add(ds1);
					
				}
	   			
			
				
		   		request.setAttribute("empmaster", a1);
	   			rs.close();
	   			stmt.close();
	   			con.close();
	   		} catch (Exception e) {
	   			e.printStackTrace();
	   		}
			
			
	   		
			/*}
				else {
					
		String sql ="SELECT * FROM ASSIGNED_TASK_DETAILS WHERE UPPER(EMP_NAME) like '%' || UPPER('"+query+"')";
		ArrayList a = new ArrayList();
		try {
	
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql); 
			DisplayworkForm ds = null;
			AssignTaskForm ds = null;
			while (rs.next()) {
				ds = new AssignTaskForm();
				ds.setEmpName(rs.getString("EMP_ID"));
				ds.setDesg(rs.getString("EMP_NAME"));
				ds.setDate(rs.getString("ASSIGNED_DATE"));
				ds.setDate2(rs.getString("TARGET_DATE"));
				ds.setAboutWork(rs.getString("ABOUT_TASK"));
				
				a.add(ds);
			}
				rs.close();
	   			stmt.close();
	   			con.close();
	   		} catch (Exception e) {
	   			e.printStackTrace();
	   		}
	   		request.setAttribute("empmaster", a);
	   		
			}*/
			
			 
			return mapping.findForward("displayReport1");
	}

	public ActionForward getEmpDetails(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		AssignTaskForm taskForm = (AssignTaskForm) form;
		AssignTaskForm taskForm1 = OaswDao.getEmpDetails(taskForm.getEmpName());
		taskForm.setDept(taskForm1.getDept());
		taskForm.setDesg(taskForm1.getDesg()); 
		HttpSession session = request.getSession();
		taskForm.setEmpNameList(OaswDao.getEmpIdList(session));
		return mapping.findForward("display");
	}
	
	public ActionForward getEmplDetails(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		AssignTaskForm taskForm = (AssignTaskForm) form;
		ArrayList a1 = new ArrayList();
	System.out.println(".................Empl id:"+taskForm.getEmpName());
		
	String empId = taskForm.getEmpName();
	/////////new code////
	Connection con = DBUtil.openConnection();
	Statement stmt = null;
	ResultSet rs = null;
	try {
		String sql = "SELECT * FROM ASSIGNED_TASK_DETAILS WHERE EMP_ID = '"+empId+"'  ";
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		while (rs.next()) {
			String empId1 = rs.getString("EMP_ID");
			System.out.println("$$$$$$$$$$$$$emp id is in rs :"+empId1);
			//EmpIdList.add(empId1);
			taskForm.setEmpName(empId1);
			taskForm.setDesg(rs.getString("EMP_NAME"));
			
			a1.add(taskForm);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	
	
	request.setAttribute("EmpDetails", a1);
	
	return mapping.findForward("displayReport1");
	}
 
	public ActionForward assignTask(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		AssignTaskForm taskForm = (AssignTaskForm) form;
		HttpSession session = request.getSession();
		try { 
			// file upload
			// FileUploadForm fileUploadForm = (FileUploadForm)form;
			FormFile file = taskForm.getFile();
			// Get the servers upload directory real path name
			// String filePath=getServlet().getServletContext().getRealPath("/")
			// +"upload";
			String filePath =  "C:\\OASW\\ASSIGNED_TASKS";
			// create the upload folder if not exists
			File folder = new File(filePath);
			if (!folder.exists()) {
				folder.mkdirs();
			}
			String fileName = file.getFileName();
			String extension[] = fileName.split("\\.");
			// System.out.println(extension.length
			// +"----------------------------------------");
			if (extension.length != 1) {
				String getExtension = extension[1];
				if (!("").equals(fileName)) {
					System.out.println("Server path:" + filePath);
					File newFile = new File(filePath, fileName);
					try {
						if (!newFile.exists()) {
							FileOutputStream fos = new FileOutputStream(newFile);
							fos.write(file.getFileData());
							fos.flush();
							fos.close();
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
					// String empcode = tadetailsForm.getEmpCode();
					String app = "FILE";
					newFile.renameTo(new File( "C:\\OASW\\ASSIGNED_TASKS\\"+ taskForm.getTaskNumber() + "." + getExtension));
					request.setAttribute("uploadedFilePath", newFile.getAbsoluteFile());
					request.setAttribute("uploadedFileName", newFile.getName());
				}
			} else {

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		int status = OaswDao.insertTaskDetails(taskForm);
		if (status == 1) {
			request.setAttribute("msg1"," data inserted successfully ");
			//taskForm.setMessage("Task has been given successfully");
			taskForm.setEmpName("");
			taskForm.setDesg("");
			taskForm.setDept("");
			taskForm.setDate2("");
			taskForm.setTaskNumber("");
			taskForm.setTaskTitle("");
			taskForm.setAboutWork("");
			
		
			int taskNumber = OaswDao.getNextTaskNumber();
			// System.out.println("The Task Number is----------------------"+taskNumber);
			String taskNo = Integer.toString(taskNumber);
			// System.out.println(taskNo+"---------------------");
			taskForm.setTaskNumber(taskNo); 
		} else {
			request.setAttribute("msg2"," data inserted unsuccessfully ");
			//taskForm.setMessage("UnSuccessfull");
		}
		taskForm.setEmpNameList(OaswDao.getEmpIdList(session));
		return mapping.findForward("display");
	}
	
	public ActionForward download(ActionMapping mapping, ActionForm form,
	        HttpServletRequest request, HttpServletResponse response)
	        throws Exception {
		AssignTaskForm tenderdisplayForm = (AssignTaskForm) form;
	 
	  System.out.println("aaaaa");

		HttpSession session = request.getSession();
		String param1 = request.getParameter("empName");
		  System.out.println("SLNO  "+param1);

		String id[] = param1.split(":");
		System.out.println("ID IS "+id[0]); 

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
					else if (filename[1].equalsIgnoreCase("txt")) 
						{
							response.setContentType("gif");
						}
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
						empViewForm.setMessage(message);*/
					}
				}
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
			      
			  return mapping.findForward("displayReport1");
			 }
}
	
