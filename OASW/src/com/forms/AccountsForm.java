package com.forms;

import org.apache.struts.action.ActionForm;

public class AccountsForm extends ActionForm{

	
	private static final long serialVersionUID = 1L;
private String message;
private String year;

private String userNameData;
private String passwordData;
private String companyname;
public String getCompanyname() {
	return companyname;
}
public void setCompanyname(String companyname) {
	this.companyname = companyname;
}
public static long getSerialversionuid() {
	return serialVersionUID;
}
private String type;

public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getYear() {
	return year;
}
public void setYear(String year) {
	this.year = year;
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
