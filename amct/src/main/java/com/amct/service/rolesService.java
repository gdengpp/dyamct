package com.amct.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.amct.entity.roles;

@Service
public interface rolesService {

	List<roles> findAll(String role_name, Integer page, Integer limit);
	
	Integer getCount(String role_name);
	
	//查询所有角色，作为人员管理选择角色下拉
	List<roles> find();
}
