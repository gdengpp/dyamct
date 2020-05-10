package com.amct.net;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.amct.dao.menuDao;
import com.amct.dao.userDao;
import com.amct.entity.menu;
import com.amct.entity.user;

@RunWith(SpringJUnit4ClassRunner.class) //表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = { "classpath:spring/spring.xml" })
public class testC {
	
	@Autowired
	private menuDao mu;
	@Autowired
	private userDao u;
	
	@Test
	public void test1(){
		user user = u.queryBylogin_account("admin");
		
		System.out.println(user);
		System.out.println(user.getRole().getRole_id());
	}
	
}
