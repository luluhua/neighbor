<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                <small>APP管理 > <a href="/appc/tAppEntry/list/1"> 分组列表</a> >[${(tAppEntry.titile)!}]分组应用列表</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <form action="/appc/tAppEntry/pidlist/1?pid=${(pid)}" method="post"
                              class="form-inline">
                            <div class="box-header">
                                <@shiro.hasPermission name="addTAppEntry">
                                    <div class="input-group">
                                        <a class="btn btn-primary dialog" href="javascript:;" data-title="添加应用"
                                           data-url="/appc/tAppEntry/add?pid=${(pid)}"
                                           data-width="1200" data-height="700"><i class="fa fa-plus"></i> 添加</a>
                                    </div>
                                </@shiro.hasPermission>
                                <div class="input-group ">
                                    <button type="button" update-batch-url="/appc/tAppEntry/updateSortAll"
                                            class="btn btn-primary btn-flat">
                                        <i
                                                class="fa  fa-hand-o-up"></i> 批量修改排序
                                </div>
                                <div class="input-group">
                                    <button type="button" delete-batch-url="/appc/tAppEntry/deleteAll"
                                            class="btn btn-danger btn-flat">
                                        <i
                                                class="fa fa-remove"></i> 批量删除
                                </div>

                                <div class="input-group">
                                    <select name="actionType" class="form-control">
                                        <option value="">--动作类型--</option>
                                        <@dictTag method="getDictListByType" type="action_type" >
                                            <#list getDictListByType as m>
                                                <option value="${(m.value)!}"
                                                        <#if "${(m.value)!}"=="${(actionType)!}">selected</#if>
                                                >${(m.label)!}</option>
                                            </#list>

                                        </@dictTag>
                                    </select>
                                </div>
                                <div class="input-group">
                                    <input type="text" name="search" value="${search!}" class="form-control"
                                           placeholder="应用名称">
                                </div>

                                <div class="input-group">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i>
                                        </button>
                                    <#--                                        <a href="/appc/tAppEntry/pidlist/1?pid=${(pid)}"-->
                                    <#--                                           class="btn btn-default"><i class="fa fa-refresh"></i></a>-->
                                    </div>
                                </div>

                            </div><!-- /.box-header -->
                        </form>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover my-table">
                                <tr>
                                    <th style="white-space: nowrap"><input type="checkbox" lay-filter="allCheck"
                                                                           value="root"
                                                                           class="minimal  checkbox-toolbar"
                                                                           lay-ignore>全选
                                    </th>
                                    <th style="white-space: nowrap">应用代码</th>
                                    <th style="white-space: nowrap">应用名称</th>
                                    <th style="white-space: nowrap">应用图标</th>
                                    <th style="white-space: nowrap">状态</th>
                                    <th style="white-space: nowrap">启用</th>
                                    <th style="white-space: nowrap">动作类型</th>
                                    <th style="width: 25%;">动作目标地址</th>
                                    <th style="white-space: nowrap">顺序</th>
                                    <th style="white-space: nowrap">创建日期</th>
                                    <th width="120px">操作</th>
                                </tr>
                                <#list pageData.getRecords() as entity>
                                    <tr>
                                        <td class="td_checkbox"><input type="checkbox" lay-filter="campus" name="ids"
                                                                       value="${(entity.id?c)!}"
                                                                       class="minimal checkbox-item">
                                        </td>
                                        <td>
                                            ${(entity.code)!'--'}
                                        </td>
                                        <td>
                                            ${(entity.titile)!'--'}
                                        </td>
                                        <td>
                                            <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(entity.icon)!'--'}"
                                                 width="40px" height="40px"></td>

                                        <td>
                                            <#if entity.hot==1>
                                                <img src="../../../images/hot.png" width="20px"
                                                     height="20px">
                                            <#else >--
                                            </#if>
                                            <#if entity.recommend==1><img src="../../../images/tuijian.png" width="20px"
                                                                          height="20px"> <#else >--</#if>
                                        </td>
                                        <td>
                                            <@dictTag method="dictValueByType" type="is_yes_no" value="${(entity.isEnabled)!}"> ${(dictValueByType)!}</@dictTag>
                                        </td>
                                        <td>
                                            <@dictTag method="dictValueByType" type="action_type" value="${(entity.actionType)!}"> ${(dictValueByType)!}</@dictTag>
                                        </td>
                                        <td style=" word-wrap: break-word;">
                                            (android): <a href="${(entity.actionPage1)!'--'}" target="_blank"
                                                          title="${(entity.actionPage1)!'--'}">${(entity.actionPage1)!'--'}</a>
                                            <br/>
                                            (ios): <a href="${(entity.actionPage2)!'--'}" target="_blank"
                                                      title="${(entity.actionPage2)!'--'}">  ${(entity.actionPage2)!'--'}</a>
                                        </td>
                                        <td><input type="text" class="form-control td-input-80"
                                                   onblur="oncheckCode(this)" id="sort_${(entity.id?c)}"
                                                   name="values" value="${(entity.sortIndex?c)!'--'}">
                                        </td>
                                        <td style="white-space: nowrap">${(entity.dtCreate?string('yyyy-MM-dd'))!'--'}</td>
                                        <td>
                                            <@shiro.hasPermission name="editTAppEntry">
                                                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                                                   data-url="/appc/tAppEntry/edit/${(entity.id)!}?pid=${(pid)!}"
                                                   data-title="编辑" data-width="1200" data-height="700">编辑</a>
                                            </@shiro.hasPermission>
                                            <@shiro.hasPermission name="deleteTAppEntry">
                                                <a class="btn btn-danger btn-xs"
                                                   data-tiggle="ajax"
                                                   data-submit-url="/appc/tAppEntry/delete?id=${(entity.id)!}"
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
                                <@paginate pageData=pageData actionUrl="/appc/tAppEntry/pidlist/" urlParas="?search=${search!}&pid=${pid}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tAppEntry/pidlist/" urlParas="?search=${search!}&pageSize=${pageSize!}&pid=${pid}"  />
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