package com.forms;

import org.apache.struts.action.ActionForm;

public class EmployeeMaster extends ActionForm {

	private static final long serialVersionUID = 1L;
	private String empId;
	private String empName;
	private String desg;
	private String dept;
	private String message;

	private String empId1;
	private String empName1;
	private String department1;
	private String designation1;

	private String userNameData;
	private String passwordData;
	private String account;
	private String account1;
	private String companyname;
public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

private String unit;	

	public String getUnit() {
	return unit;
}

public void setUnit(String unit) {
	this.unit = unit;
}

	public String getAccount1() {
		return account1;
	}

	public void setAccount1(String account1) {
		this.account1 = account1;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
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

	public String getEmpId1() {
		return empId1;
	}

	public void setEmpId1(String empId1) {
		this.empId1 = empId1;
	}

	public String getEmpName1() {
		return empName1;
	}

	public void setEmpName1(String empName1) {
		this.empName1 = empName1;
	}

	public String getDepartment1() {
		return department1;
	}

	public void setDepartment1(String department1) {
		this.department1 = department1;
	}

	public String getDesignation1() {
		return designation1;
	}

	public void setDesignation1(String designation1) {
		this.designation1 = designation1;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getDesg() {
		return desg;
	}

	public void setDesg(String desg) {
		this.desg = desg;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}