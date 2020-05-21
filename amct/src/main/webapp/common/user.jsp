<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../index.jsp"></jsp:include>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/layui/layui-xtree.js"></script>
<script src="${pageContext.request.contextPath}/static/module/common.js"></script>
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
								</a><a class="layui-btn layui-btn-primary resert_btn"> 重置 </a> <a
									class="layui-btn layui-btn-primary user_add"> <i
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

<!-- add/edit -->
<div id="userAddEdit" style="display:none;padding:10px;">
	<form class="layui-form" action="" lay-filter="user_form">
		<input type="text" name="user_id" autocomplete="off"
			class="layui-input" style="display:none">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">用户名</label>
				<div class="layui-input-inline">
					<input type="text" name="user_name" lay-verify="required"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">用户部门</label>
				<div class="layui-input-inline">
					<input type="text" id="tree" name="user_dept_id" lay-filter="tree"
						class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">登录账号</label>
				<div class="layui-input-inline">
					<input type="text" name="login_account" autocomplete="off" lay-verify="required"
						class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">登录密码</label>
				<div class="layui-input-inline">
					<input type="text" name="login_password" autocomplete="off" lay-verify="required"
						class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">用户邮箱</label>
				<div class="layui-input-inline">
					<input type="text" name="user_email" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">用户电话</label>
				<div class="layui-input-inline">
					<input type="text" name="user_phone" autocomplete="off"
						class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">账号状态</label>
				<div class="layui-input-inline">
					<input type="radio" name="user_status" value="1" title="启用" checked><input
						type="radio" name="user_status" value="0" title="禁用">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">性别</label>
				<div class="layui-input-inline">
					<input type="radio" name="user_sex" value="1" title="男" checked><input
						type="radio" name="user_sex" value="0" title="女">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">排序</label>
				<div class="layui-input-inline">
					<input type="text" name="user_order" autocomplete="off"
						class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block" style="margin-left: 78%">
				<button type="submit" class="layui-btn" lay-submit=""
					lay-filter="userSubmit">立即提交</button>
			</div>
		</div>
	</form>
</div>
<script>
	var basurl = '${pageContext.request.contextPath}/';
	layui
			.use(
					[ 'table', 'form', 'tree', 'layer', 'jquery', 'laydate',
							'element', 'tree', 'treeSelect' ],
					function() {
						var table = layui.table;
						var layer = layui.layer;
						var form = layui.form;
						var tree = layui.tree;
						var treeSelect = layui.treeSelect;
						var element = layui.element;
						var $ = layui.$;
						form.render();
						element.init();
						//加载数据表格
						table
								.render({
									elem : '#userdatagrid',
									id : 'userdatagrid',
									url : basurl + 'user/find_all',
									limits : [ 10, 20, 30, 50, 100, 300, 600,
											1000 ],
									cols : [ [
											{
												field : 'user_id',
												type : 'checkbox'
											},
											{
												field : 'user_name',
												title : '用户名',
												align : 'left'
											},
											{
												field : 'login_account',
												title : '登录账号',
												align : 'left'
											},
											{
												field : 'login_password',
												title : '登录密码',
												align : 'left',
												templet : function(d) {
													return "******";
												}
											},
											{
												field : 'user_email',
												title : '邮箱',
												align : 'left'
											},
											{
												field : 'user_phone',
												title : '电话',
												align : 'left'
											},
											{
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
											}, {
												field : 'user_order',
												title : '排序',
												align : 'left'
											} ] ],
									page : true,
									done : function(res, curr, count) {
										$(".laytable-cell-checkbox").css(
												"padding", "5px");
										signleSelect($, 'userdatagrid');
									}
								});
						$(".search_btn").click(function() {
							table.reload('userdatagrid', {
								where : {
									user_name : $(".search_input").val(),
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
							table.reload('userdatagrid', {
								where : {
									user_name : ""
								},
								page : {
									curr : 1
								//重新从第 1 页开始
								}
							});
						});
						//新增
						$(".user_add").click(function() {
							console.log("新增");
							addAndEdit();
						});

						//修改
						$(".user_edit").click(function() {
							var data = table.checkStatus('userdatagrid').data;
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
						$(".user_del").click(function() {
							console.log("删除");
						});

						function addAndEdit(data) {
							if (data) {
								$("input[name='user_status'][value="+ data[0].user_status + "]").prop('checked', true);
								$("input[name='user_sex'][value="+ data[0].user_sex + "]").prop('checked', true);
								form.val("user_form", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
									"user_id" : data[0].user_id, // "name": "value"
									"user_name" : data[0].user_name,
									"login_account" : data[0].login_account,
									"login_password" : "******",
									"user_email" : data[0].user_email,
									"user_phone" : data[0].user_phone,
									"user_order" : data[0].user_order,
								});
							}
							layui.layer
									.open({
										type : 1, //弹窗类型
										title : "添加菜单", //显示标题
										anim : 0,
										shade : 0.3,
										offset : '100px',
										shadeClose : false, //显示模态窗口
										area : [ '700px', '500px' ], //宽高
										content : $('#userAddEdit'),
										cancel : function(index, layero) {
											layer.close(index);
											location.reload();
											return false;
										},
										success : function() {
											treeSelect
													.render({
														// 选择器
														elem : '#tree',
														// 数据
														data : '${pageContext.request.contextPath}/dept/find_dept_tree',
														// 异步加载方式：get/post，默认get
														type : 'get',
														// 占位符
														placeholder : '选择上级菜单',
														// 是否开启搜索功能：true/false，默认false
														search : true,
														// 一些可定制的样式
														style : {
															folder : {
																enable : true
															},
															line : {
																enable : true
															}
														},
														// 点击回调
														click : function(d) {
															$("input[name=user_dept_id]").val(d.current.id);
														},
														// 加载完成后的回调函数
														success : function(d) {
															if (data) {
																if (data[0].user_dept_id == "0") {
																	$("input[name=user_dept_id]").val(data[0].user_dept_id);
																	//选中节点，根据id筛选
																	treeSelect.checkNode('tree',data[0].user_dept_id);
																} else {
																	$("input[name=user_dept_id]").val(data[0].user_dept_id);
																	//选中节点，根据id筛选
																	treeSelect.checkNode('tree',data[0].user_dept_id);
																}
															}
															//选中节点，根据id筛选
															//treeSelect.checkNode('tree', 2);
															//                获取zTree对象，可以调用zTree方法
															var treeObj = treeSelect
																	.zTree('tree');
															//                刷新树结构
															treeSelect
																	.refresh('tree');
														}
													});
										}
									});

						}
						
						//监听提交
                form.on('submit(userSubmit)', function (data) {
                //20200521 写到这里--====
                    var datas = data.field;
                    var url = "${pageContext.request.contextPath}/user/user_add";
                    if(datas.dept_id){
                    	url = "${pageContext.request.contextPath}/user/user_edit";
                    }
                    var add_edit = layer.load();
                    $.ajax({
                        url: url,
                        method: 'post',
                        data: datas,
                        success: function (r) {
                        	layer.close(add_edit);
                            if (r.success) {
                                layer.msg(r.msg, { icon: 6 ,offset: '25%',});
                            } else {
                                layer.msg(r.msg, { icon: 5 ,offset: '25%',});
                            }
                        }
                    });
                    return false;
                });
					});
</script>