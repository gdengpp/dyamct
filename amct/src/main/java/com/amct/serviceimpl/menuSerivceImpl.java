package com.amct.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amct.dao.menuDao;
import com.amct.entity.menu;
import com.amct.service.menuService;
import com.amct.util.menuUtil;

@Service
public class menuSerivceImpl implements menuService {

	@Autowired
	private menuDao mu;

	@Override
	public List<menu> find(String role_id) {
		List<menu> list = mu.query(role_id);
		return menuUtil.menuMultilevel(list);
	}

	@Override
	public List<menu> findAll(String role_id, Integer page, Integer limit) {
		Integer begin = (page - 1) * limit;
		return mu.queryByBeginAndEnd(role_id, begin, limit);
	}
}
