package com.amct.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amct.dto.findListDto;
import com.amct.entity.menu;
import com.amct.entity.user;
import com.amct.service.menuService;

@Controller
@RequestMapping("menu")
@Scope("prototype")
public class menuController {

	@Autowired
	private menuService m;

	@RequestMapping("/find_menu")
	@ResponseBody
	public List<menu> find(HttpSession session) {
		// 获取session中的用户信息
		user u = (user) session.getAttribute("user");
		// u.getRole().getRole_id()-->取出用户信息中角色id（role_id）查询角色拥有权限菜单
		List<menu> list = m.find(u.getRole().getRole_id());
		return list;
	}
	
	
	/**
	 * 查询
	 */
	@RequestMapping("/find")
	@ResponseBody
	public findListDto<menu> find(Integer page,Integer limit,HttpSession session) {
		user u = (user) session.getAttribute("user");
		List<menu> list = m.findAll(u.getRole().getRole_id(), page, limit);
		Integer count = list.size();
		findListDto<menu> fd = new findListDto<menu>();
		fd.setCode(0);
		fd.setCount(count);
		fd.setData(list);
		fd.setMsg("查询成功");
		return fd;
	}

}
