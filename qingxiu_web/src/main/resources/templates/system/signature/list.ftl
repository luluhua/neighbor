<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>系统管理 > 部门管理[${(orgName)!''}]>电子印章</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/system/tSysOrgSignature/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                <@shiro.hasPermission name="addTSysOrgSignature">
                    <div class="input-group">
                        <#if pageData.getTotal() gt 0>
                            <a class="btn btn-primary" href="javascript:;" data-title="添加"
                               data-url="/system/tSysOrgSignature/add?orgId=${(orgId)?c}"
                               data-confirm="添加新印章，将停用旧印章，您确定添加新印章？"
                               data-width="1000" data-height="600" onclick="add(this)"><i class="fa fa-plus"></i> 添加</a>
                        <#else >
                            <a class="btn btn-primary dialog" href="javascript:;" data-title="添加"
                               data-url="/system/tSysOrgSignature/add?orgId=${(orgId)?c}"
                               data-width="1000" data-height="600"><i class="fa fa-plus"></i> 添加</a>
                        </#if>
                    </div>
                </@shiro.hasPermission>
                            <div class="input-group ">
                                <select  name="isEnabled" class="form-control  input-select-200">
                                    <option value="">--请选择启用状态--</option>
                                    <@dictTag method="getDictListByType" type="is_enabled" >
                                        <#list getDictListByType as m>
                                            <option value="${(m.value)!}">${(m.label)!}</option>
                                        </#list>
                                    </@dictTag>
                                </select>
                            </div>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="印章名称">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i>
                                    </button>
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
                                <th>电子印章名称</th>
                                <th>电子印章文件</th>
                                <th>创建时间</th>
                                <th>是否可用</th>
                                <th width="220px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>
                ${(entity.signatureName)!'--'}
            </td>
            <td>
                <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(entity.signatureFile)}" onclick="advPreviewImg(this)"/>
            </td>
            <td>${(entity.dtCreate?string('yyyy-MM-dd'))!'--'}</td>
            <td><@dictTag method="dictValueByType" type="is_enabled" value="${(entity.isEnabled)!}"> ${(dictValueByType)!}</@dictTag></td>
            <td>
                <@shiro.hasPermission name="editTSysOrgSignature">
                   <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                      data-url="/system/tSysOrgSignature/edit/${(entity.id)!}"
                      data-title="编辑" data-width="1000" data-height="600">编辑</a>
                    <#if "${(entity.isEnabled)!}"=="1">
                    <a class="btn btn-danger btn-xs"
                       data-tiggle="ajax"
                       data-submit-url="/system/tSysOrgSignature/changStatus?id=${(entity.id?c)!}"
                       data-confirm="您确定要停用该条记录吗?">停用</a>
                    <#else >
                    <a class="btn btn-primary btn-xs"
                       data-tiggle="ajax"
                       data-submit-url="/system/tSysOrgSignature/changStatus?id=${(entity.id?c)!}"
                       data-confirm="您确定要启用该条记录吗?">启用</a>
                    </#if>
                </@shiro.hasPermission>
            <@shiro.hasPermission name="deleteTSysOrgSignature">
            <a class="btn btn-danger btn-xs"
               data-tiggle="ajax"
               data-submit-url="/system/tSysOrgSignature/delete?id=${(entity.id)!}"
               data-confirm="您确定要删除该条记录吗?">删除</a>
            </@shiro.hasPermission>
            </td>
        </tr>
                </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <#--<div class="box-footer row">-->
                        <#--<div class="col-md-6">-->
            <#--<#include "../../common/paginateBar.ftl" />-->
	  		  <#--<@paginate pageData=pageData actionUrl="/appc/tSysOrgSignature/list/" urlParas="?search=${search!}"  />-->
                        <#--</div>-->
                        <#--<div class="col-md-6 pull-left">-->
            <#--<#include "../../common/paginate.ftl" />-->
            <#--<@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tSysOrgSignature/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />-->
                        <#--</div>-->
                    <#--</div>-->
                </div><!-- /.box -->
            </div>
        </div>
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</@body>
<@footer>
<script>
    function add(me) {
        var url = $(me).attr('data-url');
        width=$(me).attr('data-width') || 800,
                height=$(me).attr('data-height') || 400,
                title = $(me).attr('data-title') || '';
        var dataConfirm = $(me).attr("data-confirm");
        if(typeof(dataConfirm) != 'undefined'){
            $.confirm({
                type: 'red',
                closeIcon: true,
                title: '警告',
                content: dataConfirm ? dataConfirm : '确认操作?',
                buttons: {
                    '确认': {
                        btnClass: 'btn-blue',
                        action: function(){
                            x_admin_show(title,url,width,height);
                        }
                    },
                    '取消':{}
                }
            });
        }else{
            x_admin_show(title,url,width,height);
        }
    }
</script>
</@footer>