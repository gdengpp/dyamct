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
								</a><a class="layui-btn layui-btn-primary resert_btn"><i
									class="layui-icon">&#xe669;</i>重置 </a> <a
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

<!-- add/edit -->
<div id="roleAddEdit" style="display:none;padding:10px;">
	<form class="layui-form" action="" lay-filter="role_form">
		<input type="text" name="role_id" autocomplete="off"
			class="layui-input" style="display:none">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">角色名</label>
				<div class="layui-input-inline">
					<input type="text" name="role_name" lay-verify="required"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">角色编码</label>
				<div class="layui-input-inline">
					<input type="text" name="role_code" autocomplete="off"
						lay-verify="required" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">角色状态</label>
				<div class="layui-input-inline">
					<input type="radio" name="role_status" value="1" title="启用" checked><input
						type="radio" name="role_status" value="0" title="禁用">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">排序</label>
				<div class="layui-input-inline">
					<input type="number" name="role_order" autocomplete="off" value=1
						class="layui-input">
				</div>
			</div>
			<label class="layui-form-label">备注</label>
			<div class="layui-input-block">
				<textarea id="role_remark" name="role_remark" placeholder="备注"
					class="layui-textarea" rows="2"
					style="margin-top: 0px; margin-bottom: 0px; height: 101px;width:90%"></textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block" style="margin-left: 78%">
				<button type="submit" class="layui-btn" lay-submit=""
					lay-filter="roleSubmit">立即提交</button>
			</div>
		</div>
	</form>
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
									url : "${pageContext.request.contextPath}/menu/find_menu.do",
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
												offset : '25%',
												icon : 5
											});
										}
									},
									error : function(res) {
										layer.msg(res.msg, {
											offset : '25%',
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
									url : basurl + 'role/getRoleAll.do',
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
														return "启用";
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
							addAndEdit();
						});

						//修改
						$(".role_edit").click(function() {
							var data = table.checkStatus('roledatagrid').data;
							if (data.length != 1) {
								layer.msg("请选择一条数据修改", {
									icon : 5,
									offset : '25%',
								});
								return false;
							}
							addAndEdit(data);
						});

						//删除
						$(".role_del")
								.click(
										function() {

											var data = table
													.checkStatus('roledatagrid').data;
											if (data.length != 1) {
												layer.msg("请选择一条数据删除", {
													icon : 5,
													offset : '25%',
												});
												return false;
											}
											layer
													.confirm(
															'您是否要确认执行删除？',
															{
																offset : '25%',
																btn : [ '执行',
																		'取消' ]
															//按钮      
															},
															function() {
																var del = layer
																		.load();
																$
																		.ajax({
																			url : "${pageContext.request.contextPath}/role/role_del.do",
																			method : 'get',
																			data : {
																				role_id : data[0].role_id
																			},
																			success : function(
																					r) {
																				layer
																						.close(del);
																				if (r.success) {
																					layer
																							.msg(
																									r.msg,
																									{
																										icon : 6,
																										offset : '25%',
																									});
																					location
																							.reload();
																				} else {
																					layer
																							.msg(
																									r.msg,
																									{
																										icon : 5,
																										offset : '25%',
																									});
																				}
																			}
																		});
															});
										});

						//授权
						
					$(".role_auth").click(function() {
							var topData = table.checkStatus("roledatagrid");
							var data = topData.data;
							if (data.length == 0) {
								layer.msg("没有选择授权角色", {
									icon : 5
								});
								return false;
							}

							var treeData = tree.getChecked('menu_info');
							if (treeData.length == 0) {
								layer.msg("没有选择授权菜单", {
									icon : 5
								});
								return false;
							}
							if (data[0].role_status == 0) {
								layer.msg("角色异常，不可授权", {
									icon : 5
								});
								return false;
							}
							var tree_id = [];
							treeDataId(tree_id,treeData);
							layer.load();
							

							$.ajax({
								url : basurl + 'role/auth.do',
								method : 'get',
								data : {
									role_id : data[0].role_id,
									menu_id : JSON.stringify(tree_id),
								},
								success : function(r) {
								layer.closeAll();
								if(r.success){
									layer.msg(r.msg,{icon:6});
								}else{
									layer.msg(r.msg,{icon:5});
								}
								},
								error : function() {
									layer.msg("授权失败", {
										icon : 5
									});
								}
							});
						});

						function addAndEdit(data) {
							var str = "添加角色";
							if (data) {
								str = "修改角色";
								$(
										"input[name='role_status'][value="
												+ data[0].role_status + "]")
										.prop('checked', true);
								form.val("role_form", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
									"role_id" : data[0].role_id // "name": "value"
									,
									"role_code" : data[0].role_code,
									"role_name" : data[0].role_name,
									"role_remark" : data[0].role_remark,
									"role_order" : data[0].role_order,
									"role_status" : data[0].role_status
								});
							}
							layui.layer.open({
								type : 1, //弹窗类型
								title : str, //显示标题
								anim : 0,
								shade : 0.3,
								offset : '100px',
								shadeClose : false, //显示模态窗口
								area : [ '700px', '400px' ], //宽高
								content : $('#roleAddEdit'),
								cancel : function(index, layero) {
									layer.close(index);
									location.reload();
									return false;
								},
								success : function() {

								}
							});
						}
						//监听提交
						form
								.on(
										'submit(roleSubmit)',
										function(data) {
											var datas = data.field;
											var url = "${pageContext.request.contextPath}/role/role_add.do";
											if (datas.role_id) {
												url = "${pageContext.request.contextPath}/role/role_edit.do";
											}
											var add_edit = layer.load();
											$.ajax({
												url : url,
												method : 'post',
												data : datas,
												success : function(r) {
													layer.close(add_edit);
													if (r.success) {
														layer.msg(r.msg, {
															icon : 6,
															offset : '25%',
														});
													} else {
														layer.msg(r.msg, {
															icon : 5,
															offset : '25%',
														});
													}
												}
											});
											return false;
										});

						//监听行单击事件（双击事件为：rowDouble）
						table.on('row(roleTableFilter)', function(obj) {
							var data = obj.data;
							$.ajax({
								url : basurl + 'role/getMenuId.do',
								method : 'get',
								data : {
									role_id : data.role_id
								},
								success : function(r) {
									//重载实例
									tree.reload('menu_info', {

									});
									tree.setChecked('menu_info', r); //勾选指定节点
								}
							});
							//标注选中样式
							//obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
						});
					});

	function treeDataId(tree_id, treeData) {
		for (var i = 0; i < treeData.length; i++) {
			tree_id.push(treeData[i].id);
			if (treeData[i].children.length > 0) {
				treeDataId(tree_id, treeData[i].children);
			}
		}
	}
</script>