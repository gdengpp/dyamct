package com.amct.net;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.amct.dao.menuDao;
import com.amct.dao.userDao;
import com.amct.dto.tree;
import com.amct.entity.menu;
import com.amct.serviceimpl.menuSerivceImpl;

@RunWith(SpringJUnit4ClassRunner.class) //表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = { "classpath:spring/spring.xml" })
public class testC {
	
	@Autowired
	private menuDao mu;
	@Autowired
	private userDao u;
	
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
		List<tree> list = ms.findTree("1");
		System.out.println(list);
	}
}

