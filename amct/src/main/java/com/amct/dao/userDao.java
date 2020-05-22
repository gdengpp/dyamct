package com.amct.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.amct.entity.user;

public interface userDao {

	// 用户登录
	user queryBylogin_account(@Param("login_account") String login_account);

	List<user> queryAll(@Param("user_name") String user_name,
			@Param("begin") Integer begin, @Param("end") Integer end);

	Integer count(@Param("user_name") String user_name);

	Integer insert(user u);

	Integer update(user u);

	Integer del(@Param("user_id") String user_id);
	
	Integer user_role(@Param("id") String id,@Param("user_id") String user_id,@Param("role_id") String role_id);
	
	Integer del_user_role_user_id(@Param("user_id") String user_id);
}
