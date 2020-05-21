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
								<input type="text" value="" placeholder="角色名称"
									class="layui-input search_input" />
							</div>
							<div class="layui-btn-group">
								<a class="layui-btn layui-btn-primary search_btn"> <i
									class="layui-icon">&#xe615;</i>查询
								</a><a class="layui-btn layui-btn-primary resert_btn">重置 </a> <a
									class="layui-btn layui-btn-primary role_auth"> <i
									class="layui-icon">&#xe672;</i>授权
								</a> <a class="layui-btn layui-btn-primary role_add"> <i
									class="layui-icon">&#xe654;</i>新增
								</a> <a class="layui-btn layui-btn-primary role_edit"> <i
									class="layui-icon">&#xe642;</i>修改
								</a>
								<c:if test="${user.role.role_code=='sysadmin' }">
									<a class="layui-btn layui-btn-primary role_del"> <i
										class="layui-icon">&#xe640;</i>删除
									</a>
								</c:if>
							</div>
						</div>
					</div>
					<div class="layui-form role_list">
						<table class="layui-hide" id="roledatagrid"
							lay-data="{id: 'roledatagrid'}" lay-filter="roleTableFilter"></table>
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
														var objleftchild = {};
														objleft.id = data[i].child[j].menu_id;
														objleft.title = data[i].child[j].menu_name;
														objleft.spread = true;
														if (data[i].child[j].child
																&& data[i].child[j].child.length > 0) {
															for (var m = 0; m < data[i].child[j].child.length; m++) {
																objleftchild.id = data[i].child[j].child[m].menu_id;
																objleftchild.title = data[i].child[j].child[m].menu_name;
																objleftchild.spread = true;
																childrenleft
																		.push(objleft);
															}
														}
														objleft.children = childrenleft;
														children.push(objleft);
													}
												}
												obj.children = children;
												menuData.push(obj);
											}
											tree.render({
												elem : '#menu_info', //绑定元素
												data : menuData,
												id : 'menu_info',
												showCheckbox : true,
											});
										} else {
											layer.msg(data.msg, {
											offset: '25%',
												icon : 5
											});
										}
									},
									error : function(res) {
										layer.msg(res.msg, {
										offset: '25%',
											icon : 5
										});
									}
								});
						//树形菜单--------------------------------------
						//加载数据表格
						table
								.render({
									elem : '#roledatagrid',
									id : 'roledatagrid',
									url : basurl + 'role/getRoleAll',
									limits : [ 10, 20, 30, 50, 100, 300, 600,
											1000 ],
									cols : [ [
											{
												field : 'role_id',
												type : 'checkbox'
											},
											{
												field : 'role_code',
												title : '角色编码',
												align : 'left'
											},
											{
												field : 'role_name',
												title : '角色名称',
												align : 'left'
											},
											{
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
										$(".laytable-cell-checkbox").css(
												"padding", "5px");
										signleSelect($, 'roledatagrid');
									}
								});
						$(".search_btn").click(function() {
							table.reload('roledatagrid', {
								where : {
									role_name : $(".search_input").val(),
								},
								page : {
									curr : 1
								//重新从第 1 页开始
								}
							});
						});
						//重置
						$(".resert_btn").click(function() {
							$(".search_input").val("");
							form.render();
							table.reload('roledatagrid', {
								where : {
									role_name : ""
								},
								page : {
									curr : 1
								//重新从第 1 页开始
								}
							});
						});
						//新增
						$(".role_add").click(function() {
							console.log("新增");
							addAndEdit();
						});

						//修改
						$(".role_edit").click(function() {
							console.log("修改");
							addAndEdit();
						});

						//删除
						$(".role_del").click(function() {
							console.log("删除");
						});
						
						//授权
						$(".role_auth").click(function() {
							console.log("授权");
						});

						function addAndEdit() {
							console.log("新增修改");
							layer.msg("dsjhgjsdkbg")
						}
					});
</script>