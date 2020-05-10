package com.amct.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.amct.entity.menu;

public interface menuDao {

	//通过角色id查询所有菜单
	List<menu> query(@Param("role_id")String role_id,@Param("menu_type")Integer menu_type);
}
