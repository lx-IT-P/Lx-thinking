<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="js/layui/css/layui.css" />
	<link rel="stylesheet" href="css/login.css" />
	<script type="text/javascript" src="js/jquery.md5.js"></script>
</head>
<body class="layui-layout-body" onkeydown="onEnter();">
<div class="layui-fluid" style="padding: 0px;">
	<canvas id="particle"></canvas>
	<div class="layui-form layui-form-pane layui-admin-login">
		<div class="layui-admin-login-header">
			<h1>后台登陆</h1>
			<p>BY LX</p>
		</div>

		<div class="layui-form-item">

			<label class="layui-form-label"><i class="layui-icon layui-icon-username"></i></label>
			<form action="${pageContext.request.contextPath }/userlogin.action" method="post">
			<div class="layui-input-block">
				<input name="username" class="layui-input" type="text" placeholder="请输入账号" autocomplete="off" />
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><i class="layui-icon layui-icon-password"></i></label>
			<div class="layui-input-block">
				<input name="password" class="layui-input" type="password" placeholder="请输入密码" autocomplete="off" onblur="mdjia()"/>
			</div>
		</div>
		<div class="layui-form-item">
			<input type="checkbox" pane name="remember" title="记住密码" lay-skin="primary">
			<a href="javascript:;" style="margin-top: 10px;float: right;color: #009688;">忘记密码?</a>
		</div>
		<div class="layui-form-item">
			<div class="layui-btn-container">
				<button class="layui-btn layui-btn-fluid" lay-submit lay-filter="login">
					<i class="layui-icon layui-icon-ok-circle"></i>登陆
				</button>
			</div>
			</form>
			<div class="layui-btn-container">
				<button class="layui-btn layui-btn-fluid" lay-submit lay-filter="register">
					<i class="layui-icon layui-icon-add-circle"></i>注册
				</button>
			</div>
		</div>

		<!--底部-->
		<div class="layui-footer">© 2019 LX</div>
	</div>

</div>
<script src="./js/layui/layui.js"></script>
<script type="text/javascript" src="js/particle.min.js" ></script>
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
            // var obj = data.field;
            // if(obj.username=="admin"&&obj.userpassword=="123456"){
                window.location.href="./index.jsp";
            // }else{
            //     layer.msg('账号或密码不正确', {icon: 5});
            //}
            <%--var id=$("#username").val();--%>
            <%--var pwd=$("#password").val();--%>
            <%--// alert(id+" "+pwd);--%>
            <%--$.post("${pageContext.request.contextPath }/user/userlogin.action",--%>
            <%--{username:id,password:pwd},function (data) {--%>
            <%--console.log(data);--%>
            <%--window.location.href="./index.jsp";--%>
            <%--},"json")--%>
        });
        //监控注册
        form.on('submit(register)', function(data){
            layer.open({
                title:"用户注册",
                type: 2,
                content:"./register.jsp",
                area: ['400px', '300px']
            });
        });
    })
    //登陆按钮绑定回车
    function onEnter(){
        if(window.event.keyCode == 13){
            document.getElementsByTagName("button")[0].click();
        }
    }
    var particle = new Particle('#particle', {
        effect: 'line'
    });
</script>
</body>
</html>
