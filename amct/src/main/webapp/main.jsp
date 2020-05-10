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
							<a href="javascript:;">退出</a>
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
			<span class="layui-breadcrumb nav"></span>
			<div class="main_right">
			    <iframe frameborder="0" scrolling="yes" style="width: 100%" src="" id="dbody">
			    </iframe>
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
	layui.use([ 'element', 'layer', 'upload', 'form' ], function() {
		 element = layui.element;
		var layer = layui.layer;
		//检测是否登录===============================================
		$(function() {
			if (${user==null}) {
				layer.msg("登录过期，请重新登录", {
					icon : 5
				});
				location.href = "login.jsp";
			};

			//加载顶部菜单===============================================
			$.ajax({
				url : "${pageContext.request.contextPath}/menu/find_menu",
				method : "get",
				data : {
					type : 1
				},
				success : function(menu) {
					var data = menuDeal(menu);
					//渲染菜单
					appendhtml(data,"top_menu");
					element.render();
				},
				error : function() {
					layer.msg("加载菜单失败", {
						icon : 5
					});
				},
			});
			//头部菜单结束================================================
			
		});
	});
	//点击头不导航显示主题
	function touMenu(nav,url){
			$(".nav").html(nav);
			$("iframe").attr("src",url);
			var frame = $("#dbody");
	        var frameheight = $(window).height();
	        frame.css("height",frameheight);
			$(".main_right").css("height",frameheight);
			//加载左侧菜单
			menuLeft();
		}
	//加载左侧菜单
	function menuLeft(){
		$.ajax({
				url : "${pageContext.request.contextPath}/menu/find_menu",
				method : "get",
				data : {
					type : 2
				},
				success : function(menu) {
					var data = menuDeal(menu);
					appendhtml(data,"left_menu");
				},
				error : function() {
					layer.msg("加载菜单失败", {
						icon : 5
					});
				},
			});
	};
	//处理菜单数据
	function menuDeal(data){
		var arr = [];
		for(var i=0;i<data.length;i++){
			var obj={};
			var child = [];
			if(data[i].menu_pid=="0"){
				var id = data[i].menu_id;
				for(var b=0;b<data.length;b++){
					if(i!=b){
						if(id==data[b].menu_pid){
							child.push(data[b]);
							data[i].child = child;
							obj = data[i];
							arr.push(obj);
						}
					}
					if(b==data.length-1){
						if(child.length==0){
							data[i].child = child;
							obj = data[i];
							arr.push(obj);
						}
					}
				}
			}
		}
		$.unique(arr);
		return arr;
	};
	
	function appendhtml(data,htm){
	var headHtml = "";
		for(var i=0;i<data.length;i++){
				if(data[i].child.length==0){
					var icon = "&#xe68c;";
						if(data[i].menu_cls){
							icon=data[i].menu_cls;
						}
					headHtml += "<li class='layui-nav-item'>"+
					"<a href='javascript:;' onclick='touMenu(\""+data[i].menu_nav+"\",\""+data[i].menu_url+"\")'>"+
								"<i class='layui-icon'>"+icon+"</i>"
								+ data[i].menu_name
								+ "</a>";
					headHtml += "</li>";
				}else{
					headHtml += "<li class='layui-nav-item'><a href='javascript:void(0);'>"
								+ data[i].menu_name
								+ "</a>";
					headHtml+="<dl class='layui-nav-child'>";
					for(var b=0;b<data[i].child.length;b++){
						var icon = "&#xe68c;";
						if(data[i].child[b].menu_cls){
							icon=data[i].child[b].menu_cls;
						}
						headHtml+="<dd><a href='javascript:;' onclick='touMenu(\""+data[i].child[b].menu_nav+"\",\""+data[i].child[b].menu_url+"\")'>"+
									"<i class='layui-icon'>"+icon+"</i>"
									+ data[i].child[b].menu_name+ "</a></dd>";
					}
					headHtml += "</dl></li>";
				}
			}
			$("."+htm).html(headHtml);
			element.render();
	}
</script>
</html>
