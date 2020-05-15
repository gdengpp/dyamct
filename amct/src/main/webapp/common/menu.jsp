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
							<div class="layui-btn-group">
								 <a class="layui-btn layui-btn-primary menu_add"> <i
									class="layui-icon">&#xe654;</i>新增
								</a> <a class="layui-btn layui-btn-primary menu_edit"> <i
									class="layui-icon">&#xe642;</i>修改
								</a>
								<c:if test="${user.role.role_code=='sysadmin' }">
									<a class="layui-btn layui-btn-primary menu_del"> <i
										class="layui-icon">&#xe640;</i>删除
									</a>
								</c:if>
							</div>
						</div>
					</div>
					<div class="layui-form menu_list">
						<table class="layui-hide" id="menudatagrid"
							lay-data="{id: 'menudatagrid'}" lay-filter="menuTableFilter"></table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	var basurl = '${pageContext.request.contextPath}/';
	layui
			.use(
					[ 'table', 'form', 'tree', 'layer', 'jquery', 'laydate',
							'element', 'tree' ],
					function() {
						var table = layui.table;
						var layer = layui.layer;
						var form = layui.form;
						var element = layui.element;
						var tree = layui.tree;
						var $ = layui.$;
						form.render();
						element.init();
						//树形菜单--------------------------------------
						$
								.ajax({
									url : "${pageContext.request.contextPath}/menu/find_menu",
									method : 'get',
									async : false,//左侧树在表格之前加载且设置同步，防止页面加载布局出现竖线问题
									success : function(data) {
										// 点击菜单查询详细情况
										if (data.length > 0) {
											var menuData = [];
											for (var i = 0; i < data.length; i++) {
												var children = [];
												var obj = {};
												obj.id = data[i].menu_id;
												obj.title = data[i].menu_name;
												obj.spread = true;
												if (data[i].child
														&& data[i].child.length > 0) {
													for (var j = 0; j < data[i].child.length; j++) {
														var objleft = {};
														var childrenleft = [];
														objleft.id = data[i].child[j].menu_id;
														objleft.title = data[i].child[j].menu_name;
														objleft.spread = true;
														if (data[i].child[j].child
																&& data[i].child[j].child.length > 0) {
															for (var m = 0; m < data[i].child[j].child.length; m++) {
																var objleftchild = {};
																objleftchild.id = data[i].child[j].child[m].menu_id;
																objleftchild.title = data[i].child[j].child[m].menu_name;
																objleftchild.spread = true;
																if (data[i].child[j].child[m].child.length > 0) {
																	menuDeal(
																			data[i].child[j].child[m].child,
																			objleftchild);
																}
																childrenleft
																		.push(objleftchild);
															}
														}
														objleft.children = childrenleft;
														children.push(objleft);
													}
												}
												obj.children = children;
												menuData.push(obj);
											}
											tree
													.render({
														elem : '#menu_info', //绑定元素
														data : menuData,
														id : 'menu_info',
														showCheckbox : false,
														onlyIconControl : true,
														click : function(obj) {
															//刷新表格数据
															console
																	.log(obj.data); //得到当前点击的节点数据
															console
																	.log(obj.state); //得到当前节点的展开状态：open、close、normal
															console
																	.log(obj.elem); //得到当前节点元素

															console
																	.log(obj.data.children); //当前节点下是否有子节点
														}
													});
										} else {
											layer.msg(data.msg, {
												icon : 5
											});
										}
									},
									error : function(res) {
										layer.msg(res.msg, {
											icon : 5
										});
									}
								});
						//树形菜单--------------------------------------

						//加载数据表格
						table
								.render({
									elem : '#menudatagrid',
									id : 'menudatagrid',
									url : basurl + 'menu/find',
									limits : [ 10, 20, 30, 50, 100, 300, 600,
											1000 ],
									cols : [ [
											{
												field : 'menu_id',
												type : 'checkbox'
											},
											{
												field : 'menu_name',
												title : '菜单名称',
												align : 'left'
											},
											{
												field : 'menu_code',
												title : '菜单编码',
												align : 'left'
											},
											{
												field : 'menu_nav',
												title : '菜单导航',
												align : 'left'
											},
											{
												field : 'menu_url',
												title : '菜单URL',
												align : 'left'
											},
											{
												field : 'menu_cls',
												title : '菜单图标',
												align : 'left'
											},
											{
												field : 'menu_order',
												title : '菜单顺序',
												align : 'left'
											},
											{
												field : 'menu_status',
												title : '菜单状态',
												align : 'left',
												templet : function(d) {
													if (d.role_status == 1) {
														return "<span style='color:red'>禁用</span>";
													} else {
														return "正常";
													}
												}
											},
											{
												field : 'menu_remark',
												title : '菜单说明',
												align : 'left'
											},
									] ],
									page : true,
									done : function(res, curr, count) {
										$(".laytable-cell-checkbox").css(
												"padding", "5px");
										signleSelect($, 'menudatagrid');
									}
								});
					});

	function menuDeal(data, objleftchild) {
		for (var j = 0; j < data.length; j++) {
			var objleft = {};
			var childrenleft = [];
			objleft.id = data[j].menu_id;
			objleft.title = data[j].menu_name;
			objleft.spread = true;
			childrenleft.push(objleft);
			if (data[j].child.length > 0) {
				menuDeal(data[j].child, objleftchild);
			}
			objleftchild.children = childrenleft;
		}
	}
</script>