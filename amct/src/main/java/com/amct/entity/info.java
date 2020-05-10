package com.amct.entity;

import java.io.Serializable;

/*
 * 返回信息分装
 */
public class info implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Boolean success;// 是否成功

	private String msg;// 返回信息说明

	public info() {
		super();
		// TODO Auto-generated constructor stub
	}

	public info(Boolean success, String msg) {
		super();
		this.success = success;
		this.msg = msg;
	}

	@Override
	public String toString() {
		return "info [success=" + success + ", msg=" + msg + "]";
	}

	public Boolean getSuccess() {
		return success;
	}

	public void setSuccess(Boolean success) {
		this.success = success;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
