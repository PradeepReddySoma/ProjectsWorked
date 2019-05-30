package com.actions;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import com.dbUtil.DBUtil;
import com.forms.WebApplicationForm;

public class WebApplicationAction extends DispatchAction {
	public ActionForward display(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response){
		WebApplicationForm webApplicationForm = (WebApplicationForm) form;
		HttpSession session = request.getSession();
		String com=(String) session.getAttribute("companyname");
		webApplicationForm.setUnit(com);
		Connection con = DBUtil.openConnection();
		ResultSet rs = null;
		Statement stmt = null;
		String projectCategory = webApplicationForm.getProjectCategory();
		String Sql = "SELECT * FROM WEB_APPLICATIONS WHERE PROJECT_CATEGORY = '"+projectCategory+"' ORDER BY WEB_ID";
		ArrayList a = new ArrayList();

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(Sql);
			while (rs.next()) {
				
				/*webApplicationForm.setDate1(rs.getDate("CREATE_DATE"));
				String dt1 = "";
				DateFormat dateFormat1 = new SimpleDateFormat("dd/MM/yyyy");
				dt1 = dateFormat1.format(webApplicationForm.getDate1());
				webApplicationForm.setCreateDate1(dt1);*/
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		//request.setAttribute("resultswebapp", a);
		return mapping.findForward("display");
	}
	
	public ActionForward projectDetails(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws SQLException{
		WebApplicationForm webApplicationForm = (WebApplicationForm) form;
		HttpSession session = request.getSession();
		Connection con = DBUtil.openConnection();
		Statement stmt = null;
		ResultSet rs = null;
		stmt = con.createStatement();
		String password="";
		ArrayList al =(ArrayList)session.getAttribute("empDetails");
		String empName = (String)al.get(1);
		String projectName = webApplicationForm.getProjectName();
		String projectDetails = webApplicationForm.getProjectDetails();
		String userId = webApplicationForm.getUserId();
		password = webApplicationForm.getPassword();
		String unit = webApplicationForm.getUnit();
		encode(password, form, request);
		//System.out.println("Encrypted Password----------"+password);
		String pwd = (String) session.getAttribute("str");
		//System.out.println("pwd-------------"+pwd);
		String createDate = webApplicationForm.getCreateDate();
		String projectCategory = webApplicationForm.getProjectCategory();
		
		try {
			String sql = "INSERT INTO WEB_APPLICATIONS (PROJECT_NAME,PROJECT_CATEGORY,PROJECT_DETAILS,USERNAME,PASS_WORD,CREATE_DATE,USER_DATA,WEB_ID,UNIT)VALUES "
					+ " ('"
					+ projectName
					+ "','"
					+ projectCategory
					+ "','"
					+ projectDetails
					+ "','"
					+ userId
					+ "','"
					+ pwd
					+ "',to_date('"
					+ createDate
					+ "','DD/MM/YYYY'),'"
					+ empName + "',WEB_ID_SEQ.nextval,'"+unit+"')";
			System.out.println("sql isssssssssss--111111111-->" + sql);
			int j = stmt.executeUpdate(sql);
			if (j > 0) {
				webApplicationForm.setProjectCategory("");
				webApplicationForm.setProjectName("");
				webApplicationForm.setProjectDetails("");
				webApplicationForm.setUserId("");
				webApplicationForm.setPassword("");
				webApplicationForm.setCreateDate("");
				webApplicationForm.setMessage("Insertion Successfull");
			}
			else {
				webApplicationForm.setMessage("Insertion Unsuccessfull");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mapping.findForward("display");
	}
	
	private String encode(String str, ActionForm form, HttpServletRequest request) {
	    BASE64Encoder encoder = new BASE64Encoder();
	    HttpSession session = request.getSession();
	    str = new String(encoder.encodeBuffer(str.getBytes()));
	    //System.out.println("password value------------"+str);
	    session.setAttribute("str", str);
	    return str;
	}

	public ActionForward displayprojectDetails(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		WebApplicationForm webApplicationForm = (WebApplicationForm) form;

		HttpSession session = request.getSession();
		String com=(String) session.getAttribute("companyname");	
		Connection con = DBUtil.openConnection();
		ResultSet rs = null;
		Statement stmt = null;
		String projectCategory = webApplicationForm.getProjectCategory();
		String Sql = "SELECT * FROM WEB_APPLICATIONS WHERE PROJECT_CATEGORY = '"+projectCategory+"' AND UNIT = '"+com+"' ORDER BY WEB_ID";
		ArrayList a = new ArrayList();

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(Sql);
			while (rs.next()) {
				webApplicationForm = new WebApplicationForm();
				webApplicationForm.setProjectCategory1(rs.getString("PROJECT_CATEGORY"));
				webApplicationForm.setProjectName1(rs.getString("PROJECT_NAME"));
				webApplicationForm.setProjectDetails1(rs.getString("PROJECT_DETAILS"));
				webApplicationForm.setUserName1(rs.getString("USERNAME"));
				
				String value = rs.getString("PASS_WORD");
				decode(value, form, request);
				//System.out.println("Encrypted Password----------"+value);
				String pwd = (String) session.getAttribute("str");
				//System.out.println("pwd-------------"+pwd);
				webApplicationForm.setPassword1(pwd);
				
				webApplicationForm.setDate1(rs.getDate("CREATE_DATE"));
				String dt1 = "";
				DateFormat dateFormat1 = new SimpleDateFormat("dd/MM/yyyy");
				dt1 = dateFormat1.format(webApplicationForm.getDate1());
				webApplicationForm.setCreateDate1(dt1);
				
				webApplicationForm.setWebId("Delete:" +rs.getString("WEB_ID"));
				a.add(webApplicationForm);
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("resultswebapp", a);
		return mapping.findForward("display");
	}
	
	private String decode(String str, ActionForm form, HttpServletRequest request) {
	    BASE64Decoder decoder = new BASE64Decoder();
	    HttpSession session = request.getSession();
	    try {
	        str = new String(decoder.decodeBuffer(str));
	        //System.out.println("decrypt value------------"+str);
		    session.setAttribute("str", str);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }       
	    return str;
	}
	
	public ActionForward deleteUmRow(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		WebApplicationForm webApplicationForm = (WebApplicationForm) form;
		String param1 = request.getParameter("webId");
		String id[] = param1.split(":");
		String webId = id[1].trim();

		HttpSession session = request.getSession();
		Connection con = DBUtil.openConnection();
		Statement stmt = null;
		
		String Sql = "DELETE FROM WEB_APPLICATIONS WHERE WEB_ID like '" + webId + "'";
		stmt = con.createStatement();
		int i = stmt.executeUpdate(Sql);
		if (i > 0) {
			webApplicationForm.setMessage("Deleted " + i + " rows from Web Applications");
		} else {
			webApplicationForm.setMessage("No rows Deleted ");
		}
		stmt.close();
		con.close();
		return mapping.findForward("display");
	}
}