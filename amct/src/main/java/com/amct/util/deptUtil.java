package com.amct.util;

import java.util.ArrayList;
import java.util.List;

import com.amct.dto.tree;
import com.amct.entity.dept;

public class deptUtil {

	public static List<dept> menuMultilevel(List<dept> list) {
		List<dept> arr = new ArrayList<dept>();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getDept_pid().equals("0")) {
				arr.add(list.get(i));
				List<dept> m = new ArrayList<dept>();
				for (int j = 0; j < list.size(); j++) {
					if (list.get(i).getDept_id()
							.equals(list.get(j).getDept_pid())) {
						m.add(menuChild(list, list.get(j)));
					}
				}
				list.get(i).setChild(m);
			}
		}
		return arr;
	}

	public static dept menuChild(List<dept> list, dept nu) {
		List<dept> arr = new ArrayList<dept>();
		for (int i = 0; i < list.size(); i++) {
			if (nu.getDept_id().equals(list.get(i).getDept_pid())) {
				arr.add(list.get(i));
				menuChild(list, list.get(i));// 递归调用，加载多级菜单
			}
		}
		nu.setChild(arr);
		return nu;
	}

	public static List<tree> menuMultilevelTree(List<dept> list) {
		List<tree> arr = new ArrayList<tree>();
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getDept_pid().equals("0")) {
				tree t = new tree();
				t.setId(list.get(i).getDept_id());
				t.setName(list.get(i).getDept_name());
				t.setOpen(true);
				arr.add(t);
				List<tree> m = new ArrayList<tree>();
				for (int j = 0; j < list.size(); j++) {
					if (list.get(i).getDept_id()
							.equals(list.get(j).getDept_pid())) {
						m.add(menuChildTree(list, list.get(j), t));
					}
				}
				t.setChildren(m);
			}
		}
		return arr;
	}

	public static tree menuChildTree(List<dept> list, dept nu, tree tt) {
		List<tree> arr = new ArrayList<tree>();
		tree t = null;
		for (int i = 0; i < list.size(); i++) {
			if (nu.getDept_id().equals(list.get(i).getDept_pid())) {
				t = new tree();
				t.setId(list.get(i).getDept_id());
				t.setName(list.get(i).getDept_name());
				t.setOpen(true);
				arr.add(t);
				menuChild(list, list.get(i));// 递归调用，加载多级菜单
			}
		}
		if (arr.size() == 0) {
			t = new tree();
			t.setId(nu.getDept_id());
			t.setName(nu.getDept_name());
			t.setOpen(true);
		}
		return t;
	}

}
