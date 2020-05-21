package com.amct.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.amct.dto.tree;
import com.amct.entity.dept;
import com.amct.entity.info;

@Service
public interface deptService {

	List<dept> find();
	
	//查询所有菜单
	
	List<tree> findTree();
	
	//分页查询
	List<dept> findAll(Integer page,Integer limit);
	
	Integer add(dept m);
	
	Integer modify_dept(dept m);
	
	info remove(String dept_id);
	
	Integer count();
}
