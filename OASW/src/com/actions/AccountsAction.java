package com.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.forms.AccountsForm;

public class AccountsAction extends DispatchAction{
	
	public ActionForward display(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		AccountsForm accounts = (AccountsForm) form;// TODO Auto-generated method stub
		return mapping.findForward("display");
	}
	public ActionForward accountant(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		AccountsForm accounts = (AccountsForm) form;// TODO Auto-generated method stub
		
		System.out.println("coming here........");
		String type=accounts.getType();
		
			
		return mapping.findForward("slno");
		
	}
	public ActionForward accountant1(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		AccountsForm accounts = (AccountsForm) form;// TODO Auto-generated method stub
		
		System.out.println("coming here........");
		
		return mapping.findForward("accountant1234");
		
	}
	
}
	

