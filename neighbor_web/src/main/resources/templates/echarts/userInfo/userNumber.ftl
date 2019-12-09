<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                <small>统计管理 > 手机用户统计</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-lg-6 col-xs-6">
                    <!-- small box -->
                    <div class="small-box  bg-red">
                        <div class="inner">
                            <h3>${totalNum!'0'}</h3>
                            <p>累计注册用户总数</p>
                        </div>
                        <div class="icon">
                            <i class="fa "></i>
                        </div>
                    </div>
                </div><!-- ./col -->

                <div class="col-lg-6 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-green">
                        <div class="inner">
                            <h3>${todayNum!'0'}</h3>
                            <p>今日新增用户数量</p>
                        </div>
                        <div class="icon">
                            <i class="fa "></i>
                        </div>
                    </div>
                </div><!-- ./col -->

                <!-- fix for small devices only -->
                <div class="clearfix visible-sm-block"></div>
            </div>
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <tr>
                                    <th>日期</th>
                                    <th>截止到当天用户总数量</th>
                                    <th>当天用户增长数量</th>
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
                                <@paginate pageData=pageData actionUrl="/eAppUser/userNumber/" urlParas="?search=${search!}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/eAppUser/userNumber/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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