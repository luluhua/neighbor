<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>内容管理 > <a href="/tCmsAdvpos/list/1"> 广告位列表[${(advpos.name)!}]</a> > 广告管理</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/cms/tCmsAdv/list/1?advPosId=${(advpos.id)!}" method="post" class="form-inline">
                        <div class="box-header">
                        <@shiro.hasPermission name="addTCmsAdv">
                            <div class="input-group">
                                <a class="btn btn-primary" href="/cms/tCmsAdv/add/${(advpos.id)!}" data-title="添加"
                                ><i class="fa fa-plus"></i> 添加</a>
                            </div>
                        </@shiro.hasPermission>
                            <div class="input-group">
                                <button type="button" update-batch-url="/cms/tCmsAdv/updateSortAll"
                                        class="btn btn-primary btn-flat">
                                    <i class="fa  fa-hand-o-up"></i> 批量修改排序
                            </div>
                            <div class="input-group ">
                                <button type="button" delete-batch-url="/cms/tCmsAdv/deleteAll"
                                        class="btn btn-danger btn-flat">
                                    <i class="fa fa-remove"></i> 批量删除
                            </div>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="请输入搜索名称">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th><input type="checkbox" lay-filter="allCheck" value="root"
                                           class="minimal  checkbox-toolbar"
                                           lay-ignore>全选
                                </th>
                                <th>缩略图</th>
                                <th>名称</th>
                                <th>类型</th>
                                <th>说明</th>
                                <th>创建时间</th>
                                <th>有效时间</th>
                                <th>排序</th>
                                <th>状态</th>
                                <th width="150px">操作</th>
                            </tr>
              <#list list as adv>
              	  <tr>
                      <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids"
                                                     value="${(adv.id)!}"
                                                     class="minimal checkbox-item"></td>
                      <td>
                      <#if adv.advType !=2>
                          <img onclick="advPreviewImg(this)"
                               src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(adv.content)!'--'}"
                               onerror="this.src='../../../images/default.png'" style="width: 80px">
                      <#else >
                      --
                      </#if>
                      </td>
                      <td>${(adv.advTitle)!}</td>
                      <td><#if adv.advType==1>图片<#elseif adv.advType==2>图文 <#elseif adv.advType==3>action</#if></td>
                      <td>${(adv.advRemark)!}</td>
                      <td>${(adv.dtCreate?string('yyyy-MM-dd'))!}</td>
                      <td>${(adv.dtStart?string('yyyy-MM-dd'))!}
                          —${(adv.dtEnd?string('yyyy-MM-dd'))!}</td>
                      <td>
                          <input type="text" id="sort_${(adv.id)}" class="form-control td-input-80"
                                 onblur="oncheckCode(this)" name="values" value="${(adv.sortIndex)!'--'}">
                      </td>
                      <td><#if adv.status==0>未发布<#elseif adv.status==1>已发布<#else>已下架</#if></td>
                      <td>
                      <@shiro.hasPermission name="editTCmsAdv">
                          <a class="btn btn-primary btn-xs " href="/cms/tCmsAdv/edit/${(adv.id)!}" data-title="编辑"
                             title="编辑" data-placement="bottom">编辑</a>
                      </@shiro.hasPermission>
                      <@shiro.hasPermission name="deleteTCmsAdv">
                          <a class="btn btn-danger btn-xs" data-toggle="tooltip" title="删除" data-placement="bottom"
                             data-tiggle="ajax"
                             data-submit-url="/cms/tCmsAdv/delete?id=${(adv.id)!}"
                             data-confirm="您确定要删除该条记录吗?">删除</a>
                      </@shiro.hasPermission>
                      <#--<@shiro.hasPermission name="deleteTCmsAdv">-->
                          <a class="btn btn-danger btn-xs" data-toggle="tooltip" title="发布"
                             data-placement="bottom"
                             data-tiggle="ajax" style="display: <#if adv.status==0 || adv.status==2><#else>none</#if>"
                             data-submit-url="/cms/tCmsAdv/operate?id=${(adv.id)!}&status=1"
                             data-confirm="您确定要发布此条广告吗?">发布</a>
                          <a class="btn btn-danger btn-xs" data-toggle="tooltip" title="下架" data-placement="bottom"
                             data-tiggle="ajax" style="display: <#if adv.status==1><#else>none</#if>"
                             data-submit-url="/cms/tCmsAdv/operate?id=${(adv.id)!}&status=2"
                             data-confirm="您确定要下架此条广告吗?">下架</a>

                      <#--</@shiro.hasPermission>-->
                      </td>
                  </tr>
              </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
         	  <#include "../../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/cms/tCmsAdv/list/" urlParas="?search=${search!}&pageSize=${pageSize!}&advPosId=${(advpos.id)!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
 			<@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/cms/tCmsAdv/list/" urlParas="?search=${search!}&pageSize=${pageSize!}&advPosId=${(advpos.id)!}"  />
                        </div>
                    </div>
                </div><!-- /.box -->
            </div>
        </div>
    </section><!-- /.content -->
</div>
</@body>
<@footer>
<script type="application/javascript">
    function Integer(value, min, max) {
        eval("var reg = /\^[1-9]\\d{" + min + "," + (max - 1) + "\}$/;");
        var re = new RegExp(reg);
        if (re.test(value)) {
            return true;
        }
        else {
            return false;
        }
    }

    function oncheckCode(item) {
        if (!Integer($(item).val(), 1, 10)) {
            $(item).val("10");
        }
    }
</script>
</@footer>