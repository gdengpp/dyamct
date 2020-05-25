package com.amct.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amct.dto.findListDto;
import com.amct.entity.info;
import com.amct.entity.roles;
import com.amct.service.rolesService;

@Controller
@Scope("prototype")
@RequestMapping("/role")
public class roleController {

	@Autowired
	private rolesService rs;

	@RequestMapping("/getRoleAll")
	@ResponseBody
	public findListDto<roles> getRoleAll(String role_name, Integer page,
			Integer limit) {
		findListDto<roles> fd = new findListDto<roles>();
		List<roles> list = rs.findAll(role_name, page, limit);
		fd.setCode(0);
		fd.setCount(rs.getCount(role_name));
		fd.setData(list);
		fd.setMsg("查询成功");
		return fd;
	}

	@RequestMapping("/findAll")
	@ResponseBody
	public List<roles> findAll() {
		return rs.find();
	}

	@RequestMapping("/role_del")
	@ResponseBody
	public info role_del(String role_id) {
		return rs.remove(role_id);
	}

	@RequestMapping("/role_add")
	@ResponseBody
	public info role_add(roles role) {
		return rs.addRole(role);
	}

	@RequestMapping("/role_edit")
	@ResponseBody
	public info role_edit(roles role) {
		return rs.modify(role);
	}
	
	@RequestMapping("/getMenuId")
	@ResponseBody
	public List<String> getMenuId(String role_id) {
		return rs.findMenuId(role_id);
	}
	
	@RequestMapping("/auth")
	@ResponseBody
	public info auth(String role_id,String menu_id) {
		return rs.authService(role_id, menu_id);
	}
	
	
}
