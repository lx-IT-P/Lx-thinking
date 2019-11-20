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
  <select name="city" lay-verify="" id="add_role_name">
    <option value="">请选择一个地区</option>
</select>
<button class="layui-btn" data-type="reload">查看脱贫用户</button>
 </div>
<table class="layui-hide" id="demo" lay-filter="demo"></table>
<span id="fileInput"></span>
</form>
<script type="text/html" id="barDemo">
</script>

<script>
    var form,layedit,layer,laydate;
    layui.use('table', function() {
        var table = layui.table;
        //方法渲染
        table.render({
            elem : '#demo',  //绑定table表格
            height : 500,
            url : '${pageContext.request.contextPath}/findTuoPin.action' //数据接口
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
                var country = $("#add_role_name").find("option:selected").attr("value");
                //var country = $('#add_role_name').val();  //取得表单的参数
                //document.write(country);
                //layer.alert(country);
                //执行重载
                table.reload('testReload', {
                    page:true,
                    url:'${pageContext.request.contextPath}/findPkuByCity.action',
                    method:'post',
                    where:{country:country}  //把参数传入到后台
                });
            }
        };

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type')
            //layer.alert(active[type] ? active[type].call(this) : '');
            active[type] ? active[type].call(this) : '';
        });
    });


    layui.use(['form', 'layedit','layer','laydate'], function(){
        form = layui.form;
        layer = layui.layer
        layedit = layui.layedit
        laydate = layui.laydate;
        selectRoleName();    // 调用查询方法
    })
    function selectRoleName(){
        $.ajax({
            url:"${pageContext.request.contextPath}/selectCity.action",
            type:"GET",
            dataType:"json",
            success:function(data){
                //var set = result.extend.list;    //返回的数据
                var role = document.getElementById("add_role_name");        //add_role_name给select定义的id
                for(var i=0;i<data.length;i++){
                    var option = document.createElement("option");    // 创建添加option属性
                    option.setAttribute("value",data[i].country);                  // 给option的value添加值
                    option.innerText=data[i].country;             // 打印option对应的纯文本 （超级管理员、管理员）
                    role.appendChild(option);                          // 给select 添加option子标签
                }
                form.render("select");                                // 刷性select，显示出数据
            }
        });
    }
</script>
</body>
</html>
