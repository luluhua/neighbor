<#include "../../common/layout.ftl">
<@header>
<link rel="stylesheet" href="/plugins/treeTable/themes/vsStyle/treeTable.min.css">
<style>
    .trg {
        width: 0;
        height: 0;
        border-left: 3px solid transparent;
        border-right: 3px solid transparent;
        border-top: 6px solid black;;
        position: absolute;
        left: 261px;
        top: 15px;

    }

    .org-select {
        cursor: default;
        z-index: -1;
        width: 280px;
        /*width: 100%;*/
        height: 34px;
        padding: 6px 12px;
        font-size: 14px;
        line-height: 1.42857143;
        color: #555;
        background-color: #fff;
        background-image: none;
        border: 1px solid #ccc;
    }

    .uiisar li {
        width: 260px;
        padding: 10px;
        display: -webkit-inline-box;

    }

    .uiisar li img {
        width: 96%;
    }

    .uiisar li span {
        width: 16px;
        height: 16px;
        border-radius: 8px;
        display: block;
        position: relative;
        font-size: 14px;
        color: #fff;
        background-color: red;
        left: 100%;
        top: -5px;
        text-align: center;
    }
</style>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>智慧党建 > <a href="/dj/tDjOrg/list/tree" >党组织（部门）管理</a></small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/dj/tDjOrg/list/tree" method="post"
                          class="form-inline">
                        <div class="box-header">
                        <@shiro.hasPermission name="addTDjOrg">
                            <div class="input-group">
                                <a class="btn btn-primary dialog" href="javascript:;" data-title="添加"
                                   data-url="/dj/tDjOrg/add"
                                   data-width="850" data-height="550"><i class="fa fa-plus"></i> 添加</a>
                            </div>
                        </@shiro.hasPermission>
                        <@shiro.hasPermission name="editTDjOrg">
                            <div class="input-group ">
                                <button type="button" update-batch-url="/dj/tDjOrg/updateSortAll" class="btn btn-primary btn-flat">
                                    <i class="fa  fa-hand-o-up"></i> 批量修改排序
                                </button>
                            </div>
                        </@shiro.hasPermission>
                            <div class="input-group">
                                <div style="position: relative;z-index: 999;">
                                    <input id="areaName" class="org-select" value="${(params.areaName)!}" onclick="showTree()" style="height: 33px;"
                                           readOnly="true">
                                    <!-- 模拟select点击框 以及option的text值显示-->
                                    <i class="trg" style="position: absolute;"></i>
                                    <!-- 模拟select右侧倒三角 -->
                                    <input id="areaId" name="areaId" type="hidden"  value="${(params.areaId)!}"/>
                                    <!-- 存储 模拟select的value值 -->
                                    <!-- zTree树状图 相对定位在其下方 -->
                                    <div class="ztree" style="display:none; position: absolute;border:1px solid #4aa5ff;width:480px;background: #fff">
                                        <ul id="areaTree"></ul>
                                    </div>
                                </div>
                            </div>
                            <div class="input-group">
                                <input type="text" name="search" value="${params.search!}" class="form-control"
                                       placeholder="输入名称、编码"/>
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                    <a href="/dj/tDjOrg/list/tree" class="btn btn-default"><i class="fa fa-refresh"></i></a>
                                </div>
                            </div>
                            <div class="input-group pull-right">
                                <button type="button" class="btn btn-primary btn-flat" onclick="window.location.href='/dj/tDjOrg/list/1?pid=${params.pid!}'" style="margin-right: 10px;"><i
                                        class="fa"></i> 分页显示
                                </button>
                                <button type="button" class="btn btn-primary btn-flat" onclick="exportTo('党组织架构数据');">
                                    <i class="fa fa-file-excel-o"></i> 导出
                                </button>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover" id="treeTable">
                            <tr>
                                <th width="100px">
                                    <input type="checkbox" lay-filter="allCheck" value="root"
                                           class="minimal  checkbox-toolbar"
                                           lay-ignore>全选
                                </th>
                                <th>组织名称</th>
                                <th width="180px">组织代码</th>
                                <#--<th width="100px">路径</th>-->
                                <th width="240px">组织简称</th>
                                <th width="100px">排序</th>
                                <th width="180px">操作</th>
                            </tr>
                <#list list as entity>
                    <tr id="${entity.id}" pId="${entity.pid}">
                        <td class="td_checkbox" colspan="2">
                            <label><input type="checkbox" lay-filter="campus" name="ids"
                                   value="${(entity.id)!''}" class="minimal checkbox-item">
                            ${(entity.name)!'--'}</label>
                        </td>
                        <td>${(entity.code)!'--'}</td>
                        <#--<td>${(entity.pidPath)!'--'}</td>-->
                        <td>${(entity.abbreviation)!'--'}</td>
                        <td><input type="text" class="form-control td-input-80"
                                   onblur="oncheckCode(this)" id="sort_${(entity.id)}"
                                   name="values" value="${(entity.sort)!'--'}"></td>
                        <td>
                            <@shiro.hasPermission name="addTDjOrg">
                            <a class="btn btn-primary btn-xs dialog" href="javascript:;" data-url="/dj/tDjOrg/add?pid=${(entity.id)!}"
                               data-title="添加党组织" data-width="850" data-height="650">添加下级</a>
                            </@shiro.hasPermission>
                            <@shiro.hasPermission name="editTDjOrg">
                            <a class="btn btn-primary btn-xs dialog" href="javascript:;" data-url="/dj/tDjOrg/edit/${(entity.id)!}"
                               data-title="编辑党组织" data-width="850" data-height="650">编辑</a>
                            </@shiro.hasPermission>
                            <@shiro.hasPermission name="deleteTDjOrg">
                            <a class="btn btn-danger btn-xs"
                               data-tiggle="ajax"
                               data-submit-url="/dj/tDjOrg/delete?id=${(entity.id)!}"
                               data-confirm="您确定要删除该条记录吗?">删除</a>
                            </@shiro.hasPermission>
                        </td>
                    </tr>
                </#list>
                        </table>
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div>
        </div>
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</@body>
<@footer>
<script src="/plugins/treeTable/jquery.treeTable.js"></script>
<script type="text/javascript">


    var setting = {
        data: {
            simpleData: {
                enable: true
            }
        },
        //回调
        callback: {
            onClick: zTreeBeforeClick
        },
        view: {
            fontCss: {fontSize: "14px"}
        }
    };

    function zTreeBeforeClick(event, treeId, treeNode) {
        zTreeOnClick(event, treeId, treeNode);
    };

    //节点点击事件
    function zTreeOnClick(event, treeId, treeNode) {
        $('#areaName').val(treeNode.name);
        $('#areaId').val(treeNode.id)
        hideTree();
    };
    $(document).ready(function() {
        // 树形列表
        $("#treeTable").treeTable({expandLevel : 9}).show();
        // 树形下拉框
        $.post("/system/sysCity/treeData", {'leftCode':'450103'}, function(data){
            //data.push({"id":"2842", "pid":"0", "name":"不限"});
            console.log(data);
            //初始组织树状图
            var treeObj = $.fn.zTree.init($("#areaTree"), setting, data);
            // 展开所有
            //treeObj.expandAll(true);
        });
    });

    //下拉框显示 隐藏
    function showTree() {
        if ($('.ztree').css('display') == 'none') {
            $('.ztree').css('display', 'block');
        } else {
            $('.ztree').css('display', 'none');
        }
        $("body").bind("mousedown", onBodyDownByActionType);
    }

    function hideTree() {
        $('.ztree').css('display', 'none');
        $("body").unbind("mousedown", onBodyDownByActionType);
        return false;
    }

    //区域外点击事件
    function onBodyDownByActionType(event) {
        if (event.target.id.indexOf('areaTree') == -1) {
            if (event.target.id != 'selectDevType') {
                hideTree();
            }
        }
    }
</script>
</@footer>