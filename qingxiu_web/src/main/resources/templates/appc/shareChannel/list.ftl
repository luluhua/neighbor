<#include "../../common/layout.ftl">
<@header>
<script src="/base/js/clipboard.min.js"></script>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>分享渠道 > 列表管理</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tAppUserShareChannel/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                <@shiro.hasPermission name="addTAppUserShareChannel">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="创建渠道"
                       data-url="/appc/tAppUserShareChannel/add?pid=${(pid)!}"
                       data-width="800" data-height="400"><i class="fa fa-plus"></i> 创建渠道</a>
                </div>
                <div class="input-group">
                    <button type="button" data-tiggle='ajaxRetrun' data-submit-url="/appc/tAppUserShareChannel/allShareStatistics" data-confirm="一键统计会对服务器产生一定的影响！您确定现在已经是空闲时候吗？" class="btn btn-primary btn-flat">
                        <i class="fa fa-plus"></i> 一键统计（慎用）
                </div>
                <div class="input-group ">
                    <button type="button" delete-batch-url="/appc/tAppUserShareChannel/deleteAll" class="btn btn-danger btn-flat">
                        <i class="fa fa-remove"></i> 批量删除
                </div>
                </@shiro.hasPermission>

                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="输入渠道名称或渠道编号">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                            <div class="input-group pull-right">
                                 <#if (pid)??>
                                    <button type="button" class="btn btn-primary btn-flat" onclick="window.location.href='/appc/tAppUserShareChannel/list/1?id=${(pid)!}'" style="margin-right: 10px;"><i
                                            class="fa"></i> 返回上页
                                    </button>
                                 </#if>
                                <button type="button" class="btn btn-primary btn-flat" onclick="exportTo('渠道数据');"><i
                                        class="fa fa-file-excel-o"></i> 导出
                                </button>



                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover" style=" table-layout: fixed; width: 100%;text-align: left;">
                            <tr>
                                <th width="50px"><input type="checkbox"lay-filter="allCheck"  value="root" class="minimal  checkbox-toolbar"
                                            lay-ignore  >全选
                                </th>
                                <th width="50px">渠道编号</th>
                                <th width="100px">渠道名称</th>
                                <th width="100px">渠道链接</th>
                                <th width="100px">创建时间</th>
                                <th width="50px">浏览量</th>
                                <th width="50px">下载量</th>
                                <th width="50px">激活量</th>
                                <th width="50px">绑定用户量</th>
                                <th width="120px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td class="td_checkbox" style="width: 50px;"><input type="checkbox" lay-filter="campus" name="ids" value="${(entity.id)!}"
                                           class="minimal checkbox-item"></td>
            <td style="white-space: nowrap;width: 50px;">${(entity.code)!'--'}</td>
            <td style="width: 100px;white-space: nowrap; overflow: hidden;text-overflow: ellipsis;"><a class="btn  dialog" href="javascript:;"style="color: #0C70C4;padding: 0;"
                   data-url="/appc/tAppUserShareChannel/updateChannelName?id=${(entity.id)!}"
                   data-title="修改渠道名称" data-width="300" data-height="200">${(entity.name)!'--'}</a></td>
            <td style="width: 100px;white-space: nowrap; overflow: hidden;text-overflow: ellipsis;"><a class="btn  dialog" href="javascript:;"
                   data-url="/appc/tAppUserShareChannel/queryQrCode?id=${(entity.id)!}"style="color: #0C70C4;padding: 0;"
                   data-title="渠道二维码" data-width="350" data-height="400">${(entity.url)!'--'}</a></td>
            <td style="white-space: nowrap;width: 100px;">${(entity.dtCreate?string('yyyy-MM-dd HH:mm:ss'))!'--'}</td>
            <td style="width: 50px">${(entity.browseNum)!'--'}</td>
            <td style="width: 50px">${(entity.dowloadNum)!'--'}</td>
            <td style="width: 50px">${(entity.activationNum)!'--'}</td>
            <td style="width: 50px">${(entity.bindUserNum)!'--'}</td>
            <td style="white-space: nowrap;width: 120px;">
                <@shiro.hasPermission name="editTAppUserShareChannel">
                <a class="btn btn-primary btn-xs " href="/appc/tAppUserShareChannel/list/1?pid=${(entity.id)!}">下级渠道</a>
                </@shiro.hasPermission>
                    <a class="btn btn-primary btn-xs " href="/appc/tAppUserShareChannel/channelUserList/1?id=${(entity.id)!}">渠道用户</a>
                <a class="btn btn-primary btn-xs "id="shareBtn"  data-clipboard-demo=""  data-clipboard-action="copy" data-clipboard-text="${(entity.url)!}" href="javascript:void(0);">分享链接</a>

           </td>
        </tr>
                </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
            <#include "../../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/appc/tAppUserShareChannel/list/" urlParas="?search=${search!}&pid=${(pid)!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tAppUserShareChannel/list/" urlParas="?search=${search!}&pageSize=${pageSize!}&pid=${(pid)!}"  />
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
    $(function () {
        //写入剪切板
        if (ClipboardJS.isSupported()) {
            var clipboard = new ClipboardJS('[data-clipboard-demo]');
            clipboard.on('success', function (e) {
                alert("分享链接已复制");
            });
            clipboard.on('error', function (e) {
                console.log(JSON.stringify(e));
            });
        }
    })
</script>
</@footer>