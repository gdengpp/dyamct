package com.amct.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.amct.dao.userDao;
import com.amct.service.userService;

@Service
@Transactional
public class userServiceImpl implements userService{

	@Autowired
	private userDao user;

	@Override
	public com.amct.entity.user findLogin(String login_account) {
		return user.queryBylogin_account(login_account);
	}

}
