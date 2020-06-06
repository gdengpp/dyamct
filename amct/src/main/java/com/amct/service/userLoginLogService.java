package com.amct.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.amct.entity.log;

@Service
public interface userLoginLogService {

	
	//登录成功后加入登录日志表中
	Integer addUserLoginLog(String login_account,HttpServletRequest req);
	
	List<log> find(String login_account,Integer page,Integer limit);
	
	Integer getCount(String login_account);
	
	Integer remove();
}
