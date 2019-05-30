package com.actions;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.dbUtil.DBUtil;
import com.forms.ForgotPasswordForm;

public class ForgotPasswordAction extends DispatchAction {
	public ActionForward display(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ForgotPasswordForm forgotPasswordForm = (ForgotPasswordForm) form;

		return mapping.findForward("display");
	}
	
	public ActionForward getPassword(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ForgotPasswordForm forgotPasswordForm = (ForgotPasswordForm) form;
		String field = forgotPasswordForm.getField();
		String userName = forgotPasswordForm.getUsername();
		String email = forgotPasswordForm.getEmail();
		
		Connection con = DBUtil.openConnection();
		Statement stmt = null;
		ResultSet rs = null;
		stmt = con.createStatement();
		
		if(field.equalsIgnoreCase("username")){
			forgotPasswordForm.setEmail("");
			forgotPasswordForm.setYourPassword("");
			String sql = "SELECT * FROM EMPLOYEES WHERE USERNAME='" + userName + "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				forgotPasswordForm.setYourPassword(rs.getString("PASS_WORD"));
			}
			else{
				forgotPasswordForm.setMessage("Please enter valid username");
			}
		}
		
		else if(field.equalsIgnoreCase("email")){
			forgotPasswordForm.setUsername("");
			forgotPasswordForm.setYourPassword("");
			String sql = "SELECT * FROM EMPLOYEES WHERE EMAIL_ID='" + email + "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				forgotPasswordForm.setYourPassword(rs.getString("PASS_WORD"));
				forgotPasswordForm.setUsername(rs.getString("USERNAME"));
			}
			else{
				forgotPasswordForm.setMessage("Please enter valid E-Mail ID");
			}
		}
		
		DBUtil.closeResultSet(rs);
		DBUtil.closeStatement(stmt);
		DBUtil.closeConnection(con);
		return mapping.findForward("display");
	}
}
