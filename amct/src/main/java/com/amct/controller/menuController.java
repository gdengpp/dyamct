package com.amct.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public List<menu> find(Integer type,HttpSession session) {
		// 获取session中的用户信息
		user u = (user) session.getAttribute("user");
		// u.getRole().getRole_id()-->取出用户信息中角色id（role_id）查询角色拥有权限菜单
		List<menu> list = m.find(u.getRole().getRole_id(),type);
		return list;
	}

}
