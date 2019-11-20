<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="js/layui/css/layui.css" />
	</head>
	<body class="layui-layout-body">
		<div class="layui-fluid">
			<div class="layui-card">
				<div class="layui-card-header">网站设置</div>
				<div class="layui-card-body">
				    <form class="layui-form" action="">
						<div class="layui-form-item">
							<label class="layui-form-label">网站名称</label>
							 <div class="layui-input-block">
							 	<input type="text" name="title" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
							 </div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">网站域名</label>
							 <div class="layui-input-block">
							 	<input type="text" name="weburl" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
							 </div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">缓存</label>
							 <div class="layui-input-inline" style="width: 80px;">
							 	<input type="text" name="weburl" required  lay-verify="required" placeholder="0" autocomplete="off" class="layui-input">
							 </div>
							 <div class="layui-form-mid layui-word-aux">
							 	分钟 本地开发一般推荐设置为 0，线上环境建议设置为 10。
							 </div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">首页标题</label>
							 <div class="layui-input-block">
							 	<textarea name="title" class="layui-textarea"></textarea>
							 </div>
						</div>
						<div class="layui-form-item">
							 <div class="layui-input-block">
							 	<button class="layui-btn" lay-filter="set_website" lay-submit="">确认保存</button>
							 </div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<script src="js/layui/layui.js"></script>
		<script>
			layui.use(['element','layer','form'],function(){
				,layer = layui.layer
				,form = layui.form
				,$ = layui.jquery;
			})
		</script>
	</body>
</html>
