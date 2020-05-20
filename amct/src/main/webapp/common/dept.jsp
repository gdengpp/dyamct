<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../index.jsp"></jsp:include>
<div class="bgWhite">
	<div class="bgWhitePadding">
		<div class="layui-fluid">
			<div class="layui-row">
				<div class="layui-col-md2">
					<ul id="menu_info"></ul>
				</div>
				<div class="layui-col-md10">
					<div class="layui-form">
						<div class="layui-inline">
							<div class="layui-input-inline">
								<input type="text" value="" placeholder="用户名"
									class="layui-input search_input" />
							</div>
							<div class="layui-btn-group">
								<a class="layui-btn layui-btn-primary search_btn"> <i
									class="layui-icon">&#xe615;</i>查询
								</a><a class="layui-btn layui-btn-primary resert_btn">重置 </a>
								<c:if test="${user.role.role_code=='sysadmin' }">
									<a class="layui-btn layui-btn-primary role_del"> <i
										class="layui-icon">&#xe669;</i>清空
									</a>
								</c:if>
							</div>
						</div>
					</div>
					<div class="layui-form role_list">
						<table class="layui-hide" id="logdatagrid"
							lay-data="{id: 'logdatagrid'}" lay-filter="logTableFilter"></table>
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
		var $ = layui.$;
		form.render();
		element.init();
		//加载数据表格
		table.render({
			elem : '#logdatagrid',
			id : 'logdatagrid',
			url : basurl + 'role/getRoleAll',
			limits : [ 10, 20, 30, 50, 100, 300, 600, 1000 ],
			cols : [ [ {
				field : 'role_id',
				type : 'checkbox'
			}, {
				field : 'role_code',
				title : '角色编码',
				align : 'left'
			}, {
				field : 'role_name',
				title : '角色名称',
				align : 'left'
			}, {
				field : 'role_status',
				title : '角色状态',
				align : 'left',
				templet : function(d) {
					if (d.role_status == 0) {
						return "<span style='color:red'>禁用</span>";
					} else {
						return "正常";
					}
				}
			}, {
				field : 'role_order',
				title : '排序',
				align : 'left'
			}, {
				field : 'role_remark',
				title : '备注',
				align : 'left'
			} ] ],
			page : true,
			done : function(res, curr, count) {
				$(".laytable-cell-checkbox").css("padding", "5px");
				signleSelect($, 'logdatagrid');
			}
		});
	});
</script>