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
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 1200px;height:500px;"></div>
<script type="text/javascript">
    $().ready(function() {
        var myChart = echarts.init(document.getElementById('main'));
        //图表显示提示信息
        myChart.showLoading();
        //定义图表options
        var options = {
            color : [ '#3398DB' ],
            title : {
                text : "各地区贫困户平均收入统计",
                //subtext : "www.stepday.com",
                //sublink : "http://www.stepday.com/myblog/?Echarts"
            },
            tooltip : {
                trigger : 'axis'
            },
            legend : {
                data : []
            },
            toolbox : {
                show : true,
                feature : {
                    mark : false
                }
            },
            calculable : true,
            xAxis : [ {
                type : 'category',
                data : []
            } ],
            yAxis : [ {
                type : 'value',
                splitArea : {
                    show : true
                }
            } ],
            series : [ {
                barWidth : '60%'
            } ]
        };

        //通过Ajax获取数据
        $.ajax({
            type : "post",
            async : false, //同步执行
            url : "${pageContext.request.contextPath}/showEchartBar.action",
            dataType : "json", //返回数据形式为json
            success : function(result) {
                if (result) {
                    //将返回的category和series对象赋值给options对象内的category和series
                    //因为xAxis是一个数组 这里需要是xAxis[i]的形式
                    options.xAxis[0].data = result.category;
                    options.series = result.series;
                    options.legend.data = result.legend;

                    myChart.hideLoading();
                    myChart.setOption(options);
                }
            },
            error : function(errorMsg) {
                alert(errorMsg);
            }
        });

    });
</script>
</body>
</html>