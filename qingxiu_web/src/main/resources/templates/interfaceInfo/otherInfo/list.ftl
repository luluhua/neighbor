<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <small>手上青秀 > 其他信息</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <form class="form-inline" action="/interfaceInfo/otherInfo/list/1" method="post">
                                <div class="input-group ">
                                    <button type="button" delete-batch-url="/interfaceInfo/otherInfo/deleteAll"
                                            class="btn btn-danger btn-flat">
                                        <i class="fa fa-remove"></i> 批量删除
                                </div>
                                <div class="input-group">
                                    <input type="text" name="search" value="${search!}" class="form-control"
                                           placeholder="用户名">
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
                                    <th>用户名</th>
                                    <th>婚否</th>
                                    <th>籍贯</th>
                                    <th>文化程度</th>
                                    <th>邮政编码</th>
                                    <th>邮箱</th>
                                    <th>年龄</th>
                                    <th>结婚证</th>
                                    <th>毕业证</th>
                                    <th>学历</th>
                                </tr>
                                <#list pageData.getRecords() as otherInfo>
                                    <tr>
                                        <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids"
                                                                       value="${(otherInfo.id)!}"
                                                                       class="minimal checkbox-item"></td>
                                        <td>${(otherInfo.username)!}</td>
                                        <td>${(otherInfo.hf)!}</td>
                                        <td>${(otherInfo.jg)!}</td>
                                        <td>${(otherInfo.whcd)!}</td>
                                        <td>${(otherInfo.yb)!}</td>
                                        <td>${(otherInfo.yx)!}</td>
                                        <td>${(otherInfo.age)!}</td>
                                        <td>${(otherInfo.jwz)!}</td>
                                        <td>${(otherInfo.byez)!}</td>
                                        <td>${(otherInfo.xl)!}</td>
                                    </tr>
                                </#list>
                            </table>
                        </div><!-- /.box-body -->
                        <div class="box-footer row">
                            <div class="col-md-6">
                                <#include "../../common/paginateBar.ftl" />
                                <@paginate pageData=pageData actionUrl="/interfaceInfo/otherInfo/list/" urlParas="?search=${search!}&daterange=${daterange!}&smsType=${(smsType)!}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/interfaceInfo/otherInfo/list/" urlParas="?search=${search!}&daterange=${daterange!}&pageSize=${pageSize!}"  />
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