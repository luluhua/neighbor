<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <small>系统管理 > 附件管理</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <form action="/tAttachments/file/list/1" method="post" class="form-inline">
                            <div class="box-header">
                                <div class="input-group">
                                    <select name="search" class="form-control select2 input-select-200">
                                        <option value="">--附件分类--</option>
                                            <#list dictlist as m>
                                                <option <#if "${(m.value)!}"=="${(search)!}">selected</#if>
                                                        value="${(m.value)!}">${(m.label)!}</option>
                                            </#list>
                                    </select>
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i>
                                    </button>
                                </div>
                            </div><!-- /.box-header -->
                        </form>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <tr>
                                    <th>附件名称</th>
                                    <th>附件原名</th>
                                    <th>附件类型</th>
                                    <th>缩略图</th>
                                    <th>附件大小</th>
                                    <th>上传时间</th>
                                    <th>所属业务</th>
                                    <th>操作</th>
                                </tr>
                                <#list pageData.getRecords() as file>
                                    <tr>
                                        <td>${(file.name)!'未知'} </td>
                                        <td>${(file.fileOldName)!'未知'} </td>
                                        <td>
                                            <@commonTags method="getFileSuffix" type="1" value="${(file.name)!}">
                                                 <#if getFileSuffix==0>
                                                 图片
                                                 <#else >
                                                 文件
                                                 </#if>
                                            </@>
                                        </td>
                                        <td>
                                    <@commonTags method="getFileSuffix" type="1" value="${(file.name)!}">
                                        <#if getFileSuffix==0>
                                            <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(file.filePath)!''}"
                                                 width="40px" height="40px" onclick="previewImg(this)"
                                                 onerror="this.src='../../../images/default.png'">
                                        <#else >
                                        <img style="width: 40px;height:40px" class="imgdows"
                                             src="../../../images/file_wj.png  ">
                                        </#if>
                                    </@>
                                        </td>
                                        <td>${(file.fileSize)!'--'}kb</td>
                                        <td>${(file.createDatetime?string('yyyy/MM/dd HH:mm:ss'))}</td>
                                        <td>
                                           <#list dictlist as m>
                                               <#if "${(m.value)!}"=="${(file.classify)!}">${(m.label)!"未知"}</#if>
                                           </#list>
                                        </td>
                                        <td>
                                            <a class="btn  btn-primary btn-xs"
                                               href="/download/downloadfile?paths=${(file.filePath)!''}">下载</a>
                                        </td>
                                    </tr>
                                </#list>
                            </table>
                        </div><!-- /.box-body -->
                        <div class="box-footer row">
                            <div class="col-md-6">
                                <#include "../../common/paginateBar.ftl" />
                                <@paginate pageData=pageData actionUrl="/tAttachments/file/list/" urlParas="?search=${search!}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/tAttachments/file/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
                            </div>
                        </div>
                    </div><!-- /.box -->
                </div>
            </div>
        </section><!-- /.content -->
    </div><!-- /.content-wrapper -->
</@body>
<@footer>

</@footer>