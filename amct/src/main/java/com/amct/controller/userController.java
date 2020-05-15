package com.amct.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amct.entity.info;
import com.amct.service.userLoginLogService;
import com.amct.service.userService;

@Controller
@RequestMapping("user")
@Scope("prototype")
public class userController {

	@Autowired
	private userService user;
	
	@Autowired
	private userLoginLogService userlog;

	@ResponseBody
	@RequestMapping("/login")
	public info login(String account, String password, String captcha,
			HttpSession session) {
		info info = new info();

		String code = (String) session.getAttribute("code");
		if (!code.equalsIgnoreCase(captcha)) {// equalsIgnoreCase忽略大小写的比较两个字符
			info.setMsg("验证码错误");
			info.setSuccess(false);
			return info;
		}

		com.amct.entity.user u = user.findLogin(account);
		System.out.println("用户信息："+u);
		if (u == null) {
			info.setMsg("用户不存在");
			info.setSuccess(false);
			return info;
		}
		if (!password.equals(u.getLogin_password())) {
			info.setMsg("密码不错误");
			info.setSuccess(false);
			return info;
		}
		Integer log = userlog.addUserLoginLog(account);
		if(log==1){
			info.setMsg("登录成功");
			info.setSuccess(true);
			session.setAttribute("user", u);
			return info;
		}else{
			info.setMsg("登录失败，增加登录日志失败");
			info.setSuccess(false);
			return info;
		}
	}
}
