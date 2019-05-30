package com.actions;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
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
import org.apache.struts.upload.FormFile;

import com.dbUtil.DBUtil;
import com.forms.Accountant1Form;
import com.forms.AdminaccountForm;
import com.forms.HistoryForm;


public class AdminAccountAction extends DispatchAction {
	public ActionForward display(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session = request.getSession();
		 String com=(String) session.getAttribute("companyname"); 
		AdminaccountForm admin = (AdminaccountForm) form;
		System.out .println("control in display");
				admin.setUnit(com);
		Connection con = DBUtil.openConnection(); 
		ResultSet rs = null;
		Statement stmt = con.createStatement();
		String unit1 = admin.getUnit();
        
   if(com.equalsIgnoreCase("IngroInfo Software Solutions pvt ltd."))
        { 
		String Sql = "SELECT * FROM ADMINACCOUNT WHERE SLNO LIKE 'Admin_I%' ORDER BY SLNO ASC";
		rs = stmt.executeQuery(Sql);
		int count = 1;
		int count1 = 1;
		while (rs.next()) { 
			 String oldVersion = rs.getString("SLNO");
			 String version = oldVersion; 
			 System.out.println("string"+version);
	        count++;
		    String[] splitString = version.split("-");
		    System.out.println("String is"+splitString[0]);
		    System.out.println("int"+splitString[1]);
		   String[] split = splitString[0].split("~"); 
		    System.out.println("String is"+split);

		    //int newVersion = Integer.valueOf(splitString[1])+1;
		    count1=count;
		}
           int newVersion = count1++;
		 String completeNewVersion = "Admin_IGI-" + newVersion;
		    System.out.print(completeNewVersion);
		    admin.setSlno(completeNewVersion);
        }
        else {
        	String Sql = "SELECT * FROM ADMINACCOUNT WHERE SLNO LIKE 'Admin_R%' ORDER BY SLNO ASC";
    		rs = stmt.executeQuery(Sql);
    		int count = 1;
    		int count1 = 1;
    		while (rs.next()) {
    			 String oldVersion = rs.getString("SLNO");
    			 String version = oldVersion; 
    			 System.out.println("string"+version);
    		 
    				count++;
    		    String[] splitString = version.split("-");
    		    System.out.println("String is"+splitString[0]);
    		    System.out.println("int"+splitString[1]);
    		   String[] split = splitString[0].split("~"); 
    		    System.out.println("String is"+split);

    		    //int newVersion = Integer.valueOf(splitString[1])+1;
    		    count1=count;
    		}
               int newVersion = count1++;
    		 String completeNewVersion = "Admin_RK-" + newVersion;
    		    System.out.print(completeNewVersion);
    		    admin.setSlno(completeNewVersion);
		}
		return mapping.findForward("display"); 
}
	public ActionForward adminAc(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		AdminaccountForm adminaccountForm = (AdminaccountForm) form;
		
		System.out.println("inside method");
		Connection con = DBUtil.openConnection();
		ResultSet rs = null;
		Statement stmt = con.createStatement();
		
		HttpSession session = request.getSession();
		try {
			// file upload
			// FileUploadForm fileUploadForm = (FileUploadForm)form;
			FormFile file = adminaccountForm.getFile();
			
			System.out.println("file---------------"+file);
			// Get the servers upload directory real path name
			// String filePath=getServlet().getServletContext().getRealPath("/")
			// +"upload";
			String filePath = "C:\\OASW\\ADMIN";
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
					System.out.println("filename "+fileName);

					System.out.println("Server path:" + filePath);
					System.out.println("filename "+fileName);

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
				
					String app = "FILE";
					newFile.renameTo(new File("C:\\OASW\\ADMIN\\"  + adminaccountForm.getSlno() +  "." + getExtension));
					request.setAttribute("uploadedFilePath", newFile.getAbsoluteFile());
					request.setAttribute("uploadedFileName", newFile.getName());
				}
			} else {

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String Sql1 = "SELECT * FROM ADMINACCOUNT ORDER BY ID ASC";
		rs = stmt.executeQuery(Sql1);
		int count2 = 1;
		int count3 = 1;
		while (rs.next()) {
			 String oldVersion = rs.getString("ID");
			 String version = oldVersion; 
			 System.out.println("string"+version);
		 
				
				count2++;
				 count3=count2;
				 
		}
		int num = count3++;
		
	    System.out.print(num);
	    
	    DateFormat dateFormat1 = new SimpleDateFormat("MM");
		Date date1 = new Date();
		String str1 = dateFormat1.format(date1);
		System.out.println("MONTH IS"+str1);
	
		String slno = adminaccountForm.getSlno(); 
		String date = adminaccountForm.getDate();
		String particulars = adminaccountForm.getParticulars();
		String invoice = adminaccountForm.getInvoice();
		String amount = adminaccountForm.getAmount();
		String for1 = adminaccountForm.getFor1();
		String transaction = adminaccountForm.getTransaction();
		String remarks = adminaccountForm.getRemarks();
		String process=adminaccountForm.getProcess();
		String unit=adminaccountForm.getUnit();
		String year=adminaccountForm.getYear();

		System.out.println("slno "+slno+" date "+date+" particulars "+particulars+" invoice number "+invoice+" cash/cheque number "+amount+" For1 "+for1+" Type of paymode "+transaction+" remarks "+remarks+" process "+process+"unit is "+unit+" year is "+year+"NUM IS"+num);

		String sql = "INSERT INTO ADMINACCOUNT VALUES('"+slno+"',TO_DATE('"+date+"','DD/MM/YYYY'),'"+particulars+"','"+invoice+"','"+for1+"','"+transaction+"','"+amount+"','"+remarks+"','"+process+"','"+unit+"','"+year+"','0','"+num+"','"+str1+"')";
		stmt.executeUpdate(sql);

		request.setAttribute("msg"," data inserted successfully ");
		 String com=(String) session.getAttribute("companyname"); 
		 
		
			
		if(com.equalsIgnoreCase("IngroInfo Software Solutions pvt ltd."))
        { 
		String Sql = "SELECT * FROM ADMINACCOUNT WHERE SLNO LIKE 'Admin_I%' ORDER BY SLNO ASC";
		rs = stmt.executeQuery(Sql);
		int count = 1;
		int count1 = 1;
		while (rs.next()) {
			 String oldVersion = rs.getString("SLNO");
			 String version = oldVersion; 
			 System.out.println("string"+version);
	
				count++;
		    String[] splitString = version.split("-");
		    System.out.println("String is"+splitString[0]);
		    System.out.println("int"+splitString[1]);
		   /*String[] split = splitString[0].split("~"); 
		    System.out.println("String is"+split);*/

		    //int newVersion = Integer.valueOf(splitString[1])+1;
		    count1=count;
		}
           int newVersion = count1++;
		 String completeNewVersion = "Admin_IGI-" + newVersion;
		    System.out.print(completeNewVersion);
		    adminaccountForm.setSlno(completeNewVersion);
        }
        else {
        	String Sql = "SELECT * FROM ADMINACCOUNT WHERE SLNO LIKE 'Admin_R%' ORDER BY SLNO ASC";
    		rs = stmt.executeQuery(Sql);
    		int count = 1;
    		int count1 = 1;
    		while (rs.next()) {
    			 String oldVersion = rs.getString("SLNO");
    			 String version = oldVersion; 
    			 System.out.println("string"+version);
    		 
    				
    			count++;
    		    String[] splitString = version.split("-");
    		    System.out.println("String is"+splitString[0]);
    		    System.out.println("int"+splitString[1]);
    		   /*String[] split = splitString[0].split("~"); 
    		    System.out.println("String is"+split);*/

    		    //int newVersion = Integer.valueOf(splitString[1])+1;
    		    count1=count;
    		}
               int newVersion = count1++;
    		 String completeNewVersion = "Admin_RK-" + newVersion;
    		    System.out.print(completeNewVersion);
    		    adminaccountForm.setSlno(completeNewVersion);
		}
		    
		    
		adminaccountForm.setDate("");
		adminaccountForm.setParticulars("");
		adminaccountForm.setInvoice("");
		adminaccountForm.setAmount("");
		adminaccountForm.setRemarks("");
		adminaccountForm.setProcess("");
	
		
	adminaccountForm.setFor1("");
		adminaccountForm.setTransaction("");
		
	
	

		return mapping.findForward("display");
	
	

}
	
	
	public ActionForward submit(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws SQLException {
		AdminaccountForm admin = (AdminaccountForm) form;// TODO Auto-generated method stub
		System.out.println("inside action class");
		Connection con = DBUtil.openConnection();
		System.out.println("connection------"+con);
	     try {
	    	Statement stmt = con.createStatement();
	     
	        String sql = "Select DISTINCT ACCOUNT_FOR From EMPLOYEE_MASTER";
	       
	        ResultSet rs = stmt.executeQuery(sql);
	        ArrayList<String> List1 = new ArrayList<String>();
	        while (rs.next()) {

	            List1.add(rs.getString("ACCOUNT_FOR"));
	            
	      }
	        if( List1!=null){
	         System.out.println("inside if");
	         HttpSession session = request.getSession();
	         session.setAttribute("List",  List1);
	      return mapping.findForward("display");
	      
	        }
	     }catch(Exception e){
	      e.printStackTrace();
	     }
	     
	     return mapping.findForward("display");
	    
	}
	
	
	/*public ActionForward historyhis(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		AdminaccountForm adminaccountForm = (AdminaccountForm) form;
		
		String fromdate=adminaccountForm.getFromdate();
		String todate=adminaccountForm.getTodate();
		String unit1=adminaccountForm.getUnit1();
		
		System.out.println("from date is "+fromdate+" to date is  "+todate+"unit is "+unit1);

		HttpSession session = request.getSession();
		Connection con = DBUtil.openConnection();
		ResultSet rs = null;
		Statement stmt = null;
		String Sql = "SELECT * FROM ADMINACCOUNT WHERE (UNIT='"+unit1+"') AND (DATEOF BETWEEN '"+fromdate+"' AND '"+todate+"') ORDER BY SLNO ASC";
		ArrayList a = new ArrayList();

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(Sql);
			while (rs.next()) {
				AdminaccountForm ad=new AdminaccountForm();
				
				ad.setDate1(rs.getString(2));
				ad.setParticulars1(rs.getString(3));
				ad.setInvoice1(rs.getString(4));
				ad.setFor12(rs.getString(5));
				ad.setAmount1(rs.getString(6));
				ad.setTransaction1(rs.getString(7));
				ad.setRemarks1(rs.getString(8));
				ad.setProcess1(rs.getString(9));
				ad.setUnit12(rs.getString(10));
				ad.setYear1(rs.getString(11));
				a.add(ad);
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("empmaster", a);
		return mapping.findForward("display");
	}*/
}
