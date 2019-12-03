<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>内容管理 > 文章列表</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/cms/tCmsArticle/list/1?crt=${(cmsProgram.code)}" method="post"
                          class="form-inline">
                        <div class="box-header">
                        <#--<@shiro.hasPermission name="addTCmsAdvpos">-->
                            <div class="input-group">
                                <a class="btn btn-primary "
                                   href="/cms/tCmsArticle/add/${(cmsProgram.code)}?pageNumber=#{pageNumber}"<i
                                    class="fa fa-plus"></i> 添加</a>
                            </div>
                        <#--</@shiro.hasPermission>-->
                            <div class="input-group ">
                                <button type="button" delete-batch-url="/cms/tCmsArticle/deleteAll"
                                        class="btn btn-danger btn-flat">
                                    <i class="fa fa-remove"></i> 批量删除
                            </div>
                            <div class="input-group">
                                <div style="position: relative;z-index: 999;">
                                    <input id="orgName" style="height: 33px;width: 200px;" class="org-select"
                                           placeholder="-- 分类查询 --" readOnly="true"
                                           onclick="showTree()" value="${classifyName!}">
                                    <!-- 模拟select点击框 以及option的text值显示-->
                                    <i class="trg" style="position: absolute;"></i>
                                    <!-- 模拟select右侧倒三角 -->
                                    <input id="orgCode" type="hidden" name="claListId" value="${claType!}"/>
                                    <!-- 存储 模拟select的value值 -->

                                    <!-- zTree树状图 相对定位在其下方 -->
                                    <div class="ztree"
                                         style="display:none; position: absolute;border:1px solid #4aa5ff;width:200px;background: #fff">
                                        <ul id="treeDemo"></ul>
                                    </div>
                                </div>
                            </div>

                            <div class="input-group">
                                <input type="text" name="search" style="width: 200px" value="${search!}"
                                       class="form-control"
                                       placeholder="标题、创建人">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th><input type="checkbox" lay-filter="allCheck" value="root"
                                           class="minimal  checkbox-toolbar"
                                           lay-ignore>全选
                                </th>
                                <th>ID</th>
                                <th>标题</th>
                                <th>创建人</th>
                                <th>创建时间</th>
                                <th>状态</th>
                                <th width="150px">操作</th>
                            </tr>
              <#list pageData.getRecords() as list>
              	  <tr>
                      <td class="td_checkbox">
                          <input type="checkbox" lay-filter="campus" name="ids"
                                 value="${(list.id)!}" class="minimal checkbox-item">
                      </td>
                      <td>${(list.id)!}</td>
                      <td class="td-width-400">${(list.title)!}</td>
                      <td>${(list.createName)!}</td>
                      <td>${(list.dtCreate?string('yyyy-MM-dd'))!}</td>
                      <td><#if list.articleStatus==0>未发布<#elseif list.articleStatus==1>已发布<#else>已下架</#if></td>
                      <td>
                  <@shiro.hasPermission name="editTCmsArticle">
                          <a class="btn btn-primary btn-xs"
                             href="/cms/tCmsArticle/edit/${(list.id)!}?crt=${(cmsProgram.code)}&pageNumber=#{pageNumber}">编辑</a>
                  </@shiro.hasPermission>
                  <@shiro.hasPermission name="deleteTCmsArticle">
                          <a class="btn btn-danger btn-xs" data-toggle="tooltip" title="删除" data-placement="bottom"
                             data-tiggle="ajax"
                             data-submit-url="/cms/tCmsArticle/delete?id=${(list.id)!}"
                             data-confirm="您确定要删除该条记录吗?">删除</a>
                  </@shiro.hasPermission>
                  <@shiro.hasPermission name="operatetTCmsArticle">
                          <a class="btn btn-danger btn-xs" data-toggle="tooltip" title="发布"
                             data-placement="bottom"
                             data-tiggle="ajax"
                             style="display: <#if list.articleStatus==0 || list.articleStatus==2><#else>none</#if>"
                             data-submit-url="/cms/tCmsArticle/operate?id=${(list.id)!}&status=1"
                             data-confirm="您确定要发布此条广告吗?">发布</a>
                          <a class="btn btn-danger btn-xs" data-toggle="tooltip" title="下架" data-placement="bottom"
                             data-tiggle="ajax" style="display: <#if list.articleStatus==1><#else>none</#if>"
                             data-submit-url="/cms/tCmsArticle/operate?id=${(list.id)!}&status=2"
                             data-confirm="您确定要下架此条广告吗?">下架</a>
                  </@shiro.hasPermission>
                      </td>
                  </tr>
              </#list>
                        <#--<tr>-->
                        <#--<td></td>-->
                        <#--<td></td>-->
                        <#--<td></td>-->
                        <#--<td>-->
                        <#--<a class="btn btn-primary btn-xs" href="javascript:;" data-placement="bottom">更新</a>-->
                        <#--</td>-->
                        <#--<td-->
                        <#--</td>-->
                        <#--<td>-->
                        <#--</td>-->
                        <#--</tr>-->
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
         	  <#include "../../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/cms/tCmsArticle/list/" urlParas="?search=${search!}&claListId=${claType!}&crt=${(cmsProgram.code)}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
 			<@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/cms/tCmsArticle/list/" urlParas="?search=${search!}&claListId=${claType!}&crt=${(cmsProgram.code)}&pageSize=${pageSize!}"  />
                        </div>
                    </div>
                </div><!-- /.box -->
            </div>
        </div>
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</@body>
<@footer>
<script type="application/javascript">
    function Integer(value, min, max) {
        eval("var reg = /\^[1-9]\\d{" + min + "," + (max - 1) + "\}$/;");
        var re = new RegExp(reg);
        if (re.test(value)) {
            return true;
        }
        else {
            return false;
        }
    }

    function oncheckCode(item) {
        if (!Integer($(item).val(), 1, 10)) {
            $(item).val("10");
        }
    }


    var orgList = ${classifyList!}
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
        hideTree();
    };
    $(document).ready(function () {
        //初始组织树状图
        $.fn.zTree.init($("#treeDemo"), setting, orgList);
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
</style>
</@footer>