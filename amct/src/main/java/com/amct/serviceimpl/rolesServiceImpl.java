package com.amct.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.amct.dao.roleDao;
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

}
