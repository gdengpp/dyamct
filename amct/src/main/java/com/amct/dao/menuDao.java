package com.amct.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.amct.entity.menu;

public interface menuDao {

	//通过角色id查询所有菜单
	List<menu> query(@Param("role_id")String role_id);
	
	//查询所有菜单
	List<menu> queryAll();
	
	//分页查询菜单信息
	List<menu> queryByBeginAndEnd(@Param("begin")Integer begin,@Param("end")Integer end);
	
	Integer insert_menu(menu m);
	
	Integer update_menu(menu m);
	
	Integer del(@Param("menu_id")String menu_id);
	
	Integer getCount();
}
