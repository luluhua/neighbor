<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <small>智慧党建 > 党员信息管理</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <form action="/dj/partymember/list/1" method="post" class="form-inline">
                            <div class="box-header">
                                <@shiro.hasPermission name="addTDjPartymember">
                                <div class="input-group">
                                    <a class="btn btn-primary dialog" href="javascript:;" data-title="添加党员信息"
                                       data-url="/dj/partymember/add" data-width="800" data-height="480"><i
                                            class="fa fa-plus"></i> 添加</a>
                                </div>
                                </@shiro.hasPermission>
                                <@shiro.hasPermission name="editTDjPartymember">
                                <div class="input-group " >
                                    <button type="button" update-batch-url="/dj/partymember/updateSortAll"
                                            class="btn btn-primary btn-flat">
                                        <i
                                                class="fa  fa-hand-o-up"></i> 批量修改排序
                                </div>
                                </@shiro.hasPermission>
                                <div class="input-group">
                                    <input type="text" name="search" value="${search!}" class="form-control"
                                           placeholder="姓名/所在党支部">
                                </div>
                                <div class="input-group">
                                    <select name="education" class="form-control select2 input-select-200" style="width: 500px" lay-ignore>
                                        <@dictTag method="getDictListByType" type="edu_detail" >
                                            <option value="">---请选择学历---</option>
                                            <#list getDictListByType as m>
                                                    <option value="${(m.value)!}" <#if "${(m.value)!}"=="${(education)!}">selected</#if> >${(m.label)!}</option>
                                                </#list>
                                        </@dictTag>
                                    </select>
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i>
                                    </button>
                                </div>
                                <@shiro.hasPermission name="exportTDjPartymember">
                                <div class="input-group pull-right">
                                    <a class="btn btn-primary btn-flat dialog" href="javascript:;" data-title="党员信息导出"
                                       data-url="/dj/partymember/gotoExportExcel" data-width="600" data-height="180"><i
                                            class="fa fa-file-excel-o"></i> 导出
                                    </a>
                                </div>
                                </@shiro.hasPermission>
                                <@shiro.hasPermission name="importTDjPartymember">
                                <div class="input-group pull-right">
                                    <a class="btn btn-primary btn-flat dialog" href="javascript:;" data-title="党员信息导入"
                                       data-url="/dj/partymember/gotoImportExcel" data-width="400" data-height="450"><i
                                            class="fa fa-file-excel-o"></i> 导入
                                    </a>
                                </div>
                                </@shiro.hasPermission>
                            </div><!-- /.box-header -->
                        </form>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <tr>
                                    <th ><input type="checkbox"lay-filter="allCheck"  value="root" class="minimal  checkbox-toolbar"
                                                lay-ignore  >全选</th>
                                    <th>姓名</th>
                                    <th>性别</th>
                                    <th>出生日期</th>
                                    <th>入党日期</th>
                                    <th>学历</th>
                                    <th>所在党支部</th>
                                    <th>排序</th>
                                    <th width="220px">操作</th>
                                </tr>
                                <#list pageData.getRecords() as entity>
                                    <tr>
                                        <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids" value="${((entity.id)?c)!}"
                                                                       class="minimal checkbox-item"></td>
                                        <td>${(entity.name)!"--"}</td>
                                        <td>${(entity.sex)!"--"}</td>
                                        <td>${(entity.birthday)!"--"}</td>
                                        <td>${(entity.partyDate)!'--'}</td>
                                        <td><@dictTag method="dictValueByType" type="edu_detail" value="${(entity.education)!'--'}"> ${(dictValueByType)!}</@dictTag></td>
                                        <td>${(entity.partyBranchOrg)!"--"}</td>
                                        <td>
                                            <input type="text" class="form-control td-input-80"
                                                   onblur="oncheckCode(this)"  id="sort_${(entity.id)}"
                                                   name="values" value="${(entity.sort)!'--'}">
                                        </td>
                                        <td>
                                            <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                                               data-title="党员信息详情" data-url="/dj/partymember/view/${(entity.id)!}"
                                               ,data-width="800" data-height="480"> <i
                                                    class="fa fa-pencil-square-o"></i> 查看详情</a>
                                            <@shiro.hasPermission name="editTDjPartymember">
                                            <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                                               data-title="编辑党员信息" data-url="/dj/partymember/edit/${(entity.id)!}"
                                               ,data-width="800" data-height="480"> <i
                                                    class="fa fa-pencil-square-o"></i> 编辑</a>
                                            </@shiro.hasPermission>
                                            <@shiro.hasPermission name="deleteTDjPartymember">
                                            <a class="btn btn-danger btn-xs"
                                               data-tiggle="ajax"
                                               data-submit-url="/dj/partymember/delete?id=${(entity.id)!}"
                                               data-confirm="您确定要删除该条记录吗?"><i class="fa fa-times"></i> 删除</a>
                                            </@shiro.hasPermission>
                                        </td>
                                    </tr>
                                </#list>
                            </table>
                        </div><!-- /.box-body -->
                        <div class="box-footer row">
                            <div class="col-md-6">
                                <#include "../../common/paginateBar.ftl" />
                                <@paginate pageData=pageData actionUrl="/dj/partymember/list/" urlParas="?search=${search!}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/dj/partymember/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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

    function newExportTo() {

    }

</script>
</@footer>