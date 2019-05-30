package com.forms;

import java.util.Date;
import java.util.Vector;

import org.apache.struts.action.ActionForm;

public class AdminViewWorkForm extends ActionForm {

	private static final long serialVersionUID = 1L;
	private String empName;
	private String date1;
	private String date2;
	private String message;
	private String taskNo;
	private String taskName;
	private Date assignedDate;
	private String expectedDate;
	private Date targetDate;
	
	public Date getAssignedDate() {
		return assignedDate;
	}

	public void setAssignedDate(Date assignedDate) {
		this.assignedDate = assignedDate;
	}

	public Date getTargetDate() {
		return targetDate;
	}

	public void setTargetDate(Date targetDate) {
		this.targetDate = targetDate;
	}

	private String closedDate;
	private String status;
	private String userNameData;
	private String passwordData;
	private String employeeName;
	private String unit;
	private String companyname;
	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

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

	private Date date11;
	private Date date12;
	private Date date13;

	public Date getDate13() {
		return date13;
	}

	public void setDate13(Date date13) {
		this.date13 = date13;
	}

	public Date getDate11() {
		return date11;
	}

	public void setDate11(Date date11) {
		this.date11 = date11;
	}

	public Date getDate12() {
		return date12;
	}

	public void setDate12(Date date12) {
		this.date12 = date12;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getDate1() {
		return date1;
	}

	public void setDate1(String date1) {
		this.date1 = date1;
	}

	public String getDate2() {
		return date2;
	}

	public void setDate2(String date2) {
		this.date2 = date2;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getTaskNo() {
		return taskNo;
	}

	public void setTaskNo(String taskNo) {
		this.taskNo = taskNo;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	

	public String getExpectedDate() {
		return expectedDate;
	}

	public void setExpectedDate(String expectedDate) {
		this.expectedDate = expectedDate;
	}

	

	public String getClosedDate() {
		return closedDate;
	}

	public void setClosedDate(String closedDate) {
		this.closedDate = closedDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
}