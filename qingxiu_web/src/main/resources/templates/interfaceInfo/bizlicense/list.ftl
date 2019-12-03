<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <small>手上青秀 > 营业执照</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <form class="form-inline" action="/interfaceInfo/bizlicense/list/1" method="post">
                                <div class="input-group ">
                                    <button type="button" delete-batch-url="/interfaceInfo/bizlicense/deleteAll"
                                            class="btn btn-danger btn-flat">
                                        <i class="fa fa-remove"></i> 批量删除
                                </div>
                                <div class="input-group">
                                    <input type="text" name="search" value="${search!}" class="form-control"
                                           placeholder="注册号/法定代表人/公司名称/地址/经营范围">
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
                                    <th>公司名称</th>
                                    <th>注册号</th>
                                    <th>法定代表人</th>
                                    <th>注册资本</th>
                                    <th>地址</th>
                                    <th>营业期限</th>
                                    <th>经营范围</th>
                                    <th>主体类型</th>
                                </tr>
                                <#list pageData.getRecords() as bizlicense>
                                    <tr>
                                        <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids"
                                                                       value="${(bizlicense.id)!}"
                                                                       class="minimal checkbox-item"></td>
                                        <td>${(bizlicense.gsmc)!}</td>
                                        <td>${(bizlicense.zch)!}</td>
                                        <td>${(bizlicense.fddb)!}</td>
                                        <td>${(bizlicense.zczb)!}</td>
                                        <td>${(bizlicense.dizhi)!}</td>
                                        <td>${(bizlicense.yyqx)!}</td>
                                        <td>${(bizlicense.jyfw)!}</td>
                                        <td>${(bizlicense.ztlx)!}</td>
                                    </tr>
                                </#list>
                            </table>
                        </div><!-- /.box-body -->
                        <div class="box-footer row">
                            <div class="col-md-6">
                                <#include "../../common/paginateBar.ftl" />
                                <@paginate pageData=pageData actionUrl="/interfaceInfo/bizlicense/list/" urlParas="?search=${search!}&daterange=${daterange!}&smsType=${(smsType)!}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/interfaceInfo/bizlicense/list/" urlParas="?search=${search!}&daterange=${daterange!}&pageSize=${pageSize!}"  />
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