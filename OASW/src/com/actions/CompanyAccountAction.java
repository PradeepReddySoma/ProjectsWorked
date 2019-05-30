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
import com.forms.Accountant1Form;
import com.forms.AccountantForm;
import com.forms.CompanyAccountForm;

/** 
 * MyEclipse Struts
 * Creation date: 10-08-2016
 * 
 * XDoclet definition:
 * @struts.action path="/companyAccount" name="companyAccountForm" input="/jsp/companyAccount.jsp" parameter="method" scope="request" validate="true"
 */
public class CompanyAccountAction extends DispatchAction {
	
	public ActionForward display(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		CompanyAccountForm companyAccountForm = (CompanyAccountForm) form;// TODO Auto-generated method stub
		return mapping.findForward("display");
	}
	public ActionForward accsub(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws SQLException {
		CompanyAccountForm companyAccountForm = (CompanyAccountForm) form;
		
		String name = companyAccountForm.getName();
		String accnumber = companyAccountForm.getAcc();
		String code = companyAccountForm.getCode();
		String address = companyAccountForm.getAddress();
		String unit=companyAccountForm.getUnit();
		String year=companyAccountForm.getYear();
		
		System.out.println("Bank name is  "+name+" Account Number "+accnumber+" code "+code+" Address "+address);
		
		Connection con = DBUtil.openConnection();
		Statement stmt = con.createStatement();
		ResultSet rs=null;
		
		String sql = "INSERT INTO COMPANYACCOUNT VALUES('"+unit+"','"+year+"','"+name+"','"+accnumber+"','"+code+"','"+address+"')";
		stmt.executeUpdate(sql);
		
		
		request.setAttribute("msg"," data inserted successfully ");

		
		return mapping.findForward("display");
	}
	
	public ActionForward accountDetails(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		CompanyAccountForm companyAccountForm = (CompanyAccountForm) form;// TODO Auto-generated method stub
		
			HttpSession session = request.getSession();
			Connection con = DBUtil.openConnection();
			ResultSet rs = null;
			Statement stmt = null;
			String Sql = "SELECT * FROM COMPANYACCOUNT";
			ArrayList a = new ArrayList();

			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(Sql);
				while (rs.next()) {
					CompanyAccountForm ac=new CompanyAccountForm();
					ac.setUnit1(rs.getString(1));
					ac.setYear1(rs.getString(2));
					ac.setName1(rs.getString(3));
					ac.setAcc1(rs.getString(4));
					ac.setCode1(rs.getString(5));
					ac.setAddress1(rs.getString(6));
					
					a.add(ac);
				}
				rs.close();
				stmt.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("empmaster", a);
			
			System.out.println(a);
	
		return mapping.findForward("display");
	}
	
}