package com.amct.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.amct.entity.user;

public interface userDao {

	// 用户登录
	user queryBylogin_account(@Param("login_account") String login_account);

	
	List<user> queryAll(@Param("user_name") String user_name,@Param("begin")Integer begin,@Param("end")Integer end);
	
	Integer count(@Param("user_name") String user_name);
}
