<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                <small>统计管理 > 设备增长统计</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-body table-responsive no-padding">
                            <div class="middle" style="padding: 10px">
                                <form class="form-inline" action="/eAppPushClients/list/1" method="post">
                                    <div class="input-group">年份：</div>
                                    <div class="input-group">
                                        <select name="year" class="form-control" lay-ignore>
                                            <option value="2019" <#if year??><#if year=="2019">selected="selected"</#if></#if> >2019</option>
                                            <option value="2020" <#if year??><#if year=="2020">selected="selected"</#if></#if> >2020</option>
                                            <option value="2021" <#if year??><#if year=="2021">selected="selected"</#if></#if> >2021</option>
                                            <option value="2022" <#if year??><#if year=="2022">selected="selected"</#if></#if> >2022</option>
                                            <option value="2023" <#if year??><#if year=="2023">selected="selected"</#if></#if> >2023</option>
                                        </select>
                                    </div>
                                    <div class="input-group">月份：</div>
                                    <div class="input-group">
                                        <select name="month" class="form-control" lay-ignore>
                                            <option value="1" <#if month??><#if month=="1">selected="selected"</#if></#if> >1</option>
                                            <option value="2" <#if month??><#if month=="2">selected="selected"</#if></#if> >2</option>
                                            <option value="3" <#if month??><#if month=="3">selected="selected"</#if></#if> >3</option>
                                            <option value="4" <#if month??><#if month=="4">selected="selected"</#if></#if> >4</option>
                                            <option value="5" <#if month??><#if month=="5">selected="selected"</#if></#if> >5</option>
                                            <option value="6" <#if month??><#if month=="6">selected="selected"</#if></#if> >6</option>
                                            <option value="7" <#if month??><#if month=="7">selected="selected"</#if></#if> >7</option>
                                            <option value="8" <#if month??><#if month=="8">selected="selected"</#if></#if> >8</option>
                                            <option value="9" <#if month??><#if month=="9">selected="selected"</#if></#if> >9</option>
                                            <option value="10" <#if month??><#if month=="10">selected="selected"</#if></#if> >10</option>
                                            <option value="11" <#if month??><#if month=="11">selected="selected"</#if></#if> >11</option>
                                            <option value="12" <#if month??><#if month=="12">selected="selected"</#if></#if> >12</option>
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
                            <table class="table table-hover">
                                <tr>
                                    <th>日期</th>
                                    <th>截止到当天设备总数量</th>
                                    <th>当天设备增长数量</th>
                                </tr>
                                <#list pageData.getRecords() as entity>
                                    <tr>
                                        <td>${(entity.sj)!}</td>
                                        <td>${(entity.num)!}</td>
                                        <td>${(entity.othernum)!}</td>
                                    </tr>
                                </#list>
                            </table>
                        </div><!-- /.box-body -->
                        <div class="box-footer row">
                            <div class="col-md-6">
                                <#include "../../common/paginateBar.ftl" />
                                <@paginate pageData=pageData actionUrl="/eAppPushClients/list/" urlParas="?year=${year!}&month=${month!}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/eAppPushClients/list/" urlParas="?year=${year!}&month=${month!}&pageSize=${pageSize!}"  />
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