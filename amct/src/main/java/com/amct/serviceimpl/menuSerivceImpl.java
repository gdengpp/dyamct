package com.amct.serviceimpl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amct.dao.menuDao;
import com.amct.dto.tree;
import com.amct.entity.menu;
import com.amct.service.menuService;
import com.amct.util.menuUtil;

@Service
public class menuSerivceImpl implements menuService {

	@Autowired
	private menuDao mu;

	@Override
	public List<menu> find(String role_id, String user_name) {
		List<menu> list;
		if (user_name.equals("sysadmin")) {
			list = mu.queryAll();
		} else {
			list = mu.query(role_id);
		}
		return menuUtil.menuMultilevel(list);
	}

	@Override
	public List<tree> findTree(String role_id) {
		List<menu> list = mu.queryAll();
		return menuUtil.menuMultilevelTree(list);
	}

	@Override
	public List<menu> findAll(Integer page, Integer limit) {
		Integer begin = (page - 1) * limit;
		return mu.queryByBeginAndEnd(begin, limit);
	}

	@Override
	public Integer add(menu m) {
		m.setMenu_id(UUID.randomUUID().toString());
		return mu.insert_menu(m);
	}

	@Override
	public Integer modify_menu(menu m) {
		return mu.update_menu(m);
	}

	@Override
	public Integer remove(String menu_id) {
		return mu.del(menu_id);
	}

	@Override
	public Integer count() {
		return mu.getCount();
	}
}
