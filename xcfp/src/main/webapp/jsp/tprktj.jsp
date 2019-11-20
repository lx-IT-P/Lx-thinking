<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>ECharts柱状图</title>
    <link rel="stylesheet" href="../js/layui/css/layui.css" />
    <script type="text/javascript" src="../js/jquery-1.7.2.min.js" ></script>
    <script src="../js/layui/layui.js"></script>
    <script type="text/javascript" src="../js/echarts4/echarts.min.js" ></script>
</head>
<body>
<!--定义页面图表容器-->
<!-- 必须制定容器的大小（height、width） -->
<div id="main"
     style="height: 470px; width:1200px;border: 1px solid #ccc; padding: 10px;"></div>

<script type="text/javascript">
    $().ready(function() {
        var myChart = echarts.init(document.getElementById('main'));
        //图表显示提示信息
        myChart.showLoading();
        //定义图表options
        var options = {
            title : {
                text : '脱贫人口数据统计',
                //subtext : '纯属虚构',
                x : 'center'
            },
            tooltip : {
                trigger : 'item',
                formatter : "{a} <br/>{b} : {c} ({d}%)"
            },
            legend : {
                orient : 'vertical',
                left : 'left',
                data : []
            },
            series : [ {
                name : '访问来源',
                type : 'pie',
                data : []
            } ]
        };
        //通过Ajax获取数据
        $.ajax({
            type : "post",
            async : false, //同步执行
            url : "${pageContext.request.contextPath}/showEchartPie.action",
            dataType : "json", //返回数据形式为json
            success : function(result) {
                if (result) {
                    options.legend.data = result.legend;
                    //将返回的category和series对象赋值给options对象内的category和series
                    //因为xAxis是一个数组 这里需要是xAxis[i]的形式
                    options.series[0].name = result.series[0].name;
                    options.series[0].type = result.series[0].type;
                    var serisdata = result.series[0].data;

                    //遍历
                    /* var datas = [];
                    for ( var i = 0; i < serisdata.length; i++) {
                        datas.push({
                            name : serisdata[i].name,
                            value : serisdata[i].value
                        });
                    }
                    options.series[0].data = datas; */

                    //jquery遍历
                    var value = [];
                    $.each(serisdata, function(i, p) {
                        value[i] = {
                            'name' : p['name'],
                            'value' : p['value']
                        };
                    });
                    options.series[0]['data'] = value;
                    myChart.hideLoading();
                    myChart.setOption(options);
                }
            },
            error : function(errorMsg) {
                alert("图表请求数据失败啦!");
            }
        });

    });
</script>
</body>
</html>