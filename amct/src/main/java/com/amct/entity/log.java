package com.amct.entity;

import java.io.Serializable;
import java.util.Date;

public class log implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

	private String login_account;

	private Date login_time;

	public log() {
		super();
		// TODO Auto-generated constructor stub
	}

	public log(String id, String login_account, Date login_time) {
		super();
		this.id = id;
		this.login_account = login_account;
		this.login_time = login_time;
	}

	@Override
	public String toString() {
		return "log [id=" + id + ", login_account=" + login_account
				+ ", login_time=" + login_time + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLogin_account() {
		return login_account;
	}

	public void setLogin_account(String login_account) {
		this.login_account = login_account;
	}

	public Date getLogin_time() {
		return login_time;
	}

	public void setLogin_time(Date login_time) {
		this.login_time = login_time;
	}

}
