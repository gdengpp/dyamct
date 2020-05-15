<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../index.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui-xtree.js"></script>
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

<!-- add/edit -->
<div id="menuAddEdit" style="display:none;padding:10px;">
	<form class="layui-form" action="">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">菜单名</label>
				<div class="layui-input-inline">
					<input type="text" name="menu_name" lay-verify="required"
						autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">上级菜单</label>
				<div class="layui-input-inline">
					<input class="layui-input layui-unselect" id="menu_pid"
						placeholder="--组织机构--" style="color: #827575"></input> <input
						type="hidden" name="menu_id" id="menu_id"> <input
						type="hidden" name="menu_name" id="menu_name"> <i
						class="layui-edge"></i>
				</div>
				<dl class="layui-anim layui-anim-upbit">
					<dd>
						<ul id="menu_tree"></ul>
					</dd>
				</dl>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">菜单url</label>
				<div class="layui-input-inline">
					<input type="text" name="menu_url" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">菜单编码</label>
				<div class="layui-input-inline">
					<input type="text" name="menu_code" autocomplete="off"
						class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">菜单图标</label>
				<div class="layui-input-inline">
					<input type="text" name="menu_cls" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">菜单排序</label>
				<div class="layui-input-inline">
					<input type="text" name="menu_order" autocomplete="off"
						class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">菜单状态</label>
				<div class="layui-input-inline">
					<input type="radio" name="menu_status" value="1" title="启用" checked><input
						type="radio" name="menu_status" value="0" title="禁用">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">菜单导航</label>
				<div class="layui-input-inline">
					<input type="text" id="menu_nav" name="menu_nav" value="控制台>"
						autocomplete="off" class="layui-input">
				</div>
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">备注</label>
			<div class="layui-input-block">
				<textarea id="menu_remark" name="menu_remark" placeholder="备注"
					class="layui-textarea" rows="2"
					style="margin-top: 0px; margin-bottom: 0px; height: 101px;width:90%"></textarea>
			</div>
		</div>
		<div class="layui-form-item">
	    <div class="layui-input-block" style="margin-left: 78%">
	      <button type="submit" class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
	    </div>
	  </div>
	</form>
</div>

<script>
	var menu_data;
	var basurl = '${pageContext.request.contextPath}/';
	layui.use([ 'table', 'form', 'tree', 'layer', 'jquery', 'laydate',
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
					
	$.ajax({
			url : "${pageContext.request.contextPath}/menu/find_menu",
			method : 'get',
			async : false,//左侧树在表格之前加载且设置同步，防止页面加载布局出现竖线问题
			success : function(data) {
				menu_data = data;
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
					tree.render({
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
						table.render({
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
											}, {
												field : 'menu_remark',
												title : '菜单说明',
												align : 'left'
											}, ] ],
									page : true,
									done : function(res, curr, count) {
										$(".laytable-cell-checkbox").css(
												"padding", "5px");
										signleSelect($, 'menudatagrid');
									}
								});

						//add menu
						$(".menu_add").click(function() {
							layui.layer.open({
								type : 1, //弹窗类型
								title : "添加菜单", //显示标题
								anim : 0,
								shade : 0.3,
								offset : '100px',
								shadeClose : false, //显示模态窗口
								area : [ '700px', '500px' ], //宽高
								content : $('#menuAddEdit'),
								cancel : function(index, layero) {
									layer.close(index);
									return false;
								},
								success : function() {
									console.log("打开成功",menu_data)
									var data=[];
									for(var i=0;i<menu_data.length;i++){
										var obj = {};
										if(menu_data[i].menu_pid=="0"){
											obj.value = menu_data[i].menu_id;
											obj.title = menu_data[i].menu_name;
											if(menu_data[i].child.length>0){
												menuDealXtree(menu_data[i].child, obj);
											}
											data.push(obj);
										}
									}
									xtree3 = new layuiXtree({
                    elem: 'menu_tree' //必填
                    , form: form  //必填
                    , data: data //必填
                    , isopen: true  //加载完毕后的展开状态，默认值：true
                    , ckall: true    //启用全选功能，默认值：false
                    , ckallback: function () {
                        var oCks = xtree3.GetAllCheckBox(); //获取全部节点

                        var arr = new Array();

                        var arrIndex = 0;

                        var str = "";

                        for (var i = 0; i < oCks.length; i++) {

                            if (oCks[i].checked) {//获取选中的节点

                                if (oCks[i].value != 1) {

                                    str += oCks[i].title + ",";

                                }

                                arr[arrIndex] = oCks[i].value;

                                arrIndex++;

                            }
                        }
                        arr.splice(0, 2);//去掉最上层节点
                        str = str.substring(0, str.length - 1);
                        str = str.substring(3, str.length);//去掉最上层节点
                        $('#menu_name').val(str);
                        $('#menu_id').val(arr);

                    } //全选框状态改变后执行的回调函数
                    , icon: {        //三种图标样式，更改几个都可以，用的是layui的图标
                        open: "&#xe625;"       //节点打开的图标
                        , close: "&#xe623;"    //节点关闭的图标
                        , end: "&#xe621;"      //末尾节点的图标
                    }
                    , color: {       //三种图标颜色，独立配色，更改几个都可以
                        open: "#EE9A00"        //节点图标打开的颜色
                        , close: "#EEC591"     //节点图标关闭的颜色
                        , end: "#828282"       //末级节点图标的颜色
                    }
                    , click: function (data) {  //节点选中状态改变事件监听，全选框有自己的监听事件
                        var str = "";

                        var oCks = xtree3.GetAllCheckBox(); //获取全部节点

                        var arr = new Array();

                        var arrIndex = 0;

                        for (var i = 0; i < oCks.length; i++) {

                            if (oCks[i].checked) {//获取选中的节点

                                if (oCks[i].value != 1) {

                                    str += oCks[i].title + ",";

                                }

                                arr[arrIndex] = oCks[i].value;

                                arrIndex++;

                            }
                        }
                        arr.splice(0, 1);//去掉最上层节点

                        str = str.substring(0, str.length - 1);

                        $('#org_value').val(str);

                        $('#org_code').val(arr);

                    }
                });
								}
							});
						});
						 //监听提交
						  form.on('submit(demo1)', function(data){
						    layer.alert(JSON.stringify(data.field), {
						      title: '最终的提交信息'
						    })
						    return false;
						  });
						//edit menu
						$(".menu_edit").click(function() {
							console.log("menu_edit")
						});
						//del menu
						$(".menu_del").click(function() {
							console.log("menu_del")
						});
					});
	//递归处理菜单数据
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
	function menuDealXtree(data, obj) {
		for (var i = 0; i < data.length; i++) {
			var obj = {};
			var data = [];
			if (data[i].menu_pid == "0") {
				obj.value = menu_data[i].menu_id;
				obj.title = menu_data[i].menu_name;
				if (data[i].child.length > 0) {
					menuDealXtree(data[i].child, obj)
				}else{
					obj.data = data;
				}
				data.push(obj);
			}
		}
	}
	//处理点击菜单时的数据
	function menuClick(data) {
		var data = [];

		return data;
	}
</script>