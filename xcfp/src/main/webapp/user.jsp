<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="js/layui/css/layui.css" />
		<style>
			.layui-admin-card-header{
				padding: 15px;
			}
			.layui-admin-card-body{
				height: 500px;
			}
		</style>
	</head>
	<body class="layui-layout-body">
		<div class="layui-fluid">
			<div class="layui-card">
				<div class="layui-form layui-card-header layui-admin-card-header">
					<div class="layui-form-item">
						<div class="layui-inline">
							<label class="layui-form-label">ID</label>
							<div class="layui-input-block">
								<input name="id" class="layui-input" type="text" placeholder="请输入" autocomplete="off"/>
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">用户名</label>
							<div class="layui-input-block">
								<input name="id" class="layui-input" type="text" placeholder="请输入" autocomplete="off"/>
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">邮箱</label>
							<div class="layui-input-block">
								<input name="id" class="layui-input" type="text" placeholder="请输入" autocomplete="off"/>
							</div>
						</div>
						<div class="layui-inline">
							<label class="layui-form-label">性别</label>
							<div class="layui-input-block">
								<input name="id" class="layui-input" type="text" placeholder="请输入" autocomplete="off"/>
							</div>
						</div>
					</div>
				</div>
				<div class="layui-card-body layui-admin-card-body">
				    <table id="datatable"></table>
				</div>
			</div>
		</div>
		<script src="./js/layui/layui.js"></script>
		<script>
			layui.use(['element','layer','form','table'],function(){
				var element = layui.element
				,layer = layui.layer
				,form = layui.form
				,table = layui.table
				,$ = layui.jquery;
				
				//第一个实例
				table.render({
				    elem: '#datatable'
				    ,height: 450
				    ,url: 'http://www.layui.com/demo/table/user/' //数据接口
				    ,page: true //开启分页
				    ,cols: [[ //表头
				      {field: 'id', title: 'ID', width:80, sort: true, fixed: 'left'}
				      ,{field: 'username', title: '用户名', width:80}
				      ,{field: 'sex', title: '性别', width:80, sort: true}
				      ,{field: 'city', title: '城市', width:80} 
				      ,{field: 'sign', title: '签名', width: 177}
				      ,{field: 'experience', title: '积分', width: 80, sort: true}
				      ,{field: 'score', title: '评分', width: 80, sort: true}
				      ,{field: 'classify', title: '职业', width: 80}
				      ,{field: 'wealth', title: '财富', width: 135, sort: true}
				    ]]
				  	});
				});
		</script>
	</body>
</html>
