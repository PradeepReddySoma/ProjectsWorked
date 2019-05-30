package com.actions;

import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.upload.FormFile;

import com.dbUtil.DBUtil;
import com.forms.AccountantForm;
import com.forms.AdminaccountForm;
import com.forms.ClientPaymentForm;

public class ClientPaymentAction extends DispatchAction{
	
	public ActionForward display(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ClientPaymentForm client = (ClientPaymentForm) form;
		HttpSession session = request.getSession();
		

		System.out.println("control in display");
		 String com=(String) session.getAttribute("companyname");
		 
		 client.setUnit(com);
		Connection con = DBUtil.openConnection();
		ResultSet rs = null;
		Statement stmt = con.createStatement();
		
	
		/*int count = 1;
		int count1 = 1;
       while (rs.next()) {
            int slNo = rs.getInt("SLNO");
           System.out.println("slno is "+slNo);
           count++;
           count1=count;
           
            
        }
       int n = count1++; 
       client.setSlno12(n);
       System.out.println("slno is"+n);
		*/
			if(com.equalsIgnoreCase("IngroInfo Software Solutions pvt ltd."))
	        { 
				String Sql = "SELECT * FROM CLIENTPAYMENT WHERE SLNO LIKE 'Admin_I%' ORDER BY SLNO ASC";
				rs = stmt.executeQuery(Sql);
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
			    client.setSlno12(completeNewVersion);
	        }
	        else {
	        	String Sql = "SELECT * FROM CLIENTPAYMENT WHERE SLNO LIKE 'Admin_R%' ORDER BY SLNO ASC";
	    		rs = stmt.executeQuery(Sql);
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
	    		    client.setSlno12(completeNewVersion);
			}
			    
			    
		return mapping.findForward("display");
		}
	
	
	public ActionForward clientpay(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ClientPaymentForm client = (ClientPaymentForm) form;
		
		System.out.println("inside method");
		
		System.out.println("inside method");
		HttpSession session = request.getSession();
		try {
			// file upload
			// FileUploadForm fileUploadForm = (FileUploadForm)form;
			FormFile file = client.getFile12();
			
			System.out.println("file---------------"+file);
			// Get the servers upload directory real path name
			// String filePath=getServlet().getServletContext().getRealPath("/")
			// +"upload";
			String filePath = "C:\\OASW\\CLIENT";
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
				
					String app = "FILE";
					newFile.renameTo(new File("C:\\OASW\\CLIENT\\"  + client.getSlno12() +  "." + getExtension));
					request.setAttribute("uploadedFilePath", newFile.getAbsoluteFile());
					request.setAttribute("uploadedFileName", newFile.getName());
				}
			} else {

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String slno = client.getSlno12();
		String date = client.getDate12();
		String project = client.getProject();
		String invoice = client.getInvoice12();
		String invoiceamount = client.getInvoice();
		String paymode=client.getType();
		String chequeno = client.getAmount12();
		String unit=client.getUnit();
		String year=client.getYear();
		String accnumber=client.getAccnumber();
		
		
		
		
		System.out.println("slno "+slno+" date "+date+" project "+project+" invoice number "+invoice+" cheque number "+chequeno+" invoiceamount "+invoiceamount+" PaymentType "+paymode+"Account number is"+accnumber+"unit is "+unit+" year is  "+year);
		
		Connection con = DBUtil.openConnection();
		Statement stmt = con.createStatement();
		ResultSet rs=null;
		String Sql1 = "SELECT * FROM CLIENTPAYMENT ORDER BY ID ASC";
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
	    
		String sql = "INSERT INTO CLIENTPAYMENT VALUES('"+slno+"',TO_DATE('"+date+"','DD/MM/YYYY'),'"+project+"','"+invoice+"','"+invoiceamount+"','"+paymode+"','"+chequeno+"','"+unit+"','"+year+"','"+accnumber+"','"+num+"')";
		stmt.executeUpdate(sql);
		 
		
		request.setAttribute("msg"," data inserted successfully ");

		
		/*
		int count = 1;
		int count1 = 1;
       while (rs.next()) {
            int slNo = rs.getInt("SLNO");
           System.out.println("slno is "+slNo);
           count++;
           count1=count;
           
            
        }
       int n = count1++; 
       client.setSlno12(n);*/
		
		 String com=(String) session.getAttribute("companyname");

		if(com.equalsIgnoreCase("IngroInfo Software Solutions pvt ltd."))
        { 
			String Sql = "SELECT * FROM CLIENTPAYMENT WHERE SLNO LIKE 'Admin_I%' ORDER BY SLNO DESC";
			rs = stmt.executeQuery(Sql);
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
		    client.setSlno12(completeNewVersion);
        }
        else {
        	String Sql = "SELECT * FROM CLIENTPAYMENT WHERE SLNO LIKE 'Admin_R%' ORDER BY SLNO DESC";
    		rs = stmt.executeQuery(Sql);
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
    		    client.setSlno12(completeNewVersion);
		}
		    
        
        client.setDate12("");
		client.setProject("");
		client.setInvoice("");
		client.setAmount12("");
		client.setInvoice12("");
	client.setType("");

		client.setInvoice("");
		client.setAccnumber("");

        DBUtil.closeStatement(stmt);
		DBUtil.closeConnection(con);

		
		return mapping.findForward("display");
	

}
	public ActionForward show3(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ClientPaymentForm client = (ClientPaymentForm) form;
		String fromdate=client.getFromdate();
		String todate=client.getTodate();
		String unit1=client.getUnit1();
		
		System.out.println("from date is "+fromdate+" to date is  "+todate+"unit is "+unit1);
		
		HttpSession session = request.getSession();
		Connection con = DBUtil.openConnection();
		ResultSet rs = null;
		Statement stmt = null;
		String Sql = "SELECT * FROM CLIENTPAYMENT WHERE  (DATEOFPAY BETWEEN '"+fromdate+"' AND '"+todate+"') AND (UNIT='"+unit1+"') ";
		ArrayList a = new ArrayList();

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(Sql);
			while (rs.next()) {
				ClientPaymentForm cl=new ClientPaymentForm();
				cl.setSlno121(rs.getString(1));
				cl.setDate121(rs.getString(2));
				cl.setProject1(rs.getString(3));
				cl.setInvoice121(rs.getString(4));
				cl.setInvoice1(rs.getString(5));
				cl.setAmount121(rs.getString(6));
				cl.setType1(rs.getString(7));
				cl.setUnit2(rs.getString(8));
				cl.setYear1(rs.getString(9));
				
				
				a.add(cl);
				
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("empmaster", a);
		return mapping.findForward("display");
	}
	
}
