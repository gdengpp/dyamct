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
import com.amct.entity.info;
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
		List<menu> list = m.find(u.getRole().getRole_id(),u.getUser_name());
		return list;
	}

	@RequestMapping("/find_menu_tree")
	@ResponseBody
	public List<tree> find_menu_tree(HttpSession session) {
		// 获取session中的用户信息
		user u = (user) session.getAttribute("user");
		// u.getRole().getRole_id()-->取出用户信息中角色id（role_id）查询角色拥有权限菜单
		List<tree> list = m.findTree(u.getRole().getRole_id());
		return list;
	}

	/**
	 * 查询
	 */
	@RequestMapping("/find")
	@ResponseBody
	public findListDto<menu> find(Integer page, Integer limit,
			HttpSession session) {
		List<menu> list = m.findAll(page, limit);
		Integer count = m.count();
		findListDto<menu> fd = new findListDto<menu>();
		fd.setCode(0);
		fd.setCount(count);
		fd.setData(list);
		fd.setMsg("查询成功");
		return fd;
	}

	@RequestMapping("/menu_add")
	@ResponseBody
	public info menu_add(menu mm) {
		Integer add = m.add(mm);
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

	@RequestMapping("/menu_edit")
	@ResponseBody
	public info menu_edit(menu mm) {
		Integer add = m.modify_menu(mm);
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

	@RequestMapping("/menu_del")
	@ResponseBody
	public info menu_del(String menu_id) {
		Integer add = m.remove(menu_id);
		info info = new info();
		if (add == 1) {
			info.setMsg("删除数据成功");
			info.setSuccess(true);
		} else {
			info.setMsg("删除数据失败");
			info.setSuccess(false);
		}
		return info;
	}

}
