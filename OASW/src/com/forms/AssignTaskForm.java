package com.forms;

import java.util.Vector;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;

public class AssignTaskForm extends ActionForm {

	private static final long serialVersionUID = 1L; 
	private String message;
	private String empName;
	private String empName1;
	private String desg; 
	private String dept;
	private String date;
	private String taskNo;
	private String assignedBy;
	private String desg1;
	private String dept1;
	private String date2;
	private String aboutWork;
	private FormFile file;
	private String taskTitle;
	private String taskNumber;
	private String companyname;
	Vector empNameList;
	private String userNameData;
	private String passwordData;
	private String unit;
	
	
	/*private String fromdate;
	private String todate;
*/	private String assignTask;



	public String getEmpName1() {
	return empName1;
}

public void setEmpName1(String empName1) {
	this.empName1 = empName1;
}

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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTaskNo() {
		return taskNo;
	}

	public void setTaskNo(String taskNo) {
		this.taskNo = taskNo;
	}

	public String getAssignedBy() {
		return assignedBy;
	}

	public void setAssignedBy(String assignedBy) {
		this.assignedBy = assignedBy;
	}

	public String getDesg1() {
		return desg1;
	}

	public void setDesg1(String desg1) {
		this.desg1 = desg1;
	}

	public String getDept1() {
		return dept1;
	}

	public void setDept1(String dept1) {
		this.dept1 = dept1;
	}

	public String getDate2() {
		return date2;
	}

	public void setDate2(String date2) {
		this.date2 = date2;
	}

	public String getAboutWork() {
		return aboutWork;
	}

	public void setAboutWork(String aboutWork) {
		this.aboutWork = aboutWork;
	}

	public FormFile getFile() {
		return file;
	}

	public void setFile(FormFile file) {
		this.file = file;
	}

	public String getTaskTitle() {
		return taskTitle;
	}

	public void setTaskTitle(String taskTitle) {
		this.taskTitle = taskTitle;
	}

	public String getTaskNumber() {
		return taskNumber;
	}

	public void setTaskNumber(String taskNumber) {
		this.taskNumber = taskNumber;
	}

	public Vector getEmpNameList() {
		return empNameList;
	}

	public void setEmpNameList(Vector empNameList) {
		this.empNameList = empNameList;
	}

	/*public String getFromdate() {
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
	}*/

	public String getAssignTask() {
		return assignTask;
	}

	public void setAssignTask(String assignTask) {
		this.assignTask = assignTask;
	}

	
	
}
