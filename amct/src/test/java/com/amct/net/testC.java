package com.amct.net;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.crypto.hash.Md5Hash;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.amct.dao.menuDao;
import com.amct.dao.userDao;
import com.amct.dto.tree;
import com.amct.entity.menu;
import com.amct.entity.user;
import com.amct.service.userService;
import com.amct.serviceimpl.menuSerivceImpl;
import com.amct.util.MD5Util;

@RunWith(SpringJUnit4ClassRunner.class) //表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = { "classpath:spring/spring.xml" })
public class testC {
	
	@Autowired
	private menuDao mu;
	@Autowired
	private userService u;
	
	@Autowired
	private menuSerivceImpl ms;
	
	@Test
	public void test1(){
		List<menu> arr = new ArrayList<menu>();
		List<menu> list = mu.query("1");
		for (int i = 0; i < list.size(); i++) {
			if(list.get(i).getMenu_pid().equals("0")){
				arr.add(list.get(i));
				List<menu> m = new ArrayList<menu>();
			    for (int j = 0; j < list.size(); j++) {
					if(list.get(i).getMenu_id().equals(list.get(j).getMenu_pid())){
						m.add(menuChild(list,list.get(j)));
					}
				}
				list.get(i).setChild(m);
			}
		}
		System.out.println(arr);
	}

	public menu menuChild(List<menu> list, menu nu) {
		List<menu> arr = new ArrayList<menu>();
		for (int i = 0; i < list.size(); i++) {
			if(nu.getMenu_id().equals(list.get(i).getMenu_pid())){
				arr.add(list.get(i));
				menuChild(list,list.get(i));//递归调用，加载多级菜单
			}
		}
		nu.setChild(arr);
		return nu;
	}
	
	
	
	@Test
	public void test2(){
		List<user> list = u.findAll(null, 1, 10);
		System.out.println(list);
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i).getUser_dept_id());
		}
	}
	
	@Test
	public void tt(){
		String salt = MD5Util.getSalt(6);
		System.out.println(salt);
		Md5Hash shiromd5 = MD5Util.shiromd5("admin", salt);
		System.out.println(shiromd5);
		String key = MD5Util.getKey(shiromd5.toString(), salt);
		System.out.println(key);
		String password = MD5Util.getSaltByPassword(key);
		System.out.println(password);
	}
}

