<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <small>手上青秀 > 组织代码证</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <form class="form-inline" action="/interfaceInfo/zzdmz/list/1" method="post">
                                <div class="input-group ">
                                    <button type="button" delete-batch-url="/interfaceInfo/zzdmz/deleteAll"
                                            class="btn btn-danger btn-flat">
                                        <i class="fa fa-remove"></i> 批量删除
                                </div>
                                <div class="input-group">
                                    <input type="text" name="search" value="${search!}" class="form-control"
                                           placeholder="机构代码/机构名称/地址/机构类型/颁发单位">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <tr>
                                    <th><input type="checkbox" lay-filter="allCheck" value="root"
                                               class="minimal  checkbox-toolbar"
                                               lay-ignore>全选
                                    </th>
                                    <th>机构代码</th>
                                    <th>机构名称</th>
                                    <th>地址</th>
                                    <th>有效期</th>
                                    <th>机构类型</th>
                                    <th>颁发单位</th>
                                    <th>登记号</th>
                                </tr>
                                <#list pageData.getRecords() as zzdmz>
                                    <tr>
                                        <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids"
                                                                       value="${(zzdmz.id)!}"
                                                                       class="minimal checkbox-item"></td>
                                        <td>${(zzdmz.code)!}</td>
                                        <td>${(zzdmz.name)!}</td>
                                        <td>${(zzdmz.address)!}</td>
                                        <td>${(zzdmz.yxq)!}</td>
                                        <td>${(zzdmz.companyType)!}</td>
                                        <td>${(zzdmz.issuingUnit)!}</td>
                                        <td>${(zzdmz.registrationNo)!}</td>
                                    </tr>
                                </#list>
                            </table>
                        </div><!-- /.box-body -->
                        <div class="box-footer row">
                            <div class="col-md-6">
                                <#include "../../common/paginateBar.ftl" />
                                <@paginate pageData=pageData actionUrl="/interfaceInfo/zzdmz/list/" urlParas="?search=${search!}&daterange=${daterange!}&smsType=${(smsType)!}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/interfaceInfo/zzdmz/list/" urlParas="?search=${search!}&daterange=${daterange!}&pageSize=${pageSize!}"  />
                            </div>
                        </div>
                    </div><!-- /.box -->
                </div>
            </div>
        </section><!-- /.content -->
    </div><!-- /.content-wrapper -->
</@body>
<@footer>
    <script>
    </script>
</@footer>