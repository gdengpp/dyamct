package com.amct.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.amct.entity.log;

public interface userLoginLogDao {

	// 登录成功后加入登录日志表中
	Integer insertUserLoginLog(@Param("login_account") String login_account,
			@Param("login_time") Date login_time);

	List<log> query(@Param("login_account") String login_account,
			@Param("begin") Integer begin, @Param("end") Integer end);

	Integer count(@Param("login_account") String login_account);
	
	Integer del();
}
