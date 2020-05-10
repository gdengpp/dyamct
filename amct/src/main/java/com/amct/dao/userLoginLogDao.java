package com.amct.dao;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

public interface userLoginLogDao {

	// 登录成功后加入登录日志表中
	Integer insertUserLoginLog(@Param("id") String id,
			@Param("login_account") String login_account,
			@Param("login_time") Date login_time);
}
