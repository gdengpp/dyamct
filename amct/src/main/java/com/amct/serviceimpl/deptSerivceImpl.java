package com.amct.serviceimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amct.dao.deptDao;
import com.amct.dto.tree;
import com.amct.entity.dept;
import com.amct.entity.info;
import com.amct.service.deptService;
import com.amct.util.deptUtil;

@Service
public class deptSerivceImpl implements deptService {

	@Autowired
	private deptDao d;

	@Override
	public List<dept> find() {
		List<dept> list = d.query();
		if (list.size() == 0) {
			return list;
		} else {
			return deptUtil.menuMultilevel(list);
		}
	}

	@Override
	public List<tree> findTree() {
		List<dept> list = d.queryAll();
		if (list.size() == 0) {
			List<tree> tt = new ArrayList<tree>();
			return tt;
		} else {
			return deptUtil.menuMultilevelTree(list);
		}
	}

	@Override
	public List<dept> findAll(Integer page, Integer limit) {
		Integer begin = (page - 1) * limit;
		return d.queryByBeginAndEnd(begin, limit);
	}

	@Override
	public Integer add(dept m) {
		m.setDept_id(UUID.randomUUID().toString());
		System.out.println(m.getDept_pid());
		if (m.getDept_pid() == null || m.getDept_pid() == "") {
			m.setDept_pid("0");
		}
		return d.insert_dept(m);
	}

	@Override
	public Integer modify_dept(dept m) {
		if (m.getDept_pid() == null || m.getDept_pid() == "") {
			m.setDept_pid("0");
		}
		return d.update_dept(m);
	}

	@Override
	public info remove(String dept_id) {
		info info = new info();
		List<dept> list = d.queryByDeptId(dept_id);
		if (list.size() > 0) {
			info.setMsg("此部门下有子部门，不可删除");
			info.setSuccess(false);
			return info;
		} else {
			Integer del = d.del(dept_id);
			if (del == 1) {
				info.setMsg("删除成功");
				info.setSuccess(true);
				return info;
			} else {
				info.setMsg("删除失败");
				info.setSuccess(false);
				return info;
			}
		}
	}

	@Override
	public Integer count() {
		return d.getCount();
	}

}
