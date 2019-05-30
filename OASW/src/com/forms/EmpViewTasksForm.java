package com.forms;

import java.util.Date;

import org.apache.struts.action.ActionForm;

public class EmpViewTasksForm extends ActionForm {

	private static final long serialVersionUID = 1L;
	private String taskNo;
	private String idTaskNo;
	private String idTaskNo1;
	private String taskName;
	private String assignDate;
	private String targetDate;
	private String aboutTask;
	private String assignedBy;
	private Date date1;
	private Date date2;
	private String message;
	private String userNameData;
	private String passwordData;
	private String companyname;
	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
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

	public String getIdTaskNo1() {
		return idTaskNo1;
	}

	public void setIdTaskNo1(String idTaskNo1) {
		this.idTaskNo1 = idTaskNo1;
	}

	public String getTaskNo() {
		return taskNo;
	}

	public void setTaskNo(String taskNo) {
		this.taskNo = taskNo;
	}

	public Date getDate1() {
		return date1;
	}

	public void setDate1(Date date1) {
		this.date1 = date1;
	}

	public Date getDate2() {
		return date2;
	}

	public void setDate2(Date date2) {
		this.date2 = date2;
	}

	public String getIdTaskNo() {
		return idTaskNo;
	}

	public void setIdTaskNo(String idTaskNo) {
		this.idTaskNo = idTaskNo;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public String getAssignDate() {
		return assignDate;
	}

	public void setAssignDate(String assignDate) {
		this.assignDate = assignDate;
	}

	public String getTargetDate() {
		return targetDate;
	}

	public void setTargetDate(String targetDate) {
		this.targetDate = targetDate;
	}

	public String getAboutTask() {
		return aboutTask;
	}

	public void setAboutTask(String aboutTask) {
		this.aboutTask = aboutTask;
	}

	public String getAssignedBy() {
		return assignedBy;
	}

	public void setAssignedBy(String assignedBy) {
		this.assignedBy = assignedBy;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}