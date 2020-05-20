package com.amct.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.amct.entity.roles;

public interface roleDao {

	List<roles> queryAll(@Param("role_name") String role_name,
			@Param("begin") Integer begin, @Param("end") Integer end);
	
	Integer count(@Param("role_name") String role_name);
}
