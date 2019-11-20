<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8" />
    <title>首页</title>
    <link rel="stylesheet" href="./js/layui/css/layui.css" />
    <link rel="stylesheet" href="css/index.css" />
    <script>
        //iframe高度自适应
        function setIframeHeight(iframe) {
            if (iframe) {
                var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
                if (iframeWin.document.body) {
                    iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
                }
            }
        };
    </script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <!--头部-->
    <div class="layui-header">
        <!--头部左侧导航-->
        <ul class="layui-nav layui-layout-left" lay-filter="leftmenu">
            <li class="layui-nav-item">
                <a href="javascript:;" class="hidetab" title="隐藏左侧菜单"><i class="layui-icon layui-icon-shrink-right"></i></a>
            </li>
            <li class="layui-nav-item">
                <a href="./index.jsp" title="主页"><i class="layui-icon layui-icon-home"></i></a>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:window.location.reload();" title="刷新"><i class="layui-icon layui-icon-refresh-3"></i></a>
            </li>
            <li class="layui-nav-item layui-hide-xs">
                <input class="layui-input layui-input-search" type="text" placeholder="搜索" autocomplete="off"/>
            </li>
        </ul>
        <!--头部右侧导航-->
        <ul class="layui-nav layui-layout-right" lay-filter="rightmenu">
            <li class="layui-nav-item">
                <a href=""><i class="layui-icon layui-icon-speaker"></i>消息中心<span class="layui-badge">9</span></a>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <i class="layui-icon layui-icon-user"></i>
                    ${sessionScope.user.role},${sessionScope.user.username}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;" lay-href="./userinfo.jsp"><i class="layui-icon layui-icon-form"></i>基本资料</a></dd>
                    <dd><a href="javascript:;" lay-href="./changepassword.jsp"><i class="layui-icon layui-icon-password"></i>修改密码</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">锁屏<i class="layui-icon layui-icon-password"></i></a>
            </li>
            <li class="layui-nav-item"><a href="./login.jsp">退出</a></li>
        </ul>
    </div>
    <!--左侧-->
    <div class="layui-side layui-side-menu">
        <!--带滚动条垂直导航-->
        <div class="layui-side-scroll layui-bg-black">
            <div class="layui-logo">
                <img src="./img/logo.png" alt="logo" style="width: 180px;height: 50px">
            </div>
            <ul class="layui-nav layui-nav-tree" lay-filter="navtree">
                <!--默认展开-->
                <li class="layui-nav-item">
                    <a href="javascript:;" title="主页"><i class="layui-icon layui-icon-home"></i><cite>扶贫对象管理</cite></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" lay-href="./jsp/addMusic.jsp">录入扶贫对象</a></dd>
                        <dd><a href="javascript:;" lay-href="./jsp/listtable.jsp">扶贫对象检索</a></dd>


                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a class="" href="javascript:;" >扶贫措施管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" lay-href="./jsp/zpyy.jsp">致贫原因管理</a></dd>
                        <dd><a href="javascript:;" lay-href="./jsp/fpcs.jsp">扶贫策略管理</a></dd>

                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">扶贫成效管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" lay-href="./jsp/tpgl.jsp">脱贫管理</a></dd>
                        <dd><a href="javascript:;" lay-href="./jsp/fpgl.jsp">返贫管理</a></dd>
                        <dd><a href="javascript:;" lay-href="./jsp/sfcqk.jsp">受扶持记录管理</a></dd>

                    </dl>
                </li>
                <%--<li class="layui-nav-item">--%>
                    <%--<a href="javascript:;">数据统计分析</a>--%>
                    <%--<dl class="layui-nav-child">--%>
                        <%--<dd><a href="javascript:;" lay-href="./jsp/pkhtj.jsp">贫困户统计</a></dd>--%>
                        <%--<dd><a href="javascript:;" lay-href="./jsp/tprktj.jsp">脱贫人口统计</a></dd>--%>
                        <%--<dd><a href="javascript:;" lay-href="./jsp/pkhzjtj.jsp">贫困资金统计</a></dd>--%>

                    <%--</dl>--%>
                <%--</li>--%>

                <%--<li class="layui-nav-item">--%>
                    <%--<a href="javascript:;" title="用户"><i class="layui-icon layui-icon-user"></i><cite>安全管理</cite></a>--%>
                    <%--<dl class="layui-nav-child">--%>
                        <%--<dd><a href="javascript:;" lay-href="./user.jsp">权限管理</a></dd>--%>
                        <%--<dd><a href="javascript:;" lay-href="./user.jsp">数据安全管理</a></dd>--%>
                    <%--</dl>--%>
                <%--</li>--%>
                <%--<li class="layui-nav-item">--%>
                    <%--<a href="javascript:;" title="设置"><i class="layui-icon layui-icon-set"></i><cite>设置</cite></a>--%>
                    <%--<dl class="layui-nav-child">--%>
                        <%--<dd><a href="javascript:;" lay-href="./set.jsp">系统设置</a></dd>--%>
                    <%--</dl>--%>
                <%--</li>--%>
            </ul>
        </div>
    </div>
    <!--正文-->
    <div class="layui-body layui-bg-gray">
        <!--选项卡-->
        <div class="layui-admin-pagetabs">
            <div class="layui-tab layui-tab-brief" lay-allowClose="true" lay-filter="pagetabs">
                <ul class="layui-tab-title layui-bg-white">
                    <li class="layui-this" lay-id="./home.jsp"><i class="layui-icon layui-icon-home"></i></li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <iframe src="./jsp/listtable.jsp" class="layui-admin-iframe" scrolling="no" frameborder="0" onload="setIframeHeight(this);"></iframe>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!--底部-->
    <div class="layui-footer">© 2019 陕西理工大学版权所有</div>
</div>
<script src="./js/layui/layui.js"></script>
<script>
    layui.use(['element','layer'],function(){
        var element = layui.element
            ,layer = layui.layer
            ,$ = layui.jquery;
        //隐藏tab主页关闭标签
        $(".layui-tab-title li:first-child i:last-child").css("display","none");
        //tab点击监控
        element.on('tab(pagetabs)',function(data){
            //tab切换时，左侧菜单对应选中
            var url = $(this).attr("lay-id");
            $(".layui-nav-tree li dd").each(function(i,e){
                if($(this).find("a").attr("lay-href")==url){
                    $(this).attr("class","layui-this");
                }else{
                    $(this).attr("class","");
                }
            })
        });
        //顶部左侧菜单监控
        element.on('nav(leftmenu)',function(elem){
            //隐藏显示侧边菜单
            if(elem[0].className=="hidetab"){//隐藏
                //侧边菜单伸缩
                $(".layui-side-menu").animate({width:$(".layui-side-menu").width()-144+"px"});
                //正文伸缩
                $(".layui-body").animate({left:$(".layui-body").position().left-144+"px"});
                //底部伸缩
                $(".layui-footer").animate({left:$(".layui-footer").position().left-144+"px"});
                $(this).attr("class","showtab");
                $(this).find("i").attr("class","layui-icon layui-icon-spread-left");
                //侧边菜单只显示图标
                $(".layui-nav-tree").find("li").each(function(em,ind){
                    $(this).find("cite").css("display","none");
                    $(this).find("dl").css("display","none");
                });
            }else if(elem[0].className=="showtab"){//显示
                $(".layui-side-menu").animate({width:$(".layui-side-menu").width()+144+"px"});
                $(".layui-body").animate({left:$(".layui-body").position().left+144+"px"});
                $(".layui-footer").animate({left:$(".layui-footer").position().left+144+"px"});
                $(this).attr("class","hidetab");
                $(this).find("i").attr("class","layui-icon layui-icon-shrink-right");
                $(".layui-nav-tree").find("li").each(function(em,ind){
                    $(this).find("cite").css("display","");
                    $(this).find("dl").css("display","");
                });
            }else{

            }
        });
        //顶部右侧菜单监控
        element.on('nav(rightmenu)',function(elem){
            var url = $(this).attr("lay-href");
            if(url!=undefined){
                layer.open({
                    title:elem[0].innerText,
                    type: 2,
                    content:url,
                    area: ['600px', '500px']
                });
            }
            if(elem[0].innerText=="锁屏"){
                layer.open({
                    title:"已锁屏"
                    ,content: '<input name="pass" class="layui-input" type="text" placeholder="请输入密码,默认123123" autocomplete="off"/>'
                    ,btnAlign: 'c'
                    ,anim: 1
                    ,btn: ['解锁']
                    ,yes: function(index, layero){
                        var pass = layero.find('.layui-layer-content input').val();
                        if(pass=="123123"){
                            layer.close(index);
                        }else{
                            layer.title("密码不正确！", index);
                        }
                    }
                    ,cancel: function(){
                        return false //开启该代码可禁止点击该按钮关闭
                    }
                });
            }
        })
        //左侧垂直菜单监控
        element.on('nav(navtree)',function(elem){
            if($(".layui-side-menu").width()<200){
                $(".layui-side-menu").animate({width:$(".layui-side-menu").width()+144+"px"});
                $(".layui-body").animate({left:$(".layui-body").position().left+144+"px"});
                $(".layui-footer").animate({left:$(".layui-footer").position().left+144+"px"});
                $(".layui-layout-left li:first-child").find("a").attr("class","hidetab");
                $(".layui-layout-left li:first-child").find("i").attr("class","layui-icon layui-icon-shrink-right");
                $(".layui-nav-tree").find("li").each(function(em,ind){
                    $(this).find("cite").css("display","");
                    $(this).find("dl").css("display","");
                });
            }else{
                if($(this).attr("lay-href")!=undefined){
                    var  flag = true;
                    //url
                    var url = $(this).attr("lay-href");
                    //判断选项卡中是否存在已打开的页面，如果有直接切换到打开页面
                    $(".layui-tab-title li").each(function(i,e){
                        if($(this).attr("lay-id")==url){
                            //切换选项卡
                            element.tabChange('pagetabs', url);
                            flag = false;
                        }
                    })
                    if(flag){
                        //新增选项卡
                        element.tabAdd('pagetabs', {
                            title: elem[0].innerText
                            ,content: '<iframe src="'+url+'" class="layui-admin-iframe" scrolling="no" frameborder="0" onload="setIframeHeight(this)"></iframe>'
                            ,id: url
                        });
                        //切换选项卡
                        element.tabChange('pagetabs', url);
                    }
                }
            }
        });
    });
</script>
</body>
</html>