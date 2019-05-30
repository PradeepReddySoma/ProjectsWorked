package com.forms;

import org.apache.struts.action.ActionForm;

public class ForgotPasswordForm extends ActionForm {

	private static final long serialVersionUID = 1L;
	private String field;
	private String username;
	private String email;
	private String yourPassword;
	private String message;

	private String userNameData;
	private String passwordData;
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

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getYourPassword() {
		return yourPassword;
	}

	public void setYourPassword(String yourPassword) {
		this.yourPassword = yourPassword;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
