<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../index.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/layui/layui-xtree.js"></script>
<script src="${pageContext.request.contextPath}/static/module/common.js"></script>
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
                                <a class="layui-btn layui-btn-primary menu_add"> <i class="layui-icon">&#xe654;</i>新增
                                </a> <a class="layui-btn layui-btn-primary menu_edit"> <i
                                        class="layui-icon">&#xe642;</i>修改
                                </a>
                                <c:if test="${user.role.role_code=='sysadmin' }">
                                    <a class="layui-btn layui-btn-primary menu_del"> <i
                                            class="layui-icon">&#xe640;</i>删除
                                    </a>
                                </c:if>
                                 <a class="layui-btn layui-btn-primary resert_btn"><i
										class="layui-icon">&#xe669;</i>刷新 </a>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form menu_list">
                        <table class="layui-hide" id="menudatagrid" lay-data="{id: 'menudatagrid'}"
                            lay-filter="menuTableFilter"></table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- add/edit -->
<div id="menuAddEdit" style="display:none;padding:10px;">
    <form class="layui-form" action="" lay-filter="menu_form">
        <input type="text" name="menu_id" autocomplete="off" class="layui-input" style="display:none">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">菜单名</label>
                <div class="layui-input-inline">
                    <input type="text" name="menu_name" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">上级菜单</label>
                <div class="layui-input-inline">
                    <input type="text" id="tree" name="menu_pid" lay-filter="tree" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">菜单url</label>
                <div class="layui-input-inline">
                    <input type="text" name="menu_url" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">菜单编码</label>
                <div class="layui-input-inline">
                    <input type="text" name="menu_code" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">菜单图标</label>
                <div class="layui-input-inline">
                    <input type="text" name="menu_cls" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">菜单排序</label>
                <div class="layui-input-inline">
                    <input type="number" name="menu_order" autocomplete="off" value=1 class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">菜单状态</label>
                <div class="layui-input-inline">
                    <input type="radio" name="menu_status" value="1" title="启用" checked><input type="radio"
                        name="menu_status" value="0" title="禁用">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">菜单导航</label>
                <div class="layui-input-inline">
                    <input type="text" id="menu_nav" name="menu_nav" placeholder="控制台>" autocomplete="off"
                        class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <textarea id="menu_remark" name="menu_remark" placeholder="备注" class="layui-textarea" rows="2"
                    style="margin-top: 0px; margin-bottom: 0px; height: 101px;width:90%"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block" style="margin-left: 78%">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="menuSubmit">立即提交</button>
            </div>
        </div>
    </form>
</div>

<script>
    var menu_data;
    var basurl = '${pageContext.request.contextPath}/';

    layui
        .use(
            ['table', 'form', 'tree', 'layer', 'jquery', 'laydate',
                'element', 'tree', 'treeSelect'],
            function () {
                var table = layui.table;
                var layer = layui.layer;
                var form = layui.form;
                var element = layui.element;
                var tree = layui.tree;
                var treeSelect = layui.treeSelect;
                var $ = layui.$;
                form.render();
                element.init();
                //树形菜单--------------------------------------

                $.ajax({
                    url: "${pageContext.request.contextPath}/menu/find_menu",
                    method: 'get',
                    async: false,//左侧树在表格之前加载且设置同步，防止页面加载布局出现竖线问题
                    success: function (data) {
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
                            tree
                                .render({
                                    elem: '#menu_info', //绑定元素
                                    data: menuData,
                                    id: 'menu_info',
                                    showCheckbox: false,
                                    onlyIconControl: true,
                                    click: function (obj) {
                                        //刷新表格数据
                                        var data = obj.data.children;
                                        var datas = [];
                                        if (data.length > 0) {
                                            for (var i = 0; i < data.length; i++) {
                                                for (var c = 0; c < menu_data.length; c++) {
                                                    for (var b = 0; b < menu_data[c].child.length; b++) {
                                                        if (data[i].title == menu_data[c].child[b].menu_name) {
                                                            datas
                                                                .push(menu_data[c].child[b]);
                                                        }
                                                    }
                                                }
                                            }
                                            table
                                                .reload(
                                                    'menudatagrid',
                                                    {
                                                        data: datas,
                                                        url: ''
                                                    });
                                        } else {
                                            table
                                                .reload(
                                                    'menudatagrid',
                                                    {
                                                        data: data,
                                                        url: ''
                                                    });
                                        }
                                    }
                                });
                        } else {
                            layer.msg(data.msg, {
                            	offset: '25%',
                                icon: 5
                            });
                        }
                    },
                    error: function (res) {
                        layer.msg(res.msg, {
                        offset: '25%',
                            icon: 5
                        });
                    }
                });
                //树形菜单--------------------------------------

                //加载数据表格
                table
                    .render({
                        elem: '#menudatagrid',
                        id: 'menudatagrid',
                        url: basurl + 'menu/find',
                        limits: [10, 20, 30, 50, 100, 300, 600,
                            1000],
                        cols: [[
                            {
                                field: 'menu_id',
                                type: 'checkbox'
                            },
                            {
                                field: 'menu_name',
                                title: '菜单名称',
                                align: 'left'
                            },
                            {
                                field: 'menu_code',
                                title: '菜单编码',
                                align: 'left'
                            },
                            {
                                field: 'menu_nav',
                                title: '菜单导航',
                                align: 'left'
                            },
                            {
                                field: 'menu_url',
                                title: '菜单URL',
                                align: 'left'
                            },
                            {
                                field: 'menu_cls',
                                title: '菜单图标',
                                align: 'left'
                            },
                            {
                                field: 'menu_order',
                                title: '菜单顺序',
                                align: 'left'
                            },
                            {
                                field: 'menu_status',
                                title: '菜单状态',
                                align: 'left',
                                templet: function (d) {
                                    if (d.menu_status == 0) {
                                        return "<span style='color:red'>禁用</span>";
                                    } else {
                                        return "正常";
                                    }
                                }
                            }, {
                                field: 'menu_remark',
                                title: '菜单说明',
                                align: 'left'
                            },]],
                        page: true,
                        done: function (res, curr, count) {
                            $(".laytable-cell-checkbox").css(
                                "padding", "5px");
                            signleSelect($, 'menudatagrid');
                        }
                    });

                //add menu
                $(".menu_add").click(function () {
                    addAndEdit();
                });
                //监听提交
                form.on('submit(menuSubmit)', function (data) {
                    var datas = data.field;
                    var url = "${pageContext.request.contextPath}/menu/menu_add";
                    if(datas.menu_id){
                    	url = "${pageContext.request.contextPath}/menu/menu_edit";
                    }
                    var add_edit = layer.load();
                    $.ajax({
                        url: url,
                        method: 'post',
                        data: datas,
                        success: function (r) {
                        	layer.close(add_edit);
                            if (r.success) {
                                layer.msg(r.msg, { offset: '25%',icon: 6 });
                            } else {
                                layer.msg(r.msg, { offset: '25%',icon: 5 });
                            }
                        }
                    });
                    return false;
                });
                //edit menu
                $(".menu_edit").click(function () {
                    
                    var data = table.checkStatus('menudatagrid').data;
                    if(data.length!=1){
                    	layer.msg("请选择一条数据修改",{offset: '25%',icon:5});
                    	return false;
                    }
                    addAndEdit(data);
                });
                
                 $(".resert_btn").click(function() {
						location.reload();
					});
					
					
                //del menu
                $(".menu_del").click(function () {
                	var data = table.checkStatus('menudatagrid').data;
                    if(data.length!=1){
                    	layer.msg("请选择一条数据修改",{offset: '25%',icon:5});
                    	return false;
                    }
                     layer.confirm('您是否要确认执行删除？', {
                     offset: '25%',
		                    btn: ['执行', '取消'] //按钮      
		                }, function () {
		                var del =  layer.load();
		                    $.ajax({
		                        url: "${pageContext.request.contextPath}/menu/menu_del",
		                        method: 'get',
		                        data: {
		                        	menu_id:data[0].menu_id
		                        },
		                        success: function (r) {
		                        	layer.close(del);
		                            if (r.success) {
		                                layer.msg(r.msg, { offset: '25%',icon: 6 });
		                            	location.reload();
		                            } else {
		                                layer.msg(r.msg, { offset: '25%',icon: 5 });
		                            }
		                        }
		                    });
		                });
                
                   
                });

                function addAndEdit(data) {
                    if(data){
                    	$("input[name='menu_status'][value="+ data[0].menu_status + "]").prop('checked', true);
                    	form.val("menu_form", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
							  "menu_id": data[0].menu_id // "name": "value"
							  ,"menu_code": data[0].menu_code
							  ,"menu_name": data[0].menu_name
							  ,"menu_remark": data[0].menu_remark
							  ,"menu_nav": data[0].menu_nav
							  ,"menu_url": data[0].menu_url
							  ,"menu_cls": data[0].menu_cls
							  ,"menu_order": data[0].menu_order
							});
                    }
                    layui.layer.open({
                        type: 1, //弹窗类型
                        title: "添加菜单", //显示标题
                        anim: 0,
                        shade: 0.3,
                        offset: '100px',
                        shadeClose: false, //显示模态窗口
                        area: ['700px',
                            '500px'], //宽高
                        content: $('#menuAddEdit'),
                        cancel: function (
                            index, layero) {
                            layer.close(index);
                            location.reload();
                            return false;
                        },
                        success: function () {
                            treeSelect.render({
                                // 选择器
                                elem: '#tree',
                                // 数据
                                data: '${pageContext.request.contextPath}/menu/find_menu_tree',
                                // 异步加载方式：get/post，默认get
                                type: 'get',
                                // 占位符
                                placeholder: '选择上级菜单',
                                // 是否开启搜索功能：true/false，默认false
                                search: true,
                                // 一些可定制的样式
                                style: {
                                    folder: {
                                        enable: true
                                    },
                                    line: {
                                        enable: true
                                    }
                                },
                                // 点击回调
                                click: function (d) {
                                    $("input[name=menu_pid]").val(d.current.id);
                                },
                                // 加载完成后的回调函数
                                success: function (d) {
	                                 if(data){
	                                 	if(data[0].menu_pid=="0"){
	                                 		 $("input[name=menu_pid]").val(data[0].menu_id);
		                                 	 //选中节点，根据id筛选
	                                    	treeSelect.checkNode('tree', data[0].menu_id);
	                                 	}else{
	                                 		 $("input[name=menu_pid]").val(data[0].menu_pid);
		                                 	 //选中节点，根据id筛选
	                                    	treeSelect.checkNode('tree', data[0].menu_pid);
	                                 	}
	                                 }
                                    //选中节点，根据id筛选
                                    //treeSelect.checkNode('tree', 2);
                                    //                获取zTree对象，可以调用zTree方法
                                    var treeObj = treeSelect.zTree('tree');
                                    //                刷新树结构
                                    treeSelect.refresh('tree');
                                }
                            });
                        }
                    });
                }
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

    //处理点击菜单时的数据
    function menuClick(data) {
        var data = [];

        return data;
    }
</script>