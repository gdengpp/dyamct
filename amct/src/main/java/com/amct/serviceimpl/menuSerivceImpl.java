package com.amct.serviceimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amct.dao.menuDao;
import com.amct.dto.tree;
import com.amct.entity.info;
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
		if (list.size() == 0) {
			return list;
		} else {
			return menuUtil.menuMultilevel(list);
		}
	}

	@Override
	public List<tree> findTree(String role_id) {
		List<menu> list = mu.queryAll();
		if (list.size() == 0) {
			List<tree> tt = new ArrayList<tree>();
			return tt;
		} else {
			return menuUtil.menuMultilevelTree(list);
		}
	}

	@Override
	public List<menu> findAll(Integer page, Integer limit) {
		Integer begin = (page - 1) * limit;
		return mu.queryByBeginAndEnd(begin, limit);
	}

	@Override
	public Integer add(menu m) {
		m.setMenu_id(UUID.randomUUID().toString());
		if (m.getMenu_pid() == null || m.getMenu_pid() == "") {
			m.setMenu_pid("0");
		}
		return mu.insert_menu(m);
	}

	@Override
	public Integer modify_menu(menu m) {
		if (m.getMenu_pid() == null || m.getMenu_pid() == "") {
			m.setMenu_pid("0");
		}
		if(m.getMenu_id().equals(m.getMenu_pid())){
			m.setMenu_pid("0");
		}
		return mu.update_menu(m);
	}

	@Override
	public info remove(String menu_id) {
		info info = new info();
		List<menu> list = mu.queryByMenu_id(menu_id);
		if (list.size() > 0) {
			info.setMsg("此菜单下有子菜单，不可删除");
			info.setSuccess(false);
			return info;
		} else {
			// 开启事务
			Integer del = mu.del(menu_id);
			Integer d = 0;
			if (del == 1) {
				d = mu.del_role_menu(menu_id);
			}
			if (d == 0) {
				// 回滚
			} else {
				// 提交
			}
			info.setMsg("删除成功");
			info.setSuccess(true);
			return info;
		}
	}

	@Override
	public Integer count() {
		return mu.getCount();
	}
}
