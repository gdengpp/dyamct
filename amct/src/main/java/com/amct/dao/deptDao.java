package com.amct.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.amct.entity.dept;

public interface deptDao {
	List<dept> query();

	// 查询所有菜单
	List<dept> queryAll();

	// 分页查询菜单信息
	List<dept> queryByBeginAndEnd(@Param("begin") Integer begin,
			@Param("end") Integer end);

	Integer insert_dept(dept m);

	Integer update_dept(dept m);

	Integer del(@Param("dept_id") String dept_id);

	Integer getCount();
	
	List<dept> queryByDeptId(@Param("dept_id") String dept_id);

}
