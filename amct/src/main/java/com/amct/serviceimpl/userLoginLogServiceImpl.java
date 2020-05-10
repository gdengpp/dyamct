package com.amct.serviceimpl;

import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.amct.dao.userLoginLogDao;
import com.amct.service.userLoginLogService;

@Service
@Transactional
public class userLoginLogServiceImpl implements userLoginLogService{

	@Autowired
	private userLoginLogDao user;

	@Override
	public Integer addUserLoginLog(String login_account) {
		return user.insertUserLoginLog(UUID.randomUUID().toString(), login_account, new Date());
	}
	
	
}
