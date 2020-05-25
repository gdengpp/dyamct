package com.amct.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.amct.entity.roles;

public interface roleDao {

	List<roles> queryAll(@Param("role_name") String role_name,
			@Param("begin") Integer begin, @Param("end") Integer end);
	
	Integer count(@Param("role_name") String role_name);
	
	List<roles> query();
	
	Integer del(@Param("role_id")String role_id);
	
	Integer add(roles role);
	
	Integer upd(roles role);
	
	List<String> queryMenuId(@Param("role_id") String role_id);
	
	Integer authDao(@Param("id")String id,@Param("role_id")String role_id,@Param("menu_id")String menu_id);
	
	void authDel(@Param("role_id")String role_id);
}
