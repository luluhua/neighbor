<!DOCTYPE html>
<html>
<head>
	<#include "../common/base.ftl">
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1, user-scalable=no">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<title>智慧党建</title>
	<link rel="shortcut icon" href="${ctx}/base/images/iPhone1024@2x.png">
    <link rel="stylesheet" href="${ctx}/base/css/layui.css">
    <script src="${ctx}/base/js/jquery-1.12.4.min.js"></script>
	<#--
	<link href="${ctx}/base/css/mui.min.css" rel="stylesheet"/>
	<script src="${ctx}/base/js/mui.min.js"></script>
	-->
    <link rel="stylesheet" href="${ctx}/plugins/zTreeStyle/zTreeStyle.css">
    <script src="${ctx}/plugins/zTreeStyle/jquery.ztree.all.js"></script>
    <link href="${ctx}/dj/css/jgxz.css" rel="stylesheet" />
	<!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />-->
	<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>-->
	<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>-->
<#--
<script type="text/javascript" charset="utf-8">
    mui.init();
    window.onload = function () {
        mui('.mui-scroll-wrapper').scroll({
            deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
        });
    }
</script>
-->
	<style type="text/css">

        .btn-box{
            position: fixed; bottom: 0px; width: 100%; line-height: 55px; text-align: center; background-color: #FFFFFF;
            border-top: 1px solid #C9C9C9;}
        .top-box{

            color: #FFFFFF;text-align: center;font-size: 1.4rem;
            position: fixed;width: 100%;
        }
        .top-title{
            background-color: red;
            padding: 10px;
        }
        .seach-box{
            background-color: #FFFFFF;
            padding: 3px 0;
            border-bottom: 1px solid #c7c7cc;
        }
        .seach-txt{
            height: 25px;
            border-radius: 5px;
            border: 1px solid #c7c7cc;
            font-size: 14px;
            padding: 1px 5px;
            width: 60%;
        }
        .seach-btn{
            border: 1px solid #c7c7cc;
            font-size: 14px;
            padding: 5px;
            margin-left: 8px;
            border-radius: 3px;
        }
	</style>
</head>
<body>
    <div class="top-box">
        <div class="top-title">
            党组织机构
        </div>
        <div class="seach-box">
            <input type="text" id="seach-txt" value="" class="seach-txt"/>
            <button type="button" id="seach-btn" class="seach-btn">搜索</button>
        </div>
    </div>
	<div class="col-lg-3">
		<div id="org_tree">
            <!-- 模拟select右侧倒三角 -->
            <input id="pid" type="hidden"  value="0" name="pid"/>
            <!-- 存储 模拟select的value值 -->
            <!-- zTree树状图 相对定位在其下方 -->
            <div class="ztree" style="padding-top: 100px;padding-bottom: 100px;">
                <ul id="treeDemo"></ul>
            </div>
		</div>
	</div>
	<div class="btn-box" style="">
		<button type="button" class="layui-btn layui-btn-radius layui-btn-primary" id="clear" style="margin-right: 45px;">取消</button>
        <button type="button" class="layui-btn layui-btn-sm layui-btn-radius layui-btn-danger" id="ok">确定</button>
	</div>
	<script>
        var treeDate = [];
        var setting = {
            data: {
                simpleData: {
                    enable: true
                }
            },
            //回调
            callback: {
                onClick: zTreeOnClick
            },
            view: {
                fontCss: {fontSize: "1.6rem"}
            }
        };

        //节点点击事件
        function zTreeOnClick(event, treeId, treeNode) {
            $('#ok').attr('disabled', false);
            $('#ok').removeClass('layui-btn-disabled');
            $('#pid').val(treeNode.id)
        };

        function initTree(data){
            //初始组织树状图
            var treeObj = $.fn.zTree.init($("#treeDemo"), setting, data);
            // 展开所有
            treeObj.expandAll(true);
        }
        $(document).ready(function () {
            $('#ok').attr('disabled', true);
            $('#ok').addClass('layui-btn-disabled');
            $.post("${ctx}/dj/org/treeData", {extId:''}, function(data){
                //data.push({"id":"0", "pid":"0", "name":"无父级"});
                console.log(data);
                treeDate = data;
                initTree(treeDate);
            });

            $('#clear').bind("click",function(){
                window.location.href="${ctx}/dj/home?pid=${pid!'0'}";
			});
            $('#ok').bind("click",function(){
                window.location.href="${ctx}/dj/home?pid="+$('#pid').val();
            });
            $('#seach-btn').bind("click",function(){
                var seach = $('#seach-txt').val();
                if(seach != ''){
                    var seachData = [];
                    $.each(treeDate , function(i,d){
                        if(d.name.indexOf(seach) > -1){
                            seachData.push(d);
                        }
                    });
                    initTree(seachData);
                }else{
                    initTree(treeDate);
                }
            });
        });

	</script>
</body>
</html>
