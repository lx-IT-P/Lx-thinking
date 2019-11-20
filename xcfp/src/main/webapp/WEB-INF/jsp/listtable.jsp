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
    <style>
        body{margin: 10px; height: 600px;}

    </style>
</head>
<body>
<div class="demoTable">
    查询歌曲:
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

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="add">添加</a>
    <a class="layui-btn layui-btn-xs layui-btn-normal" lay-event="modify">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    layui.use('table', function() {
        var table = layui.table;
        //方法渲染
        table.render({
            elem : '#demo',  //绑定table表格
            height : 445,
            url : '${pageContext.request.contextPath}/findmusic.action' //数据接口
            ,page : true //开启分页
            //,toolbar: '#toolbarDemo'  //开启表格头部工具栏区域
            ,cols : [ [ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field : 'id',title : 'ID',width : 170,sort : true,fixed : 'left'}
                ,{field : 'musicName',title : '音乐名称',width : 170}
                ,{field : 'singerId',title : '歌手ID',width : 170,sort : true}
                ,{field : 'musicURL',title : '歌曲地址',width : 200}
                ,{field : 'typeId',title : '类型ID',width : 200}
                ,{field : 'photo',title : '图片',width : 200,sort : true}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:250}] ]
            ,id:'testReload'
        });
        //监听行工具事件
        table.on('tool(demo)', function(obj){  //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
            var data = obj.data;   //获得当前行数据
            console.log(obj)
            if(obj.event === 'del'){   //删除数据
                //执行ajax请求
                $.ajax({
                    url:'${pageContext.request.contextPath}/delMusic.action?id='+data.id,
                    method:'GET',
                    dataType:'text',
                    success:function(data){
                        layer.msg(data);
                        obj.del();   //删除对应行（tr）的DOM结构，并更新缓存
                    }
                });
            }
            else if(obj.event=='add'){   //添加数据
                layer.open({
                    type: 2,
                    title:'添加数据'   //标题
                    ,area:['400px','400px']    //宽高
                    ,content:['addMusic.jsp','no'] //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                });
            }else if(obj.event === 'modify'){   //修改数据
                layer.open({
                    type: 2,
                    title:'修改数据'   //标题
                    ,area:['400px','450px']    //宽高
                    ,content:['${pageContext.request.contextPath}/findMusicById.action?id='+data.id,'no'] //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                });
            }
        })

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
</script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              v
</body>
</html>
