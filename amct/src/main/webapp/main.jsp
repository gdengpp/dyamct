<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>测试系统</title>
<jsp:include page="index.jsp"></jsp:include>
<style type="text/css">
.layui-layout-admin .layui-logo {
	color: #fff
}
</style>
</head>

<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header" style="background-color: #0276d2;">
			<div class="layui-logo">测试系统</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left top_menu" lay-filter="top_nav">


			</ul>
			<ul class="layui-nav layui-layout-right top_right"
				lay-filter="top_right">
				<li class="layui-nav-item"><a href="javascript:;"> <img
						src="${pageContext.request.contextPath}/static/image/face.png"
						style="border: solid 1px white;" class="layui-nav-img">
						${user.user_name }
				</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="javascript:;">基本资料</a>
						</dd>
						<dd>
							<a href="javascript:;">修改密码</a>
						</dd>
						<dd>
							<a href="javascript:;" class="loginout">退出</a>
						</dd>
					</dl></li>
			</ul>

		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree left_menu" lay-filter="left_nav">

				</ul>
			</div>
		</div>

		<div class="layui-body" style="padding: 10px;overflow: hidden;">
			<!-- 内容主体区域 -->
			<div class="layui-breadcrumb nav"></div>
			<div class="main_right">
				<iframe frameborder="0" scrolling="yes" style="width: 100%" src="common/main.jsp"
					id="dbody"> </iframe>
			</div>
		</div>

		<div class="layui-footer foot">
			<!-- 底部固定区域 -->
			© 测试系统
		</div>
	</div>
</body>
<script>
	var element;
	var frameheight = $(window).height();
	layui.use([ 'element', 'layer', 'upload', 'form' ], function() {
		element = layui.element;
		var layer = layui.layer;
		element.init();
		//检测是否登录===============================================
		$(function() {
			//初始化内容高
			var frame = $("#dbody");
			frame.css("height", frameheight);
			//加载顶部菜单===============================================
			$.ajax({
				url : "${pageContext.request.contextPath}/menu/find_menu",
				method : "get",
				success : function(menu) {
					var headHtml = "";
					for (var i = 0; i < menu.length; i++) {
						headHtml += "<li class='layui-nav-item'>"
								+ "<a href='javascript:;'>" + menu[i].menu_name
								+ "</a>";
						headHtml += "</li>";
					}
					$(".top_menu").html(headHtml);
					//渲染菜单
					element.render();

					//点击头部菜单加载左侧菜单
					element.on('nav(top_nav)', function(elem) {
						var name = elem[0].text;
						for (var m = 0; m < menu.length; m++) {
							if (name == menu[m].menu_name) {
								if(menu[m].menu_status==0){
									layer.msg("菜单已禁用",{icon:5});
									return false;
								}
								$(".nav").html(menu[m].menu_nav);
								$("iframe").attr("src", menu[m].menu_url);
								$(".main_right").css("height", frameheight);
								appendhtml(menu[m].child, "left_menu");
							}
						}
					});
				},
				error : function() {
					layer.msg("加载菜单失败", {
						icon : 5
					});
				},
			});
			//头部菜单结束================================================

		});
		
		$(".loginout").click(function(){
			layer.confirm('是否退出登录？', {
				btn : [ '确定', '取消' ]
			//按钮      
			}, function() {
				location.href="${pageContext.request.contextPath}/user/loginout";
			});
		});
	});

	function appendhtml(data, htm) {
		var headHtml = "";
		var icon = "";
		for (var i = 0; i < data.length; i++) {
			if (data[i].menu_cls) {
				icon = data[i].menu_cls;
			}
			if (data[i].child.length == 0) {
				headHtml += "<li class='layui-nav-item'>"
						+ "<a href='javascript:;' onclick='" + htm + "(\""+data[i].menu_status + "\",\""
						+ data[i].menu_nav + "\",\"" + data[i].menu_url
						+ "\",\"" + data[i].menu_id + "\")'>"
						+ "<i class=\"layui-icon\">" + icon + "</i>"
						+ data[i].menu_name + "</a>";
				headHtml += "</li>";
			} else {
				headHtml += "<li class='layui-nav-item'><a href='javascript:void(0);'>"
						+ "<i class=\"layui-icon\">"
						+ icon
						+ "</i>"
						+ data[i].menu_name + "</a>";
				headHtml += "<dl class='layui-nav-child'>";
				for (var b = 0; b < data[i].child.length; b++) {
					var iconchild = "";
					if (data[i].child[b].menu_cls) {
						iconchild = data[i].child[b].menu_cls;
					}
					headHtml += "<dd><a href='javascript:;' onclick='" + htm
							+ "(\""+ data[i].menu_status + "\",\"" + data[i].child[b].menu_nav + "\",\""
							+ data[i].child[b].menu_url + "\",\""
							+ data[i].child[b].menu_id + "\")'>"
							+ "<i class=\"layui-icon\">" + iconchild + "</i>"
							+ data[i].child[b].menu_name + "</a></dd>";
				}
				headHtml += "</dl></li>";
			}
		}
		$("." + htm).html(headHtml);
		element.render();
	}
	//点击左侧导航
	function left_menu(status,nav, url, id) {
		if(status==0){
			layer.msg("菜单已禁用",{icon:5});
			return false;
		}
		$(".nav").html(nav);
		$("iframe").attr("src", url);
		$(".main_right").css("height", frameheight);
	}
</script>
</html>
