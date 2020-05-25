package com.amct.serviceimpl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.amct.dao.roleDao;
import com.amct.entity.info;
import com.amct.entity.roles;
import com.amct.service.rolesService;

@Service
@Transactional
public class rolesServiceImpl implements rolesService {

	@Autowired
	private roleDao rd;

	@Override
	public List<roles> findAll(String role_name, Integer page, Integer limit) {
		if (role_name != null) {
			role_name = "%" + role_name + "%";
		}
		Integer begin = (page - 1) * limit;
		return rd.queryAll(role_name, begin, limit);
	}

	@Override
	public Integer getCount(String role_name) {
		if (role_name != null) {
			role_name = "%" + role_name + "%";
		}
		return rd.count(role_name);
	}

	@Override
	public List<roles> find() {
		return rd.query();
	}

	@Override
	public info remove(String role_id) {
		Integer del = rd.del(role_id);
		info info = new info();
		if (del == 1) {
			info.setMsg("删除成功");
			info.setSuccess(true);
		} else {
			info.setMsg("删除失败");
			info.setSuccess(false);
		}
		return info;
	}

	@Override
	public info addRole(roles role) {
		info info = new info();
		Integer add = rd.add(role);
		if (add == 1) {
			info.setMsg("添加成功");
			info.setSuccess(true);
		} else {
			info.setMsg("添加失败");
			info.setSuccess(false);
		}
		return info;
	}

	@Override
	public info modify(roles role) {
		info info = new info();
		Integer up = rd.upd(role);
		if (up == 1) {
			info.setMsg("修改成功");
			info.setSuccess(true);
		} else {
			info.setMsg("修改失败");
			info.setSuccess(false);
		}
		return info;
	}

	@Override
	public List<String> findMenuId(String role_id) {
		return rd.queryMenuId(role_id);
	}

	@Override
	public info authService(String role_id, String menu_id) {
		// 先删除，后授权
		Integer sum = 0;
		rd.authDel(role_id);
		List<String> list = (List<String>) JSON.parse(menu_id);
		for (int i = 0; i < list.size(); i++) {
			sum = rd.authDao(UUID.randomUUID().toString(), role_id, list.get(i));
		}

		info info = new info();
		if (sum == 0) {
			info.setMsg("授权失败");
			info.setSuccess(false);
		} else {
			info.setMsg("授权成功");
			info.setSuccess(true);
		}
		return info;
	}

}
