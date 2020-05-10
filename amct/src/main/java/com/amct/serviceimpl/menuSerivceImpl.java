package com.amct.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amct.dao.menuDao;
import com.amct.entity.menu;
import com.amct.service.menuService;

@Service
public class menuSerivceImpl implements menuService {

	@Autowired
	private menuDao mu;

	@Override
	public List<menu> find(String role_id,Integer type) {
		List<menu> list = mu.query(role_id,type);
		return list;
	}

}
