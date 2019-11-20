<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>carousel模块快速使用</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../layui/layui.js"></script>
    <script src="../js/jquery-2.1.1.js"></script>
    <style>
        .layui-input{
            width:200px;
        }
        h1,button{margin-left:130px;}
    </style>
    <script>
        $(function(){
            $("button").click(function(){
                //取得表单的值
                var name = $("input[name=name]").val();
                var province = $("input[name=province]").val();
                var city = $("input[name=city]").val();
                var country = $("input[name=country]").val();
                var village = $("input[name=village]").val();
                var code = $("input[name=code]").val();
                var lxfs = $("input[name=lxfs]").val();
                var bankname = $("input[name=bankname]").val();
                var banknumber = $("input[name=banknumber]").val();
                var rjcsh = $("input[name=rjcsh]").val();
                var pkyy = $("input[name=pkyy]").val();
                var time = $("input[name=time]").val();
                var zfmj = $("input[name=zfmj]").val();
                var bfdw = $("input[name=bfdw]").val();
                var familynumber = $("input[name=familynumber]").val();

                //执行ajax请求
                $.ajax({
                    url:'${pageContext.request.contextPath}/addPku.action',
                    method:'POST',
                    data:{"name":name,"province":province,
                        "city":city,"country":country,"village":village,
                        "code":code,"lxfs":lxfs,"bankname":bankname,
                        "banknumber":banknumber,"rjcsh":rjcsh,"pkyy":pkyy,
                        "time":time,"zfmj":zfmj,"bfdw":bfdw,
                        "familynumber":familynumber},
                    dataType:'text',
                    success:function(data){
                        alert(data);
                    }
                });
            });
        });
    </script>
</head>
<body>
<h1>添加数据</h1>
<div class="layui-form-item">
    <label class="layui-form-label">用户名称</label>
    <div class="layui-input-block">
        <input type="text" name="name" required  lay-verify="required" placeholder="请输入用户名称" autocomplete="off" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">省份</label>
    <div class="layui-input-block">
        <input type="text" name="province" required  lay-verify="required"  placeholder="请输入省份" autocomplete="off" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">所在市</label>
    <div class="layui-input-block">
        <input type="text" name="city" required  lay-verify="required" placeholder="请输入所在市" autocomplete="off" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">所在县</label>
    <div class="layui-input-block">
        <input type="text" name="country" required  lay-verify="required" placeholder="请输入所在县" autocomplete="off" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">村</label>
    <div class="layui-input-block">
        <input type="text" name="village" required  lay-verify="required"  placeholder="请输入村" autocomplete="off" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">建档时间</label>
    <div class="layui-input-block">
        <input type="text" name="time" required  lay-verify="required" placeholder="请输入建档时间" autocomplete="off" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">邮政编码</label>
    <div class="layui-input-block">
        <input type="text" name="code" required  lay-verify="required" placeholder="请输入邮政编码" autocomplete="off" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">联系方式</label>
    <div class="layui-input-block">
        <input type="text" name="lxfs" required  lay-verify="required" placeholder="请输入联系方式" autocomplete="off" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">银行名称</label>
    <div class="layui-input-block">
        <input type="text" name="bankname" required  lay-verify="required"  placeholder="请输入银行名称" autocomplete="off" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
    <label class="layui-form-label">银行卡号</label>
    <div class="layui-input-block">
        <input type="text" name="banknumber" required  lay-verify="required" placeholder="请输入银行卡号" autocomplete="off" class="layui-input">
    </div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">贫困原因</label>
<div class="layui-input-block">
    <input type="text" name="pkyy" required  lay-verify="required"  placeholder="请输入贫困原因" autocomplete="off" class="layui-input">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">家庭成员</label>
<div class="layui-input-block">
    <input type="text" name="familynumber" required  lay-verify="required" placeholder="请输入家庭成员" autocomplete="off" class="layui-input">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">住房面积</label>
<div class="layui-input-block">
    <input type="text" name="zfmj" required  lay-verify="required" placeholder="请输入住房面积" autocomplete="off" class="layui-input">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">人均年收入</label>
<div class="layui-input-block">
    <input type="text" name="rjcsh" required  lay-verify="required" placeholder="请输入人均年收入" autocomplete="off" class="layui-input">
</div>
</div>
<div class="layui-form-item">
<label class="layui-form-label">帮扶单位</label>
<div class="layui-input-block">
    <input type="text" name="bfdw" required  lay-verify="required" placeholder="请输入帮扶单位" autocomplete="off" class="layui-input">
</div>
</div>
<button class="layui-btn">确定添加</button>
</body>
</html>