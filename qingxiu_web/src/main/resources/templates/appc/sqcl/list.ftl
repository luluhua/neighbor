<#include "../../common/layout.ftl">
<@header>
	<link rel="stylesheet" href="/app/css/baguetteBox.min.css">
<link rel="stylesheet" href="/app/css/gallery-clean.css">

</@header>
<@body>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">

        <h1>
            <small>手上青秀
                > 事项基础库
                > 申请材料管理
            </small>
        </h1>

    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tGovProjectSqcl/list/1" method="post"
                          class="form-inline">
                        <input type="hidden" name="projectId" value="${projectId!}"/>
                        <div class="box-header">
                <@shiro.hasPermission name="addTGovProjectSqcl">
                <div class="input-group">
                    <a class="btn btn-primary dialog" href="javascript:;" data-title="创建"
                       data-url="/appc/tGovProjectSqcl/add?projectId=${projectId!}"
                       data-width="1000" data-height="800"><i class="fa fa-plus"></i> 创建</a>
                </div>
                </@shiro.hasPermission>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="申请材料名称查询">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                            <div class="input-group pull-right">
                                <button type="button" class="btn btn-primary" onclick="javasript:history.back(-1)">
                                    <i class="fa fa-backward"></i>
                                    返 回
                                </button>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th class="td-width-350">申请材料名称</th>
                                <th class="td-width-200">申请材料依据</th>
                                <th class="td-width-100">材料类型(原件/复印件)</th>
                                <th class="td-width-150">是否需电子材料</th>
                                <th class="td-width-100">份数</th>
                                <th class="td-width-100">是否容缺</th>
                                <th class="td-width-100">样表图片</th>

                                <th class="td-width-150">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>${(entity.title)!'--'}</td>
            <td>${(entity.rule)!'--'}</td>
            <td>${(entity.ruleType)!'--'}</td>
            <td>${(entity.needDoc)!'--'}</td>
            <td>${(entity.count)!'--'}</td>
            <td>${(entity.canFallback)!'--'}</td>
            <td>
                <#if (entity.sampletableUrls)??&&"${(entity.sampletableUrls)}"!="">
                    <div id="imgsId" class="tz-gallery">
                         <#list entity.sampletableUrls?split(",") as name>
                             <#if name!=''>
                                  <a class="lightbox" style="display: <#if name_index==1>block<#else >none</#if>;"
                                     href="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(name)!}"><img
                                          src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(name)!}"
                                          width="25%"></a>
                             </#if>
                         </#list>
                    </div>
                </#if>
            </td>
            <td>
                <#if (entity.fileUrl)??&&"${(entity.fileUrl)}"!="">
                    <a class="btn btn-primary btn-xs" onclick="downLoadFile('${(entity.fileUrl)!""}','${(entity.title)!""}')"
                       href="javascript:;">空表下载
                    </a>
                <br/>
                </#if>

                <@shiro.hasPermission name="editTGovProjectSqcl">
                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                   data-url="/appc/tGovProjectSqcl/edit/${(entity.id)!}"
                   data-title="编辑" data-width="1000" data-height="800">编辑</a>
                </@shiro.hasPermission><br/>
            <@shiro.hasPermission name="deleteTGovProjectSqcl">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/appc/tGovProjectSqcl/delete?id=${(entity.id)!}"
               data-confirm="您确定要删除该条记录吗?">删除</a>
            </@shiro.hasPermission>
            </td>
        </tr>
                </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
            <#include "../../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/appc/tGovProjectSqcl/list/" urlParas="?search=${search!}&projectId=${projectId!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tGovProjectSqcl/list/" urlParas="?search=${search!}&pageSize=${pageSize!}&projectId=${projectId!}"  />
                        </div>
                    </div>
                </div><!-- /.box -->
            </div>
        </div>
    </section><!-- /.content -->
    <div id="imgsId" class="tz-gallery"></div>
</div><!-- /.content-wrapper -->

</@body>
<@footer>
<script src="/app/js/modules/baguetteBox.min.js"></script>
<script>
    var baseUrl = '<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>';
    function downLoadFile(fileUrl,fileName) {
        let _p = fileUrl.split(',');
        for (let i = 0; i < _p.length; i++) {
            if (_p[i] == '' || _p[i] == 'undefined') {
                continue;
            }
            downloadFile(baseUrl + _p[i], fileName + '_' +i+_p[i].substring(_p[i].indexOf(".")));
        }
    }

    function downloadFile(url, name) {
        console.log(name);
        setTimeout(function () {
            var _a = document.createElement("a");
            var evt = document.createEvent('HTMLEvents');
            evt.initEvent('click', false, false);
            _a.href = url + "?attname=" + name;
            _a.download = name;
            _a.target = "_blank";
            _a.dispatchEvent(evt);
            document.body.appendChild(_a);
            _a.click();
            setTimeout(function () {
                document.body.removeChild(_a);
            }, 1000);
        }, 100);
    }

    //弹出相册
    baguetteBox.run('.tz-gallery');
</script>
</@footer>