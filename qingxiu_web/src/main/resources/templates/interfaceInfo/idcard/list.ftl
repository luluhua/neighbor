<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <small>手上青秀 > 身份证信息</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <form class="form-inline" action="/interfaceInfo/idcard/list/1" method="post">
                                <div class="input-group ">
                                    <button type="button" delete-batch-url="/interfaceInfo/idcard/deleteAll"
                                            class="btn btn-danger btn-flat">
                                        <i class="fa fa-remove"></i> 批量删除
                                </div>
                                <div class="input-group">
                                    <input type="text" name="search" value="${search!}" class="form-control"
                                           placeholder="姓名/民族/地址/身份证号/发证机关">
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
                                    <th>证件姓名</th>
                                    <th>性别</th>
                                    <th>民族</th>
                                    <th>出生日期</th>
                                    <th>地址</th>
                                    <th>身份证号</th>
                                    <th>证件的有效期</th>
                                    <th>发证机关</th>
                                </tr>
                                <#list pageData.getRecords() as idcard>
                                    <tr>
                                        <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids"
                                                                       value="${(idcard.id)!}"
                                                                       class="minimal checkbox-item"></td>
                                        <td>${(idcard.name)!}</td>
                                        <td>${(idcard.sex)!}</td>
                                        <td>${(idcard.nation)!}</td>
                                        <td>${(idcard.birth)!}</td>
                                        <td>${(idcard.address)!}</td>
                                        <td>${(idcard.idcard)!}</td>
                                        <td>${(idcard.validDate)!}</td>
                                        <td>${(idcard.authority)!}</td>
                                    </tr>
                                </#list>
                            </table>
                        </div><!-- /.box-body -->
                        <div class="box-footer row">
                            <div class="col-md-6">
                                <#include "../../common/paginateBar.ftl" />
                                <@paginate pageData=pageData actionUrl="/interfaceInfo/idcard/list/" urlParas="?search=${search!}&daterange=${daterange!}&smsType=${(smsType)!}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/interfaceInfo/idcard/list/" urlParas="?search=${search!}&daterange=${daterange!}&pageSize=${pageSize!}"  />
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