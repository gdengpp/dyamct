package com.amct.entity;

import java.io.Serializable;

public class menu implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String menu_id;

	private String menu_code;

	private String menu_name;

	private String menu_nav;

	private String menu_remark;

	private String menu_url;

	private String menu_cls;

	private Integer menu_order;

	private String menu_pid;

	private Integer menu_status;

	private Integer menu_type;

	public menu() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getMenu_type() {
		return menu_type;
	}

	public void setMenu_type(Integer menu_type) {
		this.menu_type = menu_type;
	}

	@Override
	public String toString() {
		return "menu [menu_id=" + menu_id + ", menu_code=" + menu_code
				+ ", menu_name=" + menu_name + ", menu_nav=" + menu_nav
				+ ", menu_remark=" + menu_remark + ", menu_url=" + menu_url
				+ ", menu_cls=" + menu_cls + ", menu_order=" + menu_order
				+ ", menu_pid=" + menu_pid + ", menu_status=" + menu_status
				+ ", menu_type=" + menu_type + "]";
	}

	public menu(String menu_id, String menu_code, String menu_name,
			String menu_nav, String menu_remark, String menu_url,
			String menu_cls, Integer menu_order, String menu_pid,
			Integer menu_status, Integer menu_type) {
		super();
		this.menu_id = menu_id;
		this.menu_code = menu_code;
		this.menu_name = menu_name;
		this.menu_nav = menu_nav;
		this.menu_remark = menu_remark;
		this.menu_url = menu_url;
		this.menu_cls = menu_cls;
		this.menu_order = menu_order;
		this.menu_pid = menu_pid;
		this.menu_status = menu_status;
		this.menu_type = menu_type;
	}

	public String getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}

	public String getMenu_code() {
		return menu_code;
	}

	public void setMenu_code(String menu_code) {
		this.menu_code = menu_code;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public String getMenu_nav() {
		return menu_nav;
	}

	public void setMenu_nav(String menu_nav) {
		this.menu_nav = menu_nav;
	}

	public String getMenu_remark() {
		return menu_remark;
	}

	public void setMenu_remark(String menu_remark) {
		this.menu_remark = menu_remark;
	}

	public String getMenu_url() {
		return menu_url;
	}

	public void setMenu_url(String menu_url) {
		this.menu_url = menu_url;
	}

	public String getMenu_cls() {
		return menu_cls;
	}

	public void setMenu_cls(String menu_cls) {
		this.menu_cls = menu_cls;
	}

	public Integer getMenu_order() {
		return menu_order;
	}

	public void setMenu_order(Integer menu_order) {
		this.menu_order = menu_order;
	}

	public String getMenu_pid() {
		return menu_pid;
	}

	public void setMenu_pid(String menu_pid) {
		this.menu_pid = menu_pid;
	}

	public Integer getMenu_status() {
		return menu_status;
	}

	public void setMenu_status(Integer menu_status) {
		this.menu_status = menu_status;
	}

}
