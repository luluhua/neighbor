<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                <small>统计管理 > 个人/法人事项统计</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <form class="form-inline" action="/eProject/countProjectByThemeType/1" method="post">
                                <div class="input-group">类型：</div>
                                <div class="input-group">
                                    <select name="type" class="form-control" lay-ignore>
                                        <option value="1" <#if type??><#if type=="1">selected="selected"</#if></#if> >个人</option>
                                        <option value="2" <#if type??><#if type=="2">selected="selected"</#if></#if> >法人</option>
                                    </select>
                                </div>
                                <div class="input-group">
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
                                    <th>统计类型</th>
                                    <th>事项数量</th>
                                </tr>
                                <#list pageData.getRecords() as entity>
                                    <tr>
                                        <td>${(entity.title)!}</td>
                                        <td>${(entity.num)!}</td>
                                    </tr>
                                </#list>
                            </table>
                        </div><!-- /.box-body -->
                        <div class="box-footer row">
                            <div class="col-md-6">
                                <#include "../../common/paginateBar.ftl" />
                                <@paginate pageData=pageData actionUrl="/eProject/countProjectByThemeType/" urlParas="?type=${type!}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/eProject/countProjectByThemeType/" urlParas="?type=${type!}&pageSize=${pageSize!}"  />
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