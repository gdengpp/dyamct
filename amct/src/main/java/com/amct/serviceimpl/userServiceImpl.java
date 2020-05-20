package com.amct.serviceimpl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.amct.dao.userDao;
import com.amct.dao.userLoginLogDao;
import com.amct.entity.info;
import com.amct.service.userService;
import com.amct.util.MD5Util;

@Service
@Transactional
public class userServiceImpl implements userService {

	@Autowired
	private userDao user;

	@Autowired
	private userLoginLogDao userlog;

	@Override
	public info findLogin(String login_account, String password,
			HttpSession session) {
		com.amct.entity.user u = user.queryBylogin_account(login_account);
		info info = new info();
		if (u == null) {
			info.setMsg("用户不存在");
			info.setSuccess(false);
			return info;
		}
		String salt = MD5Util.getSaltByPassword(u.getLogin_password());
		Md5Hash shiromd5 = MD5Util.shiromd5(password, salt);
		String key = MD5Util.getKey(shiromd5.toString(), salt);
		if (!key.equals(u.getLogin_password())) {
			info.setMsg("密码错误");
			info.setSuccess(false);
			return info;
		}
		Integer log = userlog.insertUserLoginLog(UUID.randomUUID().toString(),
				login_account, new Date());
		if (log == 1) {
			info.setMsg("登录成功");
			info.setSuccess(true);
			session.setAttribute("user", u);
			return info;
		} else {
			info.setMsg("登录失败，增加登录日志失败");
			info.setSuccess(false);
			return info;
		}
	}

	@Override
	public List<com.amct.entity.user> findAll(String user_name, Integer page,
			Integer limit) {
		Integer begin = (page - 1) * limit;
		if (user_name != null) {
			user_name = "%" + user_name + "%";
		}
		return user.queryAll(user_name, begin, limit);
	}

	@Override
	public Integer getCount(String user_name) {
		if (user_name != null) {
			user_name = "%" + user_name + "%";
		}
		return user.count(user_name);
	}

}
