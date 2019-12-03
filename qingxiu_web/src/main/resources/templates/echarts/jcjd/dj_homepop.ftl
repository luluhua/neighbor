<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=yes"/>
    <title>main-frame</title>
    <script src="/jcjd/libs/jquery/jquery-1.10.2.min.js"></script>
    <script src="/jcjd/libs/layer/layer.js"></script>
    <script src="/jcjd/qxdashboard/zTreeStyle/jquery.ztree.all.js"></script>
    <link href="/jcjd/qxdashboard/zTreeStyle/zTreeStyle.css" rel="stylesheet"/>
    <script>

    </script>
    <style>
        html, body {
            padding: 0;
            margin: 0;
            overflow-y: hidden;
        }

        #main-left {
            width: 450px;
            position: absolute;
            left: 0;
            top: 0;
            border-right: 2px solid #BCBFC6;
        }

        #main-right {
            position: absolute;
            top: 0;
            right: 0;
            border-left: 1px solid #efefef;
        }

        #main-right iframe {
            width: 100%;
            height: 100%;
            border: none;
        }

        .panel-left {
            padding: 5px 5px;
            height: 50%;
        }

        .top {
            height: 50%;
            border-bottom: 1px solid #BCBFC6;
            overflow-y: auto;
        }
        .tree-title{
            padding: 5px 15px;
            font-size: 22px;
            border-bottom: 1px solid #d2d6de;
        }
        .tree-title span{
            padding: 5px 15px;
            border-bottom: 2px solid;
        }

        .boot {
            height: 50%;
            overflow-y: auto;
        }
    </style>
</head>
<body>

<div id="main-left" class="main-left">
    <div class="panel-left top" >
        <div class="tree-title"><span>党组织</span></div>
        <div class="ztree" style="padding: 20px 5px;">
            <ul id="treeDemo"></ul>
        </div>
    </div>
    <div class="panel-left boot">
        <div class="tree-title"><span>大工委</span></div>
        <div class="ztree" style="padding: 20px 5px;">
            <ul id="treeDemos"></ul>
        </div>
    </div>
</div>

<div id="main-right">
    <iframe src="/jcjd/wsbs/qxMainlist" frameborder="0" ></iframe>
</div>

<script>
    var doResize = function () {
        var leftWidth = $('#main-left').width();
        var winWidth = $(window).width(), winHeight = $(window).height();
        $('#main-right').css({
            left: leftWidth + 'px',
            height: winHeight + 'px'
        });
        var hv2= Math.max(0,Math.round(winHeight/2)-5);
        $('.panel-left').height(hv2);
    };
    doResize();
    $(window).resize(doResize);
    var json_org='${orgJson!}';
    var orgList = JSON.parse(json_org);
    console.log(orgList);
    $("iframe").attr("src","/jcjd/dj_org_home/1?orgId="+orgList[0].id);
    var orgSetting = {
        data: {
            simpleData: {
                enable: true
            }
        },
        //回调
        callback: {
            onClick: orgTreeOnClick
        },
        view: {
            fontCss: {fontSize: "14px"}
        }
    };
    //节点点击事件
    function orgTreeOnClick(event, treeId, treeNode) {
        console.log("orgTreeOnClick---->treeNode.id---->"+treeNode.id);
        $('#orgName').val(treeNode.name);
        $('#workClass').val(treeNode.name);
        $("iframe").attr("src","/jcjd/dj_org_home/1?orgId="+treeNode.id);
    };

    var dgwList = eval('(${dgwJson!})');
    var dgwSetting = {
        data: {
            simpleData: {
                enable: true
            }
        },
        //回调
        callback: {
            onClick: dgwTreeOnClick
        },
        view: {
            fontCss: {fontSize: "14px"}
        }
    };
    //节点点击事件
    function dgwTreeOnClick(event, treeId, treeNode) {
        console.log("dgwTreeOnClick---->treeNode.id---->"+treeNode.id);
        $('#orgName').val(treeNode.name);
        $('#workClass').val(treeNode.name);
        $("iframe").attr("src","/jcjd/dgwList/1?dgwid="+treeNode.id);
    };
    $(document).ready(function () {


        console.log(orgList);
        var treeObj1 = $.fn.zTree.init($("#treeDemo"), orgSetting, orgList);
        // treeObj1.expandAll(false);
        var nodes = treeObj1.getNodes();
        for (var i = 0; i < nodes.length; i++) { //设置节点展开
            treeObj1.expandNode(nodes[i], true, false, true);
        }


        var treeObj2 = $.fn.zTree.init($("#treeDemos"), dgwSetting, dgwList);
        //treeObj2.expandAll(false);
        var nodes2 = treeObj2.getNodes();
        for (var i = 0; i < nodes2.length; i++) { //设置节点展开
            treeObj2.expandNode(nodes2[i], true, false, true);
        }
    });


</script>

</body>
</html>