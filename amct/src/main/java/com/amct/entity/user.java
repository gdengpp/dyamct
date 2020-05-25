package com.amct.entity;

import java.io.Serializable;

public class user implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String user_id;

	private String user_name;

	private String login_account;

	private String login_password;

	private String user_email;

	private String user_phone;

	private Integer user_status;// 账号状态

	private Integer user_sex;// 用户性别（1:男性，0:女性）

	private String user_dept_id;// 所属部门

	private Integer user_order;// 排序

	private roles role;

	private String dept_name;

	public user() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	@Override
	public String toString() {
		return "user [user_id=" + user_id + ", user_name=" + user_name
				+ ", login_account=" + login_account + ", login_password="
				+ login_password + ", user_email=" + user_email
				+ ", user_phone=" + user_phone + ", user_status=" + user_status
				+ ", user_sex=" + user_sex + ", user_dept_id=" + user_dept_id
				+ ", user_order=" + user_order + ", role=" + role
				+ ", dept_name=" + dept_name + "]";
	}

	public user(String user_id, String user_name, String login_account,
			String login_password, String user_email, String user_phone,
			Integer user_status, Integer user_sex, String user_dept_id,
			Integer user_order, roles role, String dept_name) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.login_account = login_account;
		this.login_password = login_password;
		this.user_email = user_email;
		this.user_phone = user_phone;
		this.user_status = user_status;
		this.user_sex = user_sex;
		this.user_dept_id = user_dept_id;
		this.user_order = user_order;
		this.role = role;
		this.dept_name = dept_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getLogin_account() {
		return login_account;
	}

	public void setLogin_account(String login_account) {
		this.login_account = login_account;
	}

	public String getLogin_password() {
		return login_password;
	}

	public void setLogin_password(String login_password) {
		this.login_password = login_password;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public Integer getUser_status() {
		return user_status;
	}

	public void setUser_status(Integer user_status) {
		this.user_status = user_status;
	}

	public Integer getUser_sex() {
		return user_sex;
	}

	public void setUser_sex(Integer user_sex) {
		this.user_sex = user_sex;
	}

	public String getUser_dept_id() {
		return user_dept_id;
	}

	public void setUser_dept_id(String user_dept_id) {
		this.user_dept_id = user_dept_id;
	}

	public Integer getUser_order() {
		return user_order;
	}

	public void setUser_order(Integer user_order) {
		this.user_order = user_order;
	}

	public roles getRole() {
		return role;
	}

	public void setRole(roles role) {
		this.role = role;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
