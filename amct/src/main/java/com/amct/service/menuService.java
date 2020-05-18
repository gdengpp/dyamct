package com.amct.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.amct.dto.tree;
import com.amct.entity.menu;

@Service
public interface menuService {

	//查询所有菜单
	List<menu> find(String role_id,String user_name);
	
	public List<tree> findTree(String role_id);
	
	//分页查询
	List<menu> findAll(Integer page,Integer limit);
	
	Integer add(menu m);
	
	Integer modify_menu(menu m);
	
	Integer remove(String menu_id);
	
	Integer count();
}
