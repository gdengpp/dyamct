package com.amct.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.amct.entity.icon;

public interface iconDao {

	// 查询所有信息，不分页
	List<icon> queryAll();

	// 分页查询所有信息
	List<icon> query(@Param("icon_name") String icon_name,
			@Param("begin") Integer begin, @Param("end") Integer end);

	// 新增
	Integer add(icon am);

	// 修改
	Integer update(icon am);

	// 删除
	Integer del(@Param("id") String id);

	Integer count(@Param("icon_name") String icon_name);
}
