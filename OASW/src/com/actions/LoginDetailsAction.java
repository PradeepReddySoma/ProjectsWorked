package com.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.DAO.OaswDao;
import com.forms.LoginDetails;

public class LoginDetailsAction extends DispatchAction {

	public ActionForward display(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		LoginDetails loginDetails = (LoginDetails) form;
		return mapping.findForward("display");
	} 

	public ActionForward authenticate(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {  
		HttpSession session = request.getSession();
		LoginDetails loginDetails = (LoginDetails) form;
		String a = loginDetails.getRole1();
		System.out.println("value"+a);
		session.setAttribute( "companyname",a);
		System.out.println("value"+a);
		String unit = loginDetails.getRole1();
		int status = OaswDao.authenticate(loginDetails, request);
		if (unit.equalsIgnoreCase("IngroInfo Software Solutions pvt ltd.")) {
		if (status == 1 && loginDetails.getRole().equalsIgnoreCase("Admin")) {
			OaswDao.getEmpInfo(loginDetails, session);
			OaswDao.setEmpIdList(session);
			loginDetails.setUserName("");
			loginDetails.setPassword("");  
			loginDetails.setMessage("incoorect username or password");
			return mapping.findForward("home");    
		}else if (status == 1 && (loginDetails.getRole().equalsIgnoreCase("Developer")|| loginDetails.getRole().equalsIgnoreCase("Supervisor")||loginDetails.getRole().equalsIgnoreCase("MROperator")||loginDetails.getRole().equalsIgnoreCase("Marketing")) ) {
			OaswDao.getEmpInfo(loginDetails, session);
			OaswDao.setEmpIdList(session);
			return mapping.findForward("dev");   
		}
		else if (status == 1  && loginDetails.getRole().equalsIgnoreCase("Accountant")){
			OaswDao.getEmpInfo(loginDetails, session);
			OaswDao.setEmpIdList(session); 
			return mapping.findForward("emp");  
		} 
		
		else if (status == 1  && (loginDetails.getRole().equalsIgnoreCase("FieldOperator")||loginDetails.getRole().equalsIgnoreCase("SeniorManager"))) {
			OaswDao.getEmpInfo(loginDetails, session);
			OaswDao.setEmpIdList(session);
			return mapping.findForward("fo");  
		} 
		/*else if (status == 1  && loginDetails.getRole().equalsIgnoreCase("SeniorManager")) {
			OaswDao.getEmpInfo(loginDetails, session);
			OaswDao.setEmpIdList(session);
			return mapping.findForward("sm");  
		} */
		else {   
			request.setAttribute("msg"," Username or password incorrect ");
			return mapping.findForward("display");
		
		}
		}
		
		else {
			
			if (status == 1 && loginDetails.getRole().equalsIgnoreCase("Admin")) {
				OaswDao.getEmpInfo(loginDetails, session);
				OaswDao.setEmpIdList(session);
				loginDetails.setUserName("");
				loginDetails.setPassword(""); 
				return mapping.findForward("home");    
			}else if (status == 1 && (loginDetails.getRole().equalsIgnoreCase("Supervisor")||loginDetails.getRole().equalsIgnoreCase("Marketing")) ) {
				OaswDao.getEmpInfo(loginDetails, session);
				OaswDao.setEmpIdList(session);
				return mapping.findForward("dev");   
			} 
			else if (status == 1  && loginDetails.getRole().equalsIgnoreCase("Accountant")){
				OaswDao.getEmpInfo(loginDetails, session);
				OaswDao.setEmpIdList(session); 
				return mapping.findForward("emp");  
			} 
			else if (status == 1  && (loginDetails.getRole().equalsIgnoreCase("FieldOperator")||loginDetails.getRole().equalsIgnoreCase("SeniorManager"))){
				OaswDao.getEmpInfo(loginDetails, session);
				OaswDao.setEmpIdList(session);
				return mapping.findForward("fo");  
			} 
			/*else if (status == 1  && loginDetails.getRole().equalsIgnoreCase("SeniorManager")) {
				OaswDao.getEmpInfo(loginDetails, session);
				OaswDao.setEmpIdList(session);
				return mapping.findForward("sm");  
			} */
			else {   
				request.setAttribute("msg"," Username or password incorrect ");
				return mapping.findForward("display");
				
			}
		}
	}
	
	public ActionForward logout(ActionMapping mapping, ActionForm form,
				HttpServletRequest request, HttpServletResponse response)
				throws Exception {  
			HttpSession session = request.getSession();
			LoginDetails loginDetails = (LoginDetails) form;
		
			  return mapping.findForward("failure");
		}

}