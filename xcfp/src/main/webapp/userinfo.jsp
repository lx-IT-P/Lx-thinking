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
			<form class="layui-form">
				<div class="layui-form-item">	
				</div>
				<div class="layui-form-item">	
					<label class="layui-form-label">ID</label>
					<div class="layui-input-block">
						<input name="id" class="layui-input" type="text" placeholder="${sessionScope.user.id}" autocomplete="off"/>

					</div>
				</div>
				<div class="layui-form-item">	
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-block">
						<input name="id" class="layui-input" type="text" placeholder="${sessionScope.user.username}" autocomplete="off"/>
					</div>
				</div>
				<div class="layui-form-item">	
					<label class="layui-form-label">邮箱</label>
					<div class="layui-input-block">
						<input name="id" class="layui-input" type="text" placeholder="${sessionScope.user.email}" autocomplete="off"/>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">角色</label>
					<div class="layui-input-block">
						<input name="id" class="layui-input" type="text" placeholder="${sessionScope.user.role}" autocomplete="off"/>
					</div>
				</div>
				<%--<div class="layui-form-item">	--%>
					<%--<label class="layui-form-label">角色</label>--%>
					<%--<div class="layui-input-block">--%>
				    	<%--<input type="radio" name="sex" value="${sessionScope.user.role}" title="扶贫办" checked />--%>
				    	<%--<input type="radio" name="sex" value="${sessionScope.user.role}" title="扶贫单位" />--%>
						<%--<input type="radio" name="sex" value="${sessionScope.user.role}" title="帮扶联系人" />--%>
				    <%--</div>--%>
				<%--</div>--%>
				<%--<div class="layui-form-item layui-form-text">--%>
				    <%--<label class="layui-form-label">个人简介</label>--%>
				    <%--<div class="layui-input-block">--%>
				      <%--<textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>--%>
				    <%--</div>--%>
				<%--</div>--%>
				<%--<div class="layui-form-item">--%>
				    <%--<div class="layui-input-block">--%>
				    	<%--<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>--%>
				    	<%--<button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
				    <%--</div>--%>
				<%--</div>--%>
			</form>	
		</div>
		<script src="./js/layui/layui.js"></script>
		<script>
			layui.use(['element','layer','form'],function(){
				var element = layui.element
				,layer = layui.layer
				,form = layui.form
				,$ = layui.jquery;
			})	
		</script>		
	</body>
</html>
