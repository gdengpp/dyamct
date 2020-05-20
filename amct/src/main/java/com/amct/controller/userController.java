package com.amct.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amct.dto.findListDto;
import com.amct.entity.info;
import com.amct.entity.user;
import com.amct.service.userLoginLogService;
import com.amct.service.userService;

@Controller
@RequestMapping("/user")
@Scope("prototype")
public class userController {

	@Autowired
	private userService us;

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

		return us.findLogin(account,password,session);
		
	}

	@ResponseBody
	@RequestMapping("/find_all")
	public findListDto<user> find_all(String user_name, Integer page,
			Integer limit) {
		List<user> list = us.findAll(user_name, page, limit);
		Integer count = us.getCount(user_name);
		findListDto<user> fd = new findListDto<user>();
		//layui code设置为0，前台页面显示数据，其他则不战术数据
		fd.setCode(0);
		fd.setCount(count);
		fd.setData(list);
		fd.setMsg("查询成功");
		return fd;
	}
}
