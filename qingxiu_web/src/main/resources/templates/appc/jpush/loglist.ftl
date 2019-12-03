<#include "../../common/layout_dl.ftl">
<@header>
    <link rel="stylesheet" href="/plugins/layui/css/layui.css">
    <link rel="stylesheet" href="/plugins/json-viewer/css/jquery.json-viewer.css">
</@header>
<@body>
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <tr>
                                <#--<th >序号</th>-->
                                    <th>时间</th>
                                    <#--<th>OS</th>-->
                                    <th>结果</th>
                                </tr>
                                <#list list as entity>
                                    <tr>
                                    <#--<td class="td_checkbox"></td>-->
                                        <td>
                                            ${(entity.createTime?string('yyyy-MM-dd HH:mm:ss'))!'--'}
                                        </td>
                                        <#--<td>${(entity.platform)!'--'}</td>-->
                                        <td>${(entity.exceptionMsg)!''}${(entity.resultJson)!''}</td>
                                    </tr>
                                </#list>
                            </table>
                        </div><!-- /.box-body -->
                    </div><!-- /.box -->
                </div>
            </div>
        </section><!-- /.content -->
</@body>
<@footer>

</@footer>