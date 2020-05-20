package com.amct.dto;

import java.io.Serializable;
import java.util.List;

public class tree implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;

	private String name;

	private Boolean open;

	private List<tree> children;

	public tree() {
		super();
		// TODO Auto-generated constructor stub
	}

	public tree(String id, String name, Boolean open, List<tree> children) {
		super();
		this.id = id;
		this.name = name;
		this.open = open;
		this.children = children;
	}

	@Override
	public String toString() {
		return "tree [id=" + id + ", name=" + name + ", open=" + open
				+ ", children=" + children + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean getOpen() {
		return open;
	}

	public void setOpen(Boolean open) {
		this.open = open;
	}

	public List<tree> getChildren() {
		return children;
	}

	public void setChildren(List<tree> children) {
		this.children = children;
	}

}
