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

<%--<div class="demoTable">--%>
    <%--查询受扶持情况:--%>
    <%--<div class="layui-inline">--%>
        <%--<input class="layui-input" name="name" id="demoReload" autocomplete="off">--%>
    <%--</div>--%>
    <%--<button class="layui-btn" data-type="reload">搜索</button>--%>
<%--</div>--%>

<table class="layui-hide" id="demo" lay-filter="demo"></table>

<!-- <script type="text/html" id="toolbarDemo">
  <div class="layui-btn-container demoTable">
    <button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
    <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
    <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>
  </div>
</script>   -->


    <span id="fileInput"></span>
</form>
<script type="text/html" id="barDemo">


</script>

<script>

    layui.use('table', function() {
        var table = layui.table;
        //方法渲染
        table.render({
            elem : '#demo',  //绑定table表格
            height : 520,
            url : '${pageContext.request.contextPath}/findsfcqk.action' //数据接口
            ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            ,page : true //开启分页
            //,toolbar: '#toolbarDemo'  //开启表格头部工具栏区域
            ,cols : [ [ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field : 'id',title : 'ID',width : 50,sort : true,fixed : 'left'}
                ,{field : 'name',title : '户主姓名',width : 100}
                ,{field : 'type',title : '项目类别',width : 100}
                ,{field : 'content',title : '项目内容',width : 250}
                ,{field : 'zjgm',title : '资金规模',width : 100}
                ,{field : 'zjze',title : '资金总额',width : 100}
                ,{field : 'czfp',title : '财政扶贫',width : 200}
                ,{field : 'time',title : '受扶持年份',width : 200}
               ] ]
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
                    title:'扶贫措施'   //标题
                    ,area:['400px','500px']    //宽高
                    ,content:['fpcs.jsp','no'] //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
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
