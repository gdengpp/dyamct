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
								<input type="text" value="" placeholder="登录账号"
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
			url : basurl + 'log/getLogAll',
			limits : [ 10, 20, 30, 50, 100, 300, 600, 1000 ],
			cols : [ [ {
				field : 'login_account',
				title : '登录账号',
				align : 'left'
			}, {
				field : 'login_time',
				title : '登录时间',
				align : 'left',
				templet : function(d) {
					return new Date(d.login_time).Format("yyyy-MM-dd hh:mm:ss");
				}
			} ] ],
			page : true,
			done : function(res, curr, count) {
				$(".laytable-cell-checkbox").css("padding", "5px");
				signleSelect($, 'logdatagrid');
			}
		});

		Date.prototype.Format = function(fmt) { //author: meizz 
			var o = {
				"M+" : this.getMonth() + 1, //月份 
				"d+" : this.getDate(), //日 
				"H+" : this.getHours(), //小时 
				"h+" : this.getHours(), //小时 
				"m+" : this.getMinutes(), //分 
				"s+" : this.getSeconds(), //秒 
				"q+" : Math.floor((this.getMonth() + 3) / 3), //季度 
				"S" : this.getMilliseconds()
			//毫秒 
			};
			if (/(y+)/.test(fmt))
				fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
						.substr(4 - RegExp.$1.length));
			for ( var k in o)
				if (new RegExp("(" + k + ")").test(fmt))
					fmt = fmt.replace(RegExp.$1,
							(RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k])
									.substr(("" + o[k]).length)));
			return fmt;
		}
	});
</script>