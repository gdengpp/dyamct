package com.amct.dao;

import org.apache.ibatis.annotations.Param;

import com.amct.entity.user;

public interface userDao {

	// 用户登录
	user queryBylogin_account(@Param("login_account") String login_account);

}
