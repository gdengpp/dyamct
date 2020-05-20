<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../index.jsp"></jsp:include>
<div class="bgWhite">
	<div class="bgWhitePadding">
		<div class="layui-fluid">
			<div class="layui-row">
				<div class="layui-col-md12">
					<div class="layui-form">
						<div class="layui-inline">
							<div class="layui-input-inline">
								<input type="text" value="" placeholder="角色名称"
									class="layui-input search_input" />
							</div>
							<div class="layui-btn-group">
								<a class="layui-btn layui-btn-primary search_btn"> <i
									class="layui-icon">&#xe615;</i>查询
								</a><a class="layui-btn layui-btn-primary resert_btn"> 重置
								</a> <a class="layui-btn layui-btn-primary user_add"> <i
									class="layui-icon">&#xe654;</i>新增
								</a> <a class="layui-btn layui-btn-primary user_edit"> <i
									class="layui-icon">&#xe642;</i>修改
								</a>
								<c:if test="${user.role.role_code=='sysadmin' }">
									<a class="layui-btn layui-btn-primary user_del"> <i
										class="layui-icon">&#xe640;</i>删除
									</a>
								</c:if>
							</div>
						</div>
					</div>
					<div class="layui-form user_list">
						<table class="layui-hide" id="userdatagrid"
							lay-data="{id: 'userdatagrid'}" lay-filter="userTableFilter"></table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
 	var basurl = '${pageContext.request.contextPath}/';
	layui.use([ 'table', 'form', 'tree', 'layer', 'jquery', 'laydate',
			'element', 'tree' ], function() {
		var table = layui.table;
		var layer = layui.layer;
		var form = layui.form;
		var element = layui.element;
		var tree = layui.tree;
		var $ = layui.$;
		form.render();
		element.init();
		//加载数据表格
		table.render({
			elem : '#userdatagrid',
			id : 'userdatagrid',
			url : basurl + 'user/find_all',
			limits : [ 10, 20, 30, 50, 100, 300, 600, 1000 ],
			cols : [ [ {
				field : 'user_id',
				type : 'checkbox'
			}, {
				field : 'user_name',
				title : '用户名',
				align : 'left'
			}, {
				field : 'login_account',
				title : '登录账号',
				align : 'left'
			}, {
				field : 'login_password',
				title : '登录密码',
				align : 'left',
				templet : function(d) {
						return "********";
				}
			}, {
				field : 'user_email',
				title : '邮箱',
				align : 'left'
			}, {
				field : 'user_phone',
				title : '电话',
				align : 'left'
			}, {
				field : 'user_status',
				title : '状态',
				align : 'left',
				templet : function(d) {
					if (d.user_status == 0) {
						return "<span style='color:red'>禁用</span>";
					} else {
						return "正常";
					}
				}
			}, {
				field : 'user_sex',
				title : '性别',
				align : 'left',
				templet : function(d) {
					if (d.user_sex == 1) {
						return "男";
					} else {
						return "女";
					}
				}
			}, {
				field : 'user_dept_id',
				title : '所属部门',
				align : 'left'
			},{
				field : 'user_order',
				title : '排序',
				align : 'left'
			} ] ],
			page : true,
			done : function(res, curr, count) {
				$(".laytable-cell-checkbox").css("padding", "5px");
				signleSelect($, 'userdatagrid');
			}
		});
	});
</script>