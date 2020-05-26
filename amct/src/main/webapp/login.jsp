<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="index.jsp"></jsp:include>
<link
	href="${pageContext.request.contextPath}/static/css/login/style.css"
	rel="stylesheet" type="text/css" />
<link type="favicon" rel="shortcut icon"
	href="${pageContext.request.contextPath}/static/image/favicon.ico" />
<title>测试系统</title>
</head>

<body>
<body>
	<div class="login-box">
		<div class="logo">
			<!-- <img src="${pageContext.request.contextPath}/static/image/login/logo.png" alt=""> -->
			<h1>测试系统</h1>
		</div>
		<div class="input-list">
			<i class="icon"> <img
				src="${pageContext.request.contextPath}/static/image/login/icon-account.png"
				alt="">
			</i> <input type="text" class="text" name="account" id="account"
				placeholder="用户名">
		</div>
		<div class="input-list">
			<i class="icon"> <img
				src="${pageContext.request.contextPath}/static/image/login/icon-password.png"
				alt="">
			</i> <input id="password" name="password" type="password" class="text"
				placeholder="密码">
		</div>
		<div class="input-verify">
			<input name="captcha" type="text" class="verify" id="captcha"
				placeholder="请输入验证码">
			<div class="verify-code" id="msg">
				<img id="captchaImg"
					src="${pageContext.request.contextPath}/captcha/getCode.do"
					onclick="reloadCaptcha()" width="116" height="38">
			</div>
		</div>
		<button class="login" lay-submit="" lay-filter="login">登录</button>
	</div>
</body>
</body>
<script type="text/javascript">

	$(function(){
		if(${user!=null}){
			window.location.href="main.jsp";
		}
	});

	function reloadCaptcha() {
		document.getElementById('captchaImg').src = '${pageContext.request.contextPath}/captcha/getCode.do?'
				+ new Date();
	}
	layui.use([ 'layer', 'jquery' ], function() {
		var layer = layui.layer;
		var $ = layui.$;
		$(".login").click(function() {
			var account = $("#account").val();
			var password = $("#password").val();
			var captcha = $("#captcha").val();
			if (!account) {
				layer.msg("用户名不能为空", {
					icon : 5
				});
				return false;
			}
			if (!password) {
				layer.msg("密码不能为空", {
					icon : 5
				});
				return false;
			}
			if (!captcha) {
				layer.msg("验证码不能为空", {
					icon : 5
				});
				return false;
			}
			$.ajax({
				url : '${pageContext.request.contextPath}/user/login.do',
				method : 'get',
				data : {
					account : account,
					password : password,
					captcha : captcha
				},
				success : function(r) {
					if (r.success) {
						layer.msg(r.msg, {icon : 6});
						location.href = "main.jsp";
					}else{
						reloadCaptcha();
						layer.msg(r.msg, {icon : 5});
					}
				},
				error : function() {
					reloadCaptcha();
					layer.msg("网络错误，请稍后重试", {
						icon : 5
					});
				}
			});

		});
	});
</script>
</html>
