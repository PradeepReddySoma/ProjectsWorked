package com.forms;

import java.util.Date;
import java.util.Vector;

import org.apache.struts.action.ActionForm;

public class UserMngmentForm extends ActionForm {

	private static final long serialVersionUID = 1L;
	private String message;
	private String empId;
	private String empName;
	private String userName;
	private String pwd;
	private String confirmPwd;
	private String dept;
	private String desg;
	private String contactNo;
	private String emailId;
	private String createDate;
	private String remarks;
	private String userRole;
	private String passwordHint;
	private String companyname;

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	private String empId1;
	private String empName1;
	private String userName1;
	private String contactNo1;
	private String emailId1;
	private String desg1;
	private String userRole1;
	private String createDate1;
	private Date date1;

	private String userNameData;
	private String passwordData;
   private String unit;
	public String getUnit() {
	return unit;
}

public void setUnit(String unit) {
	this.unit = unit;
}

	Vector empNameList;

	public Vector getEmpNameList() {
		return empNameList;
	}

	public void setEmpNameList(Vector empNameList) {
		this.empNameList = empNameList;
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

	public Date getDate1() {
		return date1;
	}

	public void setDate1(Date date1) {
		this.date1 = date1;
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

	public String getUserName1() {
		return userName1;
	}

	public void setUserName1(String userName1) {
		this.userName1 = userName1;
	}

	public String getContactNo1() {
		return contactNo1;
	}

	public void setContactNo1(String contactNo1) {
		this.contactNo1 = contactNo1;
	}

	public String getEmailId1() {
		return emailId1;
	}

	public void setEmailId1(String emailId1) {
		this.emailId1 = emailId1;
	}

	public String getDesg1() {
		return desg1;
	}

	public void setDesg1(String desg1) {
		this.desg1 = desg1;
	}

	public String getUserRole1() {
		return userRole1;
	}

	public void setUserRole1(String userRole1) {
		this.userRole1 = userRole1;
	}

	public String getCreateDate1() {
		return createDate1;
	}

	public void setCreateDate1(String createDate1) {
		this.createDate1 = createDate1;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getPasswordHint() {
		return passwordHint;
	}

	public void setPasswordHint(String passwordHint) {
		this.passwordHint = passwordHint;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getConfirmPwd() {
		return confirmPwd;
	}

	public void setConfirmPwd(String confirmPwd) {
		this.confirmPwd = confirmPwd;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getDesg() {
		return desg;
	}

	public void setDesg(String desg) {
		this.desg = desg;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
}