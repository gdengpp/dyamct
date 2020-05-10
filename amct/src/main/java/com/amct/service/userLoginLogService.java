package com.amct.service;

import org.springframework.stereotype.Service;

@Service
public interface userLoginLogService {

	
	//登录成功后加入登录日志表中
	Integer addUserLoginLog(String login_account);
}
