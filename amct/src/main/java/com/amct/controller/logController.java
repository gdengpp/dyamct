package com.amct.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amct.dto.findListDto;
import com.amct.entity.log;
import com.amct.service.userLoginLogService;

@Controller
@Scope("prototype")
@RequestMapping("/log")
public class logController {

	@Autowired
	private userLoginLogService userlog;
	
	@RequestMapping("/getLogAll")
	@ResponseBody
	public findListDto<log> getRoleAll(String login_account,Integer page,Integer limit){
		findListDto<log> fd = new findListDto<log>();
		List<log> list = userlog.find(login_account, page, limit);
		fd.setCode(0);
		fd.setCount(userlog.getCount(login_account));
		fd.setData(list);
		fd.setMsg("查询成功");
		return fd;
	}
	
	@RequestMapping("/removelog")
	@ResponseBody
	public Integer removelog(){
		return userlog.remove();
	}
}
