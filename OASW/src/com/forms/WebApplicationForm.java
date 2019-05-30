package com.forms;

import java.util.Date;

import org.apache.struts.action.ActionForm;

public class WebApplicationForm extends ActionForm {

	private static final long serialVersionUID = 1L;
	private String message;
	private String projectCategory;
	private String projectName;
	private String projectDetails;
	private String userId;
	private String password;
	private String createDate;
	private String companyname;
	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	private String webId;
	private String projectCategory1;
	private String projectName1;
	private String projectDetails1;
	private String userName1;
	private String password1;
	private String createDate1;

	private String userNameData;
	private String passwordData;
	private Date date1;
	private String unit;

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Date getDate1() {
		return date1;
	}

	public void setDate1(Date date1) {
		this.date1 = date1;
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

	public String getProjectCategory() {
		return projectCategory;
	}

	public void setProjectCategory(String projectCategory) {
		this.projectCategory = projectCategory;
	}

	public String getProjectCategory1() {
		return projectCategory1;
	}

	public void setProjectCategory1(String projectCategory1) {
		this.projectCategory1 = projectCategory1;
	}

	public String getWebId() {
		return webId;
	}

	public void setWebId(String webId) {
		this.webId = webId;
	}

	public String getProjectName1() {
		return projectName1;
	}

	public void setProjectName1(String projectName1) {
		this.projectName1 = projectName1;
	}

	public String getProjectDetails1() {
		return projectDetails1;
	}

	public void setProjectDetails1(String projectDetails1) {
		this.projectDetails1 = projectDetails1;
	}

	public String getUserName1() {
		return userName1;
	}

	public void setUserName1(String userName1) {
		this.userName1 = userName1;
	}

	public String getPassword1() {
		return password1;
	}

	public void setPassword1(String password1) {
		this.password1 = password1;
	}

	public String getCreateDate1() {
		return createDate1;
	}

	public void setCreateDate1(String createDate1) {
		this.createDate1 = createDate1;
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

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getProjectDetails() {
		return projectDetails;
	}

	public void setProjectDetails(String projectDetails) {
		this.projectDetails = projectDetails;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
}