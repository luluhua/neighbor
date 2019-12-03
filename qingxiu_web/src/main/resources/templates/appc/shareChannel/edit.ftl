<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
    <#if (entity.id)??>
      action="/appc/tAppUserShareChannel/doEdit"
    <#else>
      action="/appc/tAppUserShareChannel/doAdd"
    </#if>
>
        <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
    <div class="box-body">
        <div class="form-group">
            <label for="orgName" class="col-sm-2 control-label">上级渠道</label>
            <div class="col-sm-10">
                    <div style="position: relative;z-index: 999;">
                <input id="orgName" class="org-select" value="${(pName)!}" onclick="showTree()" style="height: 33px;"
                       readOnly="true">
                <!-- 模拟select点击框 以及option的text值显示-->
                <i class="trg" style="position: absolute;"></i>
                <!-- 模拟select右侧倒三角 -->
                <input id="orgCode" type="hidden"  value="${(pId)!}" name="pid"/>
                <!-- 存储 模拟select的value值 -->
                <!-- zTree树状图 相对定位在其下方 -->
                <div class="ztree"
                     style="display:none; position: absolute;border:1px solid #4aa5ff;width:200px;background: #fff">
                    <ul id="treeDemo"></ul>
                </div>
            </div>
        </div>
        </div>
        <div class="form-group">
            <label for="code" class="col-sm-2 control-label">渠道编号<span
                    class="xing_red">*</span></label>
            <div class="col-sm-10">
                <#if (entity.id)??>
                    <input type="text" id="code" name="code"
                           value="${(entity.code)!}" class="form-control" placeholder="请输入渠道编号"
                           lay-verify="required" readonly="readonly"/>
                <#else >
                     <input type="text" id="code" name="code"
                            value="${(entity.code)!}" class="form-control" placeholder="请输入渠道编号"
                            lay-verify="required" />
                </#if>


            </div>
        </div>
        <div class="form-group">
            <label for="name" class="col-sm-2 control-label">渠道名称<span
                    class="xing_red">*</span></label>
            <div class="col-sm-10">
                <input type="text" id="name" name="name"
                       value="${(entity.name)!}" class="form-control" placeholder="请输入渠道名称"
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
    var pList = ${list!};
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
        var fa = !treeNode.isParent;
        if (fa) {
            zTreeOnClick(event, treeId, treeNode);
        }
        return fa;//当是父节点 返回false 不让选取
    };

    //节点点击事件
    function zTreeOnClick(event, treeId, treeNode) {
        $('#orgName').val(treeNode.name);
        $('#orgCode').val(treeNode.id)
        if (treeNode.id == "70") {
            $("#jiaoyijzy").css({'display': 'block'})
        } else {
            $("#jiaoyijzy").css({'display': 'none'})
        }
        hideTree();
    };
    $(document).ready(function () {
        //初始组织树状图
        $.fn.zTree.init($("#treeDemo"), setting, pList);
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
        left: 181px;
        top: 15px;

    }

    .org-select {
        cursor: default;
        z-index: -1;
        width: 200px;
    }

    .uiisar li {
        width: 160px;
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