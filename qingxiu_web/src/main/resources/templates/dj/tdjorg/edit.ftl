<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/dj/tDjOrg/doEdit"
    <#else>
      action="/dj/tDjOrg/doAdd"
    </#if>
>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
    <div class="box-body">
        <input type="hidden" value="${(entity.id)!}" name="id"/>
        <div class="form-group">
            <label for="orgName" class="col-sm-2 control-label">归属区划<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <div style="position: relative;z-index: 999;">
                    <input id="areaName" class="org-select" value="${(entity.areaName)!}" onclick="showTree()" style="height: 33px;"
                           readOnly="true" lay-verify="required">
                    <!-- 模拟select点击框 以及option的text值显示-->
                    <i class="trg" style="position: absolute;"></i>
                    <!-- 模拟select右侧倒三角 -->
                    <input id="areaId" name="areaId" type="hidden" value="${(entity.areaId)!}"/>
                    <!-- 存储 模拟select的value值 -->
                    <!-- zTree树状图 相对定位在其下方 -->
                    <div class="ztree" style="display:none; position: absolute;border:1px solid #4aa5ff;width:480px;background: #fff">
                        <ul id="treeDemo"></ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">上级组织<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <select  id="pid" name="pid" class="form-control select2" style="width: 100%;"
                         lay-verify="required" lay-ignore >
                    <option value='' <#if !(entity.pid)??>selected</#if>>--请选择--</option>
                    <option value='0' <#if (entity.pid)??&&entity.pid==0>selected</#if>>顶级组织</option>
                    <#list orgList as org>
                        <option value="${(org.id)}" <#if (entity.pid)??&&entity.pid==org.id>selected</#if> >${(org.name)!}</option>
                    </#list>
                </select>
            </div>
        </div>


        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">组织名称<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="name" name="name" maxlength="30"
                       value="${(entity.name)!}" class="form-control" placeholder="请输入名称"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="code" class="col-sm-2 control-label">组织代码<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="code" name="code" maxlength="25"
                       value="${(entity.code)!}" class="form-control" placeholder="请输入代码"
                       lay-verify="required" <#if (entity.id)??>readonly</#if>/>
            </div>
        </div>
        <div class="form-group">
            <label for="abbreviation" class="col-sm-2 control-label">组织简称<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="abbreviation" name="abbreviation" maxlength="15"
                       value="${(entity.abbreviation)!}" class="form-control" placeholder="请输入简称"
                       lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">组织类型<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="orgType" name="orgType" maxlength="30"
                       value="${(entity.orgType)!}" class="form-control" placeholder="请输入类型"
                       lay-verify="required"/>
            <#--<select name="orgType" class="form-control select2" style="width: 100%;"
                     lay-verify="required" lay-ignore >
                <option value='' <#if !(entity.pid)??>selected</#if>>--请选择--</option>
                <@dictTag method="getDictListByType" type="dj_org_type" >
                    <#list getDictListByType as dict>
                    <option value="${(dict.value)!}" <#if entity.orgType??&&entity.orgType==dict.value>selected="selected"</#if> >${(dict.label)!}</option>
                    </#list>
                </@dictTag>
            </select>-->
            </div>
        </div>
        <div class="form-group">
            <label for="pid" class="col-sm-2 control-label">排序<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="number" id="sort" name="sort" maxlength="8"
                       value="${(entity.sort)!}" class="form-control" placeholder="请输入排序"
                       lay-verify="required"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">&nbsp;</label>
            <div class="col-sm-10">
                <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i>
                    提 交
                </button>
            </div>
        </div>
    </div><!-- /.box-body -->
</form>
</@body>
<@footer>
<script>

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
        // var fa = !treeNode.isParent;
        // if (fa) {
        //     zTreeOnClick(event, treeId, treeNode);
        // }
        // return fa;//当是父节点 返回false 不让选取
        zTreeOnClick(event, treeId, treeNode);
    };

    //节点点击事件
    function zTreeOnClick(event, treeId, treeNode) {
        $('#areaName').val(treeNode.name);
        $('#areaId').val(treeNode.id)
        // if (treeNode.id == "70") {
        //     $("#jiaoyijzy").css({'display': 'block'})
        // } else {
        //     $("#jiaoyijzy").css({'display': 'none'})
        // }
        hideTree();
    };
    $(document).ready(function () {
        $.post("/system/sysCity/treeData", {'leftCode':'450103'}, function(data){
            //data.push({"id":"0", "pid":"0", "name":"无父级"});
            console.log(data);
            //初始组织树状图
            var treeObj = $.fn.zTree.init($("#treeDemo"), setting, data);
            // 展开所有
            //treeObj.expandAll(true);
            // 展开前三级
            var nodeList = treeObj.getNodes();//展开第一个根节点
            for(var i = 0; i < nodeList.length; i++) { //设置节点展开第二级节点
                treeObj.expandNode(nodeList[i], true, false, true);
                /*
                var nodespan = nodeList[i].children;
                for(var j = 0; j < nodespan.length; j++) { //设置节点展开第三级节点
                    treeObj.expandNode(nodespan[j], true, false, true);
                }
                */
            }

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
        if (event.target.id.indexOf('treeDemo') == -1) {
            if (event.target.id != 'selectDevType') {
                hideTree();
            }
        }
    }
</script>
<style>
    .trg {
        width: 0;
        height: 0;
        border-left: 3px solid transparent;
        border-right: 3px solid transparent;
        border-top: 6px solid black;;
        position: absolute;
        left: 461px;
        top: 15px;

    }

    .org-select {
        cursor: default;
        z-index: -1;
        width: 480px;
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
        width: 460px;
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
</@footer>