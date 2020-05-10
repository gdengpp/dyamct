package com.amct.service;

import org.springframework.stereotype.Service;

import com.amct.entity.user;

@Service
public interface userService {

	//用户登录
	user findLogin(String login_account);
	
}
