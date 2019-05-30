package com.actions;

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

import com.dbUtil.DBUtil;
import com.forms.ChangePwdForm;

public class EmpChangePwdAction extends DispatchAction {
	public ActionForward display(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ChangePwdForm pwdForm = (ChangePwdForm) form;
		HttpSession session = request.getSession();
		ArrayList al =(ArrayList)session.getAttribute("empDetails");
		String username = (String)al.get(1);
		System.out.println("username------"+username);
		pwdForm.setUserName(username);
		return mapping.findForward("display");
	}  
	
	public ActionForward submitChangePwd(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ChangePwdForm changePasswordForm = (ChangePwdForm) form;
		HttpSession session = request.getSession();
		
		Connection con = DBUtil.openConnection();
		Statement stmt = null;
		ResultSet rs = null;
		stmt = con.createStatement();
		
		ArrayList al =(ArrayList)session.getAttribute("empDetails");
		String epass = "";
		String empid = (String)al.get(0); 
		String userName = changePasswordForm.getUserName();
		String password = changePasswordForm.getExistingPwd();
		String newPassword = changePasswordForm.getNewPwd();
		String confirmPassword = changePasswordForm.getConfirmPwd();
		
		String sql = "SELECT PASS_WORD FROM EMPLOYEES WHERE EMP_ID='"+ empid + "'";
		try {
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				epass = rs.getString("PASS_WORD");
				//System.out.println("E PASS-----" + epass);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (epass.equals(password)) {

			if (newPassword.equals(confirmPassword)) {
				//System.out.println("UPDATING............");
				sql = "UPDATE EMPLOYEES SET PASS_WORD='" + newPassword + "',USERNAME='" + userName + "' WHERE EMP_ID='" + empid + "'";
				stmt.executeQuery(sql);
				String sql1 = "UPDATE USER_MANAGEMENT SET PASS_WORD='" + newPassword + "',USERNAME='" + userName + "',CONFIRM_PWD='"+confirmPassword+"' WHERE EMP_ID='" + empid + "'";
				stmt.executeQuery(sql1);
				changePasswordForm.setExistingPwd("");
				changePasswordForm.setNewPwd("");
				changePasswordForm.setConfirmPwd("");
				request.setAttribute("msg1"," Password has been Updated Successfully ");
				//changePasswordForm.setMessage("Password has been Updated Successfully");
			} else {
				request.setAttribute("msg2","The New Password and Confirm Password do not match");

				//changePasswordForm.setMessage("The New Password and Confirm Password do not match");
			}
		} else {
			request.setAttribute("msg3"," The Existing Password You entered is Wrong!");

			/*String message = "The Existing Password You entered is Wrong!";
			changePasswordForm.setMessage(message);*/
		}
		stmt.close();
		con.close();
		return mapping.findForward("display");
	}
}
