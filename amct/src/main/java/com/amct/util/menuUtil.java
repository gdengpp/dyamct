package com.amct.util;

import java.util.ArrayList;
import java.util.List;

import com.amct.entity.menu;

public class menuUtil {

	public static List<menu> menuMultilevel(List<menu> list) {
		List<menu> arr = new ArrayList<menu>();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getMenu_pid().equals("0")) {
				arr.add(list.get(i));
				List<menu> m = new ArrayList<menu>();
				for (int j = 0; j < list.size(); j++) {
					if (list.get(i).getMenu_id()
							.equals(list.get(j).getMenu_pid())) {
						m.add(menuChild(list, list.get(j)));
					}
				}
				list.get(i).setChild(m);
			}
		}
		return arr;
	}

	public static menu menuChild(List<menu> list, menu nu) {
		List<menu> arr = new ArrayList<menu>();
		for (int i = 0; i < list.size(); i++) {
			if (nu.getMenu_id().equals(list.get(i).getMenu_pid())) {
				arr.add(list.get(i));
				menuChild(list, list.get(i));// 递归调用，加载多级菜单
			}
		}
		nu.setChild(arr);
		return nu;
	}
}
