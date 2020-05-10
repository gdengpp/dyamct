package com.amct.entity;

import java.io.Serializable;

public class roles implements Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String role_id;

	private String role_code;

	private String role_name;

	private String role_status;

	private Integer role_order;

	private String role_remark;

	public roles() {
		super();
		// TODO Auto-generated constructor stub
	}

	public roles(String role_id, String role_code, String role_name,
			String role_status, Integer role_order, String role_remark) {
		super();
		this.role_id = role_id;
		this.role_code = role_code;
		this.role_name = role_name;
		this.role_status = role_status;
		this.role_order = role_order;
		this.role_remark = role_remark;
	}

	@Override
	public String toString() {
		return "roles [role_id=" + role_id + ", role_code=" + role_code
				+ ", role_name=" + role_name + ", role_status=" + role_status
				+ ", role_order=" + role_order + ", role_remark=" + role_remark
				+ "]";
	}

	public String getRole_id() {
		return role_id;
	}

	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}

	public String getRole_code() {
		return role_code;
	}

	public void setRole_code(String role_code) {
		this.role_code = role_code;
	}

	public String getRole_name() {
		return role_name;
	}

	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}

	public String getRole_status() {
		return role_status;
	}

	public void setRole_status(String role_status) {
		this.role_status = role_status;
	}

	public Integer getRole_order() {
		return role_order;
	}

	public void setRole_order(Integer role_order) {
		this.role_order = role_order;
	}

	public String getRole_remark() {
		return role_remark;
	}

	public void setRole_remark(String role_remark) {
		this.role_remark = role_remark;
	}

}
