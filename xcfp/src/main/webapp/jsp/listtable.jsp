<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>数据表格</title>
    <link rel="stylesheet" href="../layui/css/layui.css">
    <script src="../layui/layui.js"></script>
    <script src="../js/jquery-2.1.1.js"></script>

</head>
<body>

<div class="demoTable">
    查询贫困户:
    <div class="layui-inline">
        <input class="layui-input" name="name" id="demoReload" autocomplete="off">
    </div>
    <button class="layui-btn" data-type="reload">搜索</button>
</div>

<table class="layui-hide" id="demo" lay-filter="demo"></table>

<!-- <script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container demoTable">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
    <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
  </div>
</script>   -->
<form method="POST"  enctype="multipart/form-data" id="form1" action="form">

    <label>上传文件: </label>
    <input id="upfile" type="file" name="upfile"><br> <br>

    <input type="submit" value="表单提交" onclick="return checkData()">
    <%--<input type="button" value="ajax提交" id="btn" name="btn" >--%>


</form>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="add">添加</a>
    <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="modify">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    /*  ajax 方式上传文件操作 */
    $(document).ready(function(){
        $("#btn").click(function(){ if(checkData()){
            $.ajax({
                url:'${pageContext.request.contextPath}/ajax',
                dataType: 'text',
                success: resutlMsg,
                error: errorMsg
            });
            function resutlMsg(msg){
                alert(msg);
                $("#upfile").val("");
            }
            function errorMsg(){
                alert("导入excel出错！");
            }
        }
        });
    });

    //JS校验form表单信息
    function checkData(){
        var fileDir = $("#upfile").val();
        var suffix = fileDir.substr(fileDir.lastIndexOf("."));
        if("" == fileDir){
            alert("选择需要导入的Excel文件！");
            return false;
        }
        if(".xls" != suffix && ".xlsx" != suffix ){
            alert("选择Excel格式的文件导入！");
            return false;
        }
        return "导入成功";

    }
    layui.use('table', function() {
        var table = layui.table;
        //方法渲染
        table.render({
            elem : '#demo',  //绑定table表格
            height : 500,
            url : '${pageContext.request.contextPath}/findpkh.action' //数据接口
            ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            ,page : true //开启分页
            //,toolbar: '#toolbarDemo'  //开启表格头部工具栏区域
            ,cols : [ [ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field : 'id',title : 'ID',width : 50,sort : true,fixed : 'left'}
                ,{field : 'province',title : '省',width : 100}
                ,{field : 'city',title : '市',width : 100}
                ,{field : 'country',title : '县',width : 100}
                ,{field : 'village',title : '村',width : 100}
                ,{field : 'code',title : '邮编',width : 80}
                ,{field : 'name',title : '户主姓名',width : 200}
                ,{field : 'time',title : '建档时间',width : 200}
                ,{field : 'lxfs',title : '联系方式',width : 200}
                ,{field : 'bankname',title : '银行卡名称',width : 200}
                ,{field : 'banknumber',title : '银行卡号',width : 400}
                ,{field : 'pkyy',title : '贫困原因',width : 200}
                ,{field : 'familynumber',title : '家庭成员',width : 200}
                ,{field : 'zfmj',title : '住房面积',width : 200}
                ,{field : 'rjcsh',title : '人均纯收入',width : 200}
                ,{field : 'bfdw',title : '帮扶单位',width : 200}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:180}] ]
            ,id:'testReload'
        });
        //监听行工具事件
        table.on('tool(demo)', function(obj){  //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data;   //获得当前行数据
            console.log(obj)
            if(obj.event === 'del'){   //删除数据
                //执行ajax请求
                $.ajax({
                    url:'${pageContext.request.contextPath}/delPku.action?id='+data.id,
                    method:'GET',
                    dataType:'text',
                    success:function(data){
                        layer.msg(data);
                        obj.del();   //删除对应行（tr）的DOM结构，并更新缓存
                    }
                });
            }else if(obj.event=='add'){   //添加数据
                layer.open({
                    type: 2,
                    title:'添加数据'   //标题
                    ,area:['400px','1000px']    //宽高
                    ,content:['addMusic.jsp','no'] //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                });
            }else if(obj.event === 'modify'){   //修改数据
                layer.open({
                    type: 2,
                    title:'修改数据'   //标题
                    ,area:['400px','1000px']    //宽高
                    ,content:['${pageContext.request.contextPath}/findPkuById.action?id='+data.id,'no'] //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                });
            }
        });
        //数据表格重载（模糊查询）
        var $ = layui.$, active = {
            reload: function(){
                var musicName = $('#demoReload').val();  //取得表单的参数
                //layer.alert(name);
                //执行重载
                table.reload('testReload', {
                    page:true,
                    url:'${pageContext.request.contextPath}/findByName.action',
                    method:'post',
                    where:{musicName:musicName}  //把参数传入到后台
                });
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type')
            //layer.alert(active[type] ? active[type].call(this) : '');
            active[type] ? active[type].call(this) : '';
        });
    });
</script>
</body>
</html>
