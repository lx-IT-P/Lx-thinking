<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="js/layui/css/layui.css" />
		<script type="text/javascript" src="js/jquery.md5.js"></script>
	</head>
	<body class="layui-layout-body">
	<form action="${pageContext.request.contextPath}/userregister.action" method="post">
		<div class="layui-fluid">
			<div class="layui-form layui-form-pane">
				<div class="layui-form-item"></div>
				<div class="layui-form-item">
					<label class="layui-form-label"><i class="layui-icon layui-icon-username"></i></label>
					<div class="layui-input-block">
						<input name="username" placeholder="请输入账号" class="layui-input" type="text" autocomplete="off" />
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label"><i class="layui-icon layui-icon-password"></i></label>
					<div class="layui-input-block">
						<input name="password" placeholder="请输入密码" class="layui-input" type="password" autocomplete="off" onblur="mdjia()"/>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label"><i class="layui-icon layui-icon-face-smile"></i></label>
					<div class="layui-input-block">
						<input name="role" placeholder="请输入角色" class="layui-input" type="text" autocomplete="off" />
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-btn-container">
						<button class="layui-btn layui-btn-fluid" lay-submit lay-filter="login">
							<i class="layui-icon layui-icon-ok-circle"></i>提交
						</button>
					</div>
				</div>
			</div>
		</div>
	</form>
		<script src="./js/layui/layui.js"></script>
		<script>
            // function mdjia(){
            //     var password=$("#password").val();
            //     var pwd=$.md5(password);
            //     alert(pwd);
            //     $("#pwd").val(pwd);
            // }
			layui.use(['layer','form'],function(){
				var layer = layui.layer
				,form = layui.form
				,$ = layui.jquery;
				//监控表单提交
				form.on('submit(login)', function(data){
					var obj = data.field;
					 if(obj.username!=""&&obj.password!="") {
                         layer.msg('注册成功,3秒后关闭', {icon: 1});
                         setInterval(function () {
                             parent.layer.closeAll();
                         }, "3000")
                     }
					else
                {
                    layer.msg('请填写账号或密码', {icon: 5});
                }
				});
			})
			//登陆按钮绑定回车
			function onEnter(){
				if(window.event.keyCode == 13){
					document.getElementsByTagName("button")[0].click();
				}
			}
            <%--$("#login").click(function () {--%>
                <%--// window.location.href="index.jsp";--%>
                <%--var id = document.getElementById("username").value;--%>
                <%--var pwd = document.getElementById("userpassword").value;--%>
                <%--// alert(id+" "+pwd);--%>
                <%--$.post("${pageContext.request.contextPath}/userregister.do", {--%>
                    <%--username: id,--%>
                    <%--password: pwd--%>
                <%--},function (data) {--%>
                    <%--console.log("11111")--%>
                    <%--if(data=="0"){--%>
                        <%--alert("此用户名已存在");--%>

                    <%--}else if(data=="1"){--%>
                        <%--// alert("注册成功");--%>
                        <%--window.location.href="./index.jsp";--%>
                    <%--}--%>
                <%--});--%>
            <%--})--%>
		</script>
	</body>
</html>
