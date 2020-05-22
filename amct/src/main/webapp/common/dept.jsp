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
                                <a class="layui-btn layui-btn-primary dept_add"> <i class="layui-icon">&#xe654;</i>新增
                                </a> <a class="layui-btn layui-btn-primary dept_edit"> <i
                                        class="layui-icon">&#xe642;</i>修改
                                </a>
                                <c:if test="${user.role.role_code=='sysadmin' }">
                                    <a class="layui-btn layui-btn-primary dept_del"> <i
                                            class="layui-icon">&#xe640;</i>删除
                                    </a>
                                </c:if>
                                 <a class="layui-btn layui-btn-primary resert_btn"><i
										class="layui-icon">&#xe669;</i>刷新 </a>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form dept_list">
                        <table class="layui-hide" id="deptdatagrid" lay-data="{id: 'deptdatagrid'}"
                            lay-filter="deptTableFilter"></table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- add/edit -->
<div id="deptAddEdit" style="display:none;padding:10px;">
    <form class="layui-form" action="" lay-filter="dept_form">
        <input type="text" name="dept_id" autocomplete="off" class="layui-input" style="display:none">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">部门名</label>
                <div class="layui-input-inline">
                    <input type="text" name="dept_name" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">上级部门</label>
                <div class="layui-input-inline">
                    <input type="text" id="tree" name="dept_pid" lay-filter="tree" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">部门编码</label>
                <div class="layui-input-inline">
                    <input type="text" name="dept_code" autocomplete="off" class="layui-input">
                </div>
            </div>
        
            <div class="layui-inline">
                <label class="layui-form-label">部门排序</label>
                <div class="layui-input-inline">
                    <input type="number" name="dept_order" autocomplete="off" value=1 class="layui-input">
                </div>
            </div>
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <textarea id="dept_remark" name="dept_remark" placeholder="备注" class="layui-textarea" rows="2"
                    style="margin-top: 0px; margin-bottom: 0px; height: 101px;width:90%"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block" style="margin-left: 78%">
                <button type="submit" class="layui-btn" lay-submit="" lay-filter="deptSubmit">立即提交</button>
            </div>
        </div>
    </form>
</div>

<script>
    var dept_data;
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
                    url: "${pageContext.request.contextPath}/dept/find_dept",
                    method: 'get',
                    async: false,//左侧树在表格之前加载且设置同步，防止页面加载布局出现竖线问题
                    success: function (data) {
                        dept_data = data;
                        // 点击菜单查询详细情况
                        if (data.length > 0) {
                            var deptData = [];
                            for (var i = 0; i < data.length; i++) {
                                var children = [];
                                var obj = {};
                                obj.id = data[i].dept_id;
                                obj.title = data[i].dept_name;
                                obj.spread = true;
                                if (data[i].child
                                    && data[i].child.length > 0) {
                                    for (var j = 0; j < data[i].child.length; j++) {
                                        var objleft = {};
                                        var childrenleft = [];
                                        objleft.id = data[i].child[j].dept_id;
                                        objleft.title = data[i].child[j].dept_name;
                                        objleft.spread = true;
                                        if (data[i].child[j].child
                                            && data[i].child[j].child.length > 0) {
                                            for (var m = 0; m < data[i].child[j].child.length; m++) {
                                                var objleftchild = {};
                                                objleftchild.id = data[i].child[j].child[m].dept_id;
                                                objleftchild.title = data[i].child[j].child[m].dept_name;
                                                objleftchild.spread = true;
                                                if (data[i].child[j].child[m].child.length > 0) {
                                                    deptDeal(
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
                                deptData.push(obj);
                            }
                            tree
                                .render({
                                    elem: '#menu_info', //绑定元素
                                    data: deptData,
                                    id: 'menu_info',
                                    showCheckbox: false,
                                    onlyIconControl: true,
                                    click: function (obj) {
                                        //刷新表格数据
                                        var data = obj.data.children;
                                        var datas = [];
                                        if (data.length > 0) {
                                            for (var i = 0; i < data.length; i++) {
                                                for (var c = 0; c < dept_data.length; c++) {
                                                    for (var b = 0; b < dept_data[c].child.length; b++) {
                                                        if (data[i].title == dept_data[c].child[b].dept_name) {
                                                            datas
                                                                .push(dept_data[c].child[b]);
                                                        }
                                                    }
                                                }
                                            }
                                            table
                                                .reload(
                                                    'deptdatagrid',
                                                    {
                                                        data: datas,
                                                        url: ''
                                                    });
                                        } else {
                                            table
                                                .reload(
                                                    'deptdatagrid',
                                                    {
                                                        data: data,
                                                        url: ''
                                                    });
                                        }
                                    }
                                });
                        } else {
                            layer.msg(data.msg, {
                                icon: 5,
                                offset: '25%',
                            });
                        }
                    },
                    error: function (res) {
                        layer.msg(res.msg, {
                            icon: 5,
                            offset: '25%',
                        });
                    }
                });
                //树形菜单--------------------------------------

                //加载数据表格
                table
                    .render({
                        elem: '#deptdatagrid',
                        id: 'deptdatagrid',
                        url: basurl + 'dept/find',
                        limits: [10, 20, 30, 50, 100, 300, 600,
                            1000],
                        cols: [[
                            {
                                field: 'dept_id',
                                type: 'checkbox'
                            },
                            {
                                field: 'dept_name',
                                title: '部门名称',
                                align: 'left'
                            },
                            {
                                field: 'dept_code',
                                title: '部门编码',
                                align: 'left'
                            },
                            {
                                field: 'dept_order',
                                title: '顺序',
                                align: 'left'
                            },
                            {
                                field: 'dept_remark',
                                title: '菜单说明',
                                align: 'left'
                            },]],
                        page: true,
                        done: function (res, curr, count) {
                            $(".laytable-cell-checkbox").css(
                                "padding", "5px");
                            signleSelect($, 'deptdatagrid');
                        }
                    });

                //add dept
                $(".dept_add").click(function () {
                    addAndEdit();
                });
                //监听提交
                form.on('submit(deptSubmit)', function (data) {
                    var datas = data.field;
                    var url = "${pageContext.request.contextPath}/dept/dept_add";
                    if(datas.dept_id){
                    	url = "${pageContext.request.contextPath}/dept/dept_edit";
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
                //edit dept
                $(".dept_edit").click(function () {
                    
                    var data = table.checkStatus('deptdatagrid').data;
                    if(data.length!=1){
                    	layer.msg("请选择一条数据修改",{icon:5,offset: '25%',});
                    	return false;
                    }
                    addAndEdit(data);
                });
                $(".resert_btn").click(function() {
					location.reload();
					});
                //del dept
                $(".dept_del").click(function () {
                	var data = table.checkStatus('deptdatagrid').data;
                    if(data.length!=1){
                    	layer.msg("请选择一条数据删除",{icon:5,offset: '25%',});
                    	return false;
                    }
                     layer.confirm('您是否要确认执行删除？', {
                     		offset: '25%',
		                    btn: ['执行', '取消'] //按钮      
		                }, function () {
		                var del =  layer.load();
		                    $.ajax({
		                        url: "${pageContext.request.contextPath}/dept/dept_del",
		                        method: 'get',
		                        data: {
		                        	dept_id:data[0].dept_id
		                        },
		                        success: function (r) {
		                        	layer.close(del);
		                            if (r.success) {
		                                layer.msg(r.msg, { icon: 6 ,offset: '25%',});
		                              	location.reload();
		                            } else {
		                                layer.msg(r.msg, { icon: 5,offset: '25%', });
		                            }
		                        }
		                    });
		                });
                
                   
                });

                function addAndEdit(data) {
                    if(data){
                    	form.val("dept_form", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
							  "dept_id": data[0].dept_id // "name": "value"
							  ,"dept_code": data[0].dept_code
							  ,"dept_name": data[0].dept_name
							  ,"dept_remark": data[0].dept_remark
							  ,"dept_order": data[0].dept_order
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
                            '400px'], //宽高
                        content: $('#deptAddEdit'),
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
                                data: '${pageContext.request.contextPath}/dept/find_dept_tree',
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
                                    $("input[name=dept_pid]").val(d.current.id);
                                },
                                // 加载完成后的回调函数
                                success: function (d) {
	                                 if(data){
	                                 	if(data[0].dept_pid=="0"){
	                                 		 $("input[name=dept_pid]").val(data[0].dept_id);
		                                 	 //选中节点，根据id筛选
	                                    	treeSelect.checkNode('tree', data[0].dept_id);
	                                 	}else{
	                                 		 $("input[name=dept_pid]").val(data[0].dept_pid);
		                                 	 //选中节点，根据id筛选
	                                    	treeSelect.checkNode('tree', data[0].dept_pid);
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
    function deptDeal(data, objleftchild) {
        for (var j = 0; j < data.length; j++) {
            var objleft = {};
            var childrenleft = [];
            objleft.id = data[j].dept_id;
            objleft.title = data[j].dept_name;
            objleft.spread = true;
            childrenleft.push(objleft);
            if (data[j].child.length > 0) {
                deptDeal(data[j].child, objleftchild);
            }
            objleftchild.children = childrenleft;
        }
    }

    //处理点击菜单时的数据
    function deptClick(data) {
        var data = [];

        return data;
    }
</script>