package com.amct.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.amct.entity.info;
import com.amct.entity.user;

@Service
public interface userService {

	//用户登录
	info findLogin(String login_account,String password,HttpSession session,HttpServletRequest req);
	
	List<user> findAll(String user_name,Integer page,Integer limit);
	
	Integer getCount(String user_name);
	
	info add(user u);
	
	info modify(user u);
	
	info remove(String user_id);
}
