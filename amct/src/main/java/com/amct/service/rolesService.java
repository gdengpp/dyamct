package com.amct.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.amct.entity.roles;

@Service
public interface rolesService {

	List<roles> findAll(String role_name, Integer page, Integer limit);
	
	Integer getCount(String role_name);
}
