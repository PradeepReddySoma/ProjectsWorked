package com.forms;

import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.upload.CommonsMultipartRequestHandler;
import org.apache.struts.upload.FormFile;
import org.apache.struts.upload.MultipartRequestWrapper;

public class ClientPaymentForm extends ActionForm {
	private String slno12;
	private String date12;
	private String project;
	private String invoice12;
	private String invoice;
	private String amount12;

	private String type;
	private String year;
	private String userNameData;
	private String passwordData;
	private String message;
	private String companyname;
	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	private String slno121;
	private String date121;
	private String project1;
	private String invoice121;
	private String invoice1;
	private String amount121;
	private String fromdate;
	private String todate;
	private String unit;
	private String unit1;
	private String unit2;
	private FormFile file12;
	private String year1;
	private String accnumber;

	public String getAccnumber() {
		return accnumber;
	}

	public void setAccnumber(String accnumber) {
		this.accnumber = accnumber;
	}

	public String getYear1() {
		return year1;
	}

	public void setYear1(String year1) {
		this.year1 = year1;
	}

	public FormFile getFile12() {
		return file12;
	}

	public void setFile12(FormFile file12) {
		this.file12 = file12;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getUnit1() {
		return unit1;
	}

	public void setUnit1(String unit1) {
		this.unit1 = unit1;
	}

	public String getUnit2() {
		return unit2;
	}

	public void setUnit2(String unit2) {
		this.unit2 = unit2;
	}

	public String getFromdate() {
		return fromdate;
	}

	public void setFromdate(String fromdate) {
		this.fromdate = fromdate;
	}

	public String getTodate() {
		return todate;
	}

	public void setTodate(String todate) {
		this.todate = todate;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	private String type1;

	public String getSlno121() {
		return slno121;
	}

	public void setSlno121(String slno121) {
		this.slno121 = slno121;
	}

	public String getDate121() {
		return date121;
	}

	public void setDate121(String date121) {
		this.date121 = date121;
	}

	public String getProject1() {
		return project1;
	}

	public void setProject1(String project1) {
		this.project1 = project1;
	}

	public String getInvoice121() {
		return invoice121;
	}

	public void setInvoice121(String invoice121) {
		this.invoice121 = invoice121;
	}

	public String getInvoice1() {
		return invoice1;
	}

	public void setInvoice1(String invoice1) {
		this.invoice1 = invoice1;
	}

	public String getAmount121() {
		return amount121;
	}

	public void setAmount121(String amount121) {
		this.amount121 = amount121;
	}

	public String getType1() {
		return type1;
	}

	public void setType1(String type1) {
		this.type1 = type1;
	}

	public String getSlno12() {
		return slno12;
	}

	public void setSlno12(String slNo1) {
		this.slno12 = slNo1;
	}

	public String getDate12() {
		return date12;
	}

	public void setDate12(String date12) {
		this.date12 = date12;
	}

	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
	}

	public String getInvoice12() {
		return invoice12;
	}

	public void setInvoice12(String invoice12) {
		this.invoice12 = invoice12;
	}

	public String getInvoice() {
		return invoice;
	}

	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}

	public String getAmount12() {
		return amount12;
	}

	public void setAmount12(String amount12) {
		this.amount12 = amount12;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUserNameData() {
		return userNameData;
	}

	public void setUserNameData(String userNameData) {
		this.userNameData = userNameData;
	}

	public String getPasswordData() {
		return passwordData;
	}

	public void setPasswordData(String passwordData) {
		this.passwordData = passwordData;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	
}
