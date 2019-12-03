<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>内容管理
                <#list parent as parent>
                   >
                    <a href="/cms/tCmsClassify/list/1?crt=${(cmsProgram.code)}&pid=#{(parent.pId)}">${(parent.classifyName)}</a>
                </#list>
            </small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/cms/tCmsClassify/list/1?crt=${(cmsProgram.code)}&pid=#{pid!}"
                          method="post"
                          class="form-inline">
                        <div class="box-header">
                        <@shiro.hasPermission name="addTCmsClassify">
                            <div class="input-group">
                                <a class="btn btn-primary dialog" href="javascript:;" data-title="添加"
                                   data-url="/cms/tCmsClassify/add/${(cmsProgram.code)}?pid=#{pid!}"
                                   data-width="1000" data-height="550"><i class="fa fa-plus"></i> 添加</a>

                            </div>
                        </@shiro.hasPermission>
                            <div class="input-group">
                                <button type="button" update-batch-url="/cms/tCmsClassify/updateSortAll"
                                        class="btn btn-primary btn-flat">
                                    <i class="fa  fa-hand-o-up"></i> 批量修改排序
                            </div>
                            <div class="input-group ">
                                <button type="button" delete-batch-url="/cms/tCmsClassify/deleteAll"
                                        class="btn btn-danger btn-flat">
                                    <i class="fa fa-remove"></i> 批量删除
                            </div>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="名称搜索">
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
                                <th>id</th>
                                <th>名称</th>
                                <th>创建时间</th>
                                <th>排序</th>
                                <th width="150px">操作</th>
                            </tr>
              <#list pageData.getRecords() as list>
              	  <tr>
                      <td class="td_checkbox">
                          <input type="checkbox" lay-filter="campus" name="ids"
                                 value="${(list.id)!}" class="minimal checkbox-item">
                      </td>
                      <td>
                          ${(list.id)}
                      </td>
                      <td>
                          <a href="/cms/tCmsClassify/list/1?crt=${(cmsProgram.code)}&pid=${(list.id)}"> ${(list.classifyName)!}</a>
                      </td>
                      <td>${(list.dtCreate?string('yyyy-MM-dd'))!}</td>
                      <td>
                          <input type="text" id="sort_${(list.id)}" class="form-control td-input-80"
                                 onblur="oncheckCode(this)" name="values" value="${(list.sortIndex)!'--'}">
                      <td>
                      <@shiro.hasPermission name="editTCmsClassify">
                          <a class="btn btn-primary btn-xs dialog" href="javascript:;" data-title="编辑"
                             data-url="/cms/tCmsClassify/edit/${(list.id)!}"
                             data-width="1000" data-height="550"
                             data-toggle="tooltip" title="编辑" data-placement="bottom">编辑</a>
                      </@shiro.hasPermission>
                      <@shiro.hasPermission name="deleteTCmsClassify">
                          <a class="btn btn-danger btn-xs" data-toggle="tooltip" title="删除" data-placement="bottom"
                             data-tiggle="ajax"
                             data-submit-url="/cms/tCmsClassify/delete?id=${(list.id)!}"
                             data-confirm="您确定要删除该条记录吗?">删除</a>
                      </@shiro.hasPermission>
                      </td>
                  </tr>
              </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
         	  <#include "../../common/paginateBar.ftl" />
                      <@paginate pageData=pageData actionUrl="/cms/tCmsClassify/list/" urlParas="?search=${search!}&crt=${(cmsProgram.code)}&pid=#{pid!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
                            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/cms/tCmsClassify/list/" urlParas="?search=${search!}&crt=${(cmsProgram.code)}&pid=#{pid!}&pageSize=${pageSize!}"  />
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
</script>
</@footer>