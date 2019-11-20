<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="js/layui/css/layui.css" />
		<script type="text/javascript" src="js/jquery-1.7.2.min.js" ></script>
	</head>
	<body class="layui-layout-body">
		<div class="layui-fluid">
			<div class="layui-row layui-col-space15">
				<div class="layui-col-md6">
					<div class="layui-card">
						<div class="layui-card-header">卡片面板1</div>
						<div class="layui-card-body">
						    <div id="chart1" style="width: 100%;height:300px;"></div>
						</div>
					</div>
					<div class="layui-card">
						<div class="layui-card-header">卡片面板2</div>
						<div class="layui-card-body">
						    <div id="chart2" style="width: 100%;height:300px;"></div>
						</div>
					</div>
				</div>
				<div class="layui-col-md6">
					<div class="layui-card">
						<div class="layui-card-header">卡片面板3</div>
						<div class="layui-card-body">
						    <div id="chart3" style="width: 100%;height:300px;"></div>
						</div>
					</div>
					<div class="layui-card">
						<div class="layui-card-header">卡片面板4</div>
						<div class="layui-card-body">
						    <div id="chart4" style="width: 100%;height:300px;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="./js/layui/layui.js"></script>
		<script type="text/javascript" src="js/echarts4/echarts.min.js" ></script>
		<script>
			layui.use(['element','layer'],function(){
				var element = layui.element
				,layer = layui.layer
				,$ = layui.jquery;	
			});
			// 基于准备好的dom，初始化echarts实例
	        var myChart1 = echarts.init(document.getElementById('chart1'));
	        var myChart2 = echarts.init(document.getElementById('chart2'));
	        var myChart3 = echarts.init(document.getElementById('chart3'));
	        var myChart4 = echarts.init(document.getElementById('chart4'));
	        // 指定图表的配置项和数据
	        var option1 = {
			    title : {
			        text: '某地区蒸发量和降水量',
			        subtext: '纯属虚构'
			    },
			    tooltip : {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['蒸发量','降水量']
			    },
			    toolbox: {
			        show : true,
			        feature : {
			            dataView : {show: true, readOnly: false},
			            magicType : {show: true, type: ['line', 'bar']},
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    calculable : true,
			    xAxis : [
			        {
			            type : 'category',
			            data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value'
			        }
			    ],
			    series : [
			        {
			            name:'蒸发量',
			            type:'bar',
			            data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
			            markPoint : {
			                data : [
			                    {type : 'max', name: '最大值'},
			                    {type : 'min', name: '最小值'}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name: '平均值'}
			                ]
			            }
			        },
			        {
			            name:'降水量',
			            type:'bar',
			            data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3],
			            markPoint : {
			                data : [
			                    {name : '年最高', value : 182.2, xAxis: 7, yAxis: 183},
			                    {name : '年最低', value : 2.3, xAxis: 11, yAxis: 3}
			                ]
			            },
			            markLine : {
			                data : [
			                    {type : 'average', name : '平均值'}
			                ]
			            }
			        }
			    ]
			};
	        var option2 = {
			    xAxis: {
			        type: 'category',
			        boundaryGap: false,
			        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
			    },
			    yAxis: {
			        type: 'value'
			    },
			    series: [{
			        data: [820, 932, 901, 934, 1290, 1330, 1320],
			        type: 'line',
			        areaStyle: {}
			    }]
			};
			$.get('js/echarts4/map/json/gsq.json', function (geoJson) {
			    echarts.registerMap('gsq', geoJson);

			   var option3 = {
			        title: {
			            text: '拱墅区人口密度 （2011）',
			            subtext: '人口密度数据来自瑞成系统',
			            sublink: ''
			        },
			        tooltip: {
			            trigger: 'item',
			            formatter: '{b}<br/>{c} (p / km2)'
			        },
			        toolbox: {
			            show: true,
			            orient: 'vertical',
			            left: 'right',
			            top: 'center',
			            feature: {
			                dataView: {readOnly: false},
			                restore: {},
			                saveAsImage: {}
			            }
			        },
			        visualMap: {
			            min: 800,
			            max: 50000,
			            text:['High','Low'],
			            realtime: false,
			            calculable: true,
			            inRange: {
			                color: ['lightskyblue','yellow', 'orangered']
			            }
			        },
			        series: [
			            {
			                name: '拱墅区人口密度',
			                type: 'map',
			                mapType: 'gsq', // 自定义扩展图表类型
			                itemStyle:{
			                    normal:{label:{show:true}},
			                    emphasis:{label:{show:true}}
			                },
			                data:[
			                    {name: '米市巷街道', value: 20057.34},
			                    {name: '小河街道', value: 15477.48},
			                    {name: '上塘街道', value: 31686.1},
			                    {name: '湖墅街道', value: 6992.6},
			                    {name: '康桥街道', value: 44045.49},
			                    {name: '半山街道', value: 40689.64},
			                    {name: '和睦街道', value: 37659.78},
			                    {name: '拱宸桥街道', value: 45180.97},
			                    {name: '祥符街道', value: 55204.26},
			                    {name: '大关街道', value: 21900.9}
			                ],
			                // 自定义名称映射
			                nameMap: {
			                    'msx': '米市巷街道',
			                    'xh': '小河街道',
			                    'st': '上塘街道',
			                    'hs': '湖墅街道',
			                    'kq': '康桥街道',
			                    'bs': '半山街道',
			                    'hm': '和睦街道',
			                    'gcq': '拱宸桥街道',
			                    'xf': '祥符街道',
			                    'dg': '大关街道'
			                }
			            }
			        ]
			    };
			    myChart3.setOption(option3);
			});
			var option4 = {
			    title: {
			        text: '未来一周气温变化',
			        subtext: '纯属虚构'
			    },
			    tooltip: {
			        trigger: 'axis'
			    },
			    legend: {
			        data:['最高气温','最低气温']
			    },
			    toolbox: {
			        show: true,
			        feature: {
			            dataZoom: {
			                yAxisIndex: 'none'
			            },
			            dataView: {readOnly: false},
			            magicType: {type: ['line', 'bar']},
			            restore: {},
			            saveAsImage: {}
			        }
			    },
			    xAxis:  {
			        type: 'category',
			        boundaryGap: false,
			        data: ['周一','周二','周三','周四','周五','周六','周日']
			    },
			    yAxis: {
			        type: 'value',
			        axisLabel: {
			            formatter: '{value} °C'
			        }
			    },
			    series: [
			        {
			            name:'最高气温',
			            type:'line',
			            data:[11, 11, 15, 13, 12, 13, 10],
			            markPoint: {
			                data: [
			                    {type: 'max', name: '最大值'},
			                    {type: 'min', name: '最小值'}
			                ]
			            },
			            markLine: {
			                data: [
			                    {type: 'average', name: '平均值'}
			                ]
			            }
			        },
			        {
			            name:'最低气温',
			            type:'line',
			            data:[1, -2, 2, 5, 3, 2, 0],
			            markPoint: {
			                data: [
			                    {name: '周最低', value: -2, xAxis: 1, yAxis: -1.5}
			                ]
			            },
			            markLine: {
			                data: [
			                    {type: 'average', name: '平均值'},
			                    [{
			                        symbol: 'none',
			                        x: '90%',
			                        yAxis: 'max'
			                    }, {
			                        symbol: 'circle',
			                        label: {
			                            normal: {
			                                position: 'start',
			                                formatter: '最大值'
			                            }
			                        },
			                        type: 'max',
			                        name: '最高点'
			                    }]
			                ]
			            }
			        }
			    ]
			};
	        // 使用刚指定的配置项和数据显示图表。
	        myChart1.setOption(option1);
	        myChart2.setOption(option2);
	        //myChart3.setOption(option3);
	        myChart4.setOption(option4);
		</script>
	</body>
</html>
