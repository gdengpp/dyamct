package com.amct.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amct.dto.findListDto;
import com.amct.dto.tree;
import com.amct.entity.dept;
import com.amct.entity.info;
import com.amct.service.deptService;

@Controller
@RequestMapping("/dept")
@Scope("prototype")
public class deptController {

	@Autowired
	private deptService d;

	@RequestMapping("/find_dept")
	@ResponseBody
	public List<dept> find() {
		List<dept> list = d.find();
		return list;
	}

	@RequestMapping("/find_dept_tree")
	@ResponseBody
	public List<tree> find_menu_tree() {
		List<tree> list = d.findTree();
		return list;
	}
	
	//查询作为人员管理展示
	@RequestMapping("/find_dept_one")
	@ResponseBody
	public dept find_dept_one(String dept_id) {
		return d.findByDeptId(dept_id);
	}

	/**
	 * 查询
	 */
	@RequestMapping("/find")
	@ResponseBody
	public findListDto<dept> find(Integer page, Integer limit,
			HttpSession session) {
		List<dept> list = d.findAll(page, limit);
		Integer count = d.count();
		findListDto<dept> fd = new findListDto<dept>();
		fd.setCode(0);
		fd.setCount(count);
		fd.setData(list);
		fd.setMsg("查询成功");
		return fd;
	}

	@RequestMapping("/dept_add")
	@ResponseBody
	public info dept_add(dept mm) {
		Integer add = d.add(mm);
		info info = new info();
		if (add == 1) {
			info.setMsg("添加数据成功");
			info.setSuccess(true);
		} else {
			info.setMsg("添加数据失败");
			info.setSuccess(false);
		}
		return info;
	}

	@RequestMapping("/dept_edit")
	@ResponseBody
	public info dept_edit(dept mm) {
		Integer add = d.modify_dept(mm);
		info info = new info();
		if (add == 1) {
			info.setMsg("更新数据成功");
			info.setSuccess(true);
		} else {
			info.setMsg("更新数据失败");
			info.setSuccess(false);
		}
		return info;
	}

	@RequestMapping("/dept_del")
	@ResponseBody
	public info dept_del(String dept_id) {
		return d.remove(dept_id);
	}

}
