package com.amct.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.amct.entity.menu;

@Service
public interface menuService {

	//查询所有菜单
	List<menu> find(String role_id,Integer type);
}
