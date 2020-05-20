package com.amct.serviceimpl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.amct.dao.userLoginLogDao;
import com.amct.entity.log;
import com.amct.service.userLoginLogService;

@Service
@Transactional
public class userLoginLogServiceImpl implements userLoginLogService {

	@Autowired
	private userLoginLogDao userlog;

	@Override
	public Integer addUserLoginLog(String login_account) {
		return userlog.insertUserLoginLog(UUID.randomUUID().toString(),
				login_account, new Date());
	}

	@Override
	public List<log> find(String login_account, Integer page, Integer limit) {
		Integer begin = (page-1)*limit;
		if(login_account !=null){
			login_account = "%"+login_account+"%";
		}
		return userlog.query(login_account, begin, limit);
	}

	@Override
	public Integer getCount(String login_account) {
		if(login_account !=null){
			login_account = "%"+login_account+"%";
		}
		return userlog.count(login_account);
	}

	@Override
	public Integer remove() {
		return userlog.del();
	}

}
