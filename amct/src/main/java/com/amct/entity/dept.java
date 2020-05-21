package com.amct.entity;

import java.io.Serializable;
import java.util.List;

public class dept implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String dept_id;

	private String dept_name;

	private String dept_code;

	private String dept_order;

	private String dept_pid;

	private String dept_remark;

	private List<dept> child;

	public dept() {
		super();
		// TODO Auto-generated constructor stub
	}

	public dept(String dept_id, String dept_name, String dept_code,
			String dept_order, String dept_pid, String dept_remark,
			List<dept> child) {
		super();
		this.dept_id = dept_id;
		this.dept_name = dept_name;
		this.dept_code = dept_code;
		this.dept_order = dept_order;
		this.dept_pid = dept_pid;
		this.dept_remark = dept_remark;
		this.child = child;
	}

	@Override
	public String toString() {
		return "dept [dept_id=" + dept_id + ", dept_name=" + dept_name
				+ ", dept_code=" + dept_code + ", dept_order=" + dept_order
				+ ", dept_pid=" + dept_pid + ", dept_remark=" + dept_remark
				+ ", child=" + child + "]";
	}

	public String getDept_id() {
		return dept_id;
	}

	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getDept_code() {
		return dept_code;
	}

	public void setDept_code(String dept_code) {
		this.dept_code = dept_code;
	}

	public String getDept_order() {
		return dept_order;
	}

	public void setDept_order(String dept_order) {
		this.dept_order = dept_order;
	}

	public String getDept_pid() {
		return dept_pid;
	}

	public void setDept_pid(String dept_pid) {
		this.dept_pid = dept_pid;
	}

	public String getDept_remark() {
		return dept_remark;
	}

	public void setDept_remark(String dept_remark) {
		this.dept_remark = dept_remark;
	}

	public List<dept> getChild() {
		return child;
	}

	public void setChild(List<dept> child) {
		this.child = child;
	}

}
