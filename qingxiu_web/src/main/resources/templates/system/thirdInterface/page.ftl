<#include "../../common/layout.ftl">
<@header>
    <link rel="stylesheet" href="/plugins/layui/css/layui.css">
</@header>
<@body>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <small>接口管理 > 第三方接口管理</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="layui-tab layui-tab-brief" lay-filter="demo">
                            <ul class="layui-tab-title">
                                <@dictTag method="getDictListByType" type="third_Interface_group" >
                                    <#list getDictListByType as m>
                                        <li class="${(m.value==(interfaceGroupId?c))?string('layui-this','')}"
                                            id="tab_${(m.value)!}" lay-data="${(m.value)!}">${(m.label)!}</li>
                                    </#list>
                                </@dictTag>
                            </ul>
                            <div class="layui-tab-content">
                                <@dictTag method="getDictListByType" type="third_Interface_group" >
                                    <#list getDictListByType as mm>
                                        <div class="layui-tab-item ${(mm.value==(interfaceGroupId?c))?string('layui-show','')}"
                                             lay-data="${(mm.value)}">
                                            <div class=""><!--列表开始-->
                                                <div class="col-xs-12" style="float: unset;">
                                                    <div class="box">
                                                        <form action="/system/tThirdInterfaceConfig/list/1?interfaceGroup=${(interfaceGroupId)}"
                                                              method="post" class="form-inline">
                                                            <input type="hidden" value="${(mm.value)}"
                                                                   name="interfaceGroup">
                                                            <div class="box-header">
                                                                <div class="input-group">
                                                                            <@shiro.hasPermission name="addUser">
                                                                                <a class="btn btn-primary dialog"
                                                                                   href="javascript:;"
                                                                                   data-url="/system/tThirdInterfaceConfig/add?interfaceGroup=${(interfaceGroupId)}"
                                                                                   data-title="添加接口" data-width="850"
                                                                                   data-height="650"><i
                                                                                        class="fa fa-plus"></i>添加</a>
                                                                            </@shiro.hasPermission>
                                                                </div>
                                                                <div class="input-group">
                                                                    <select name="interfaceOrigin" class="form-control">
                                                                        <option value="">--接口来源--</option>
                                                                                <@dictTag method="getDictListByType" type="third_interface_origin" >
                                                                                    <#list getDictListByType as m>
                                                                                        <option value="${(m.value)!}"
                                                                                                <#if "${(m.value)!}"=="${(interfaceOrigin)!}">selected</#if>
                                                                                        >${(m.label)!}</option>
                                                                                    </#list>

                                                                                </@dictTag>
                                                                    </select>
                                                                </div>
                                                                <div class="input-group">
                                                                    <select name="requestMode" class="form-control">
                                                                        <option value="">--请求方式--</option>
                                                                                <@dictTag method="getDictListByType" type="third_interface_request_mode" >
                                                                                    <#list getDictListByType as m>
                                                                                        <option value="${(m.value)!}"
                                                                                                <#if "${(m.value)!}"=="${(requestMode)!}">selected</#if>
                                                                                        >${(m.label)!}</option>
                                                                                    </#list>

                                                                                </@dictTag>
                                                                    </select>
                                                                </div>

                                                                <div class="input-group">
                                                                    <input type="text" name="search" value="${search!}"
                                                                           class="form-control"
                                                                           placeholder="接口名称查询">
                                                                    <div class="input-group-btn">
                                                                        <button class="btn btn-default" type="submit"><i
                                                                                class="fa fa-search"></i>
                                                                        </button>
                                                                    <#--                                                                                <a href="/system/tThirdInterfaceConfig/list/1?interfaceGroup=${(interfaceGroupId)}" class="btn btn-default"><i-->
                                                                    <#--                                                                                            class="fa fa-refresh"></i></a>-->
                                                                    </div>
                                                                </div>
                                                            </div><!-- /.box-header -->
                                                        </form>
                                                        <div class="box-body table-responsive no-padding">
                                                            <table class="table table-hover">
                                                                <tr>
                                                                    <th>接口名称</th>
                                                                    <th>接口标识</th>
                                                                    <th>请求方式</th>
                                                                    <th>接口版本</th>
                                                                    <th>接口类型</th>
                                                                    <th>接口来源</th>
                                                                <#--<th>接口地址</th>-->
                                                                    <th>接口图标</th>
                                                                    <th>状态</th>
                                                                    <th>接口操作</th>
                                                                    <th>系统操作</th>
                                                                </tr>
                                                                        <#list pageData.getRecords() as third>
                                                                            <tr>
                                                                                <td class="td-width-150">${(third.interfaceName)!'--'}</td>
                                                                                <td class="td-width-200">${(third.interfaceCode)!'--'}</td>
                                                                                <td class="td-width-100">
                                                                                    <@dictTag method="dictValueByType" type="third_interface_request_mode" value="${(third.requestMode)!}"> ${(dictValueByType)!}</@dictTag>
                                                                                </td>
                                                                                <td class="td-width-100">
                                                                                    ${(third.interfaceVersion)!'--'}
                                                                                </td>
                                                                                <td class="td-width-100">
                                                                                    <@dictTag method="dictValueByType" type="third_interface_type" value="${(third.interfaceType)!}"> ${(dictValueByType)!}</@dictTag>
                                                                                </td>
                                                                                <td class="td-width-100">
                                                                                    <@dictTag method="dictValueByType" type="third_interface_origin" value="${(third.interfaceOrigin)!}"> ${(dictValueByType)!}</@dictTag>
                                                                                </td>
                                                                            <#--<td>${(third.interfaceHref)!'--'}</td>-->
                                                                                <td class="td-width-100">
                                                                                    <#if (third.interfaceIcon)??&&third.interfaceIcon!=''>
                                                                                        <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(third.interfaceIcon)!''}"
                                                                                             width="40px"
                                                                                             height="40px"/>
                                                                                    <#else >
                                                                                        <img src="../../../images/default.png"
                                                                                             width="40px"
                                                                                             height="40px"/>
                                                                                    </#if>
                                                                                </td>
                                                                                <td class="td-width-150"><#if third.interfaceStatus==0>
                                                                                    正在使用<#else><font
                                                                                        color="red">已停用</font></#if>
                                                                                </td>
                                                                                <td class="td-width-300">
                                                                                     <#if third.interfaceName?contains("企查查")||third.interfaceName?contains("聚合")>
                                                                                     <#else>
                                                                                    <a class="btn btn-primary btn-xs dialog"
                                                                                       data-url="/system/tThirdInterfaceConfig/testInterface?id=#{(third.id)!}"
                                                                                       data-title="[${(third.interfaceName)!}]接口测试"
                                                                                       data-width="800"
                                                                                       data-height="700"
                                                                                    >测试接口</a>
                                                                                     </#if>
                                                                                    <a class="btn btn-primary btn-xs "
                                                                                       href="/system/tThirdInterfaceConfig/interfaceLog/1?id=#{(third.id)!}&code=${(third.interfaceCode)!}">请求记录</a>
                                                                                </td>
                                                                                <td class="td-width-200">
                                                                                    <@shiro.hasPermission name="editTThirdInterfaceConfig">
                                                                                        <a class="btn btn-primary btn-xs dialog"
                                                                                           href="javascript:;"
                                                                                           data-url="/system/tThirdInterfaceConfig/edit/${(third.id)!}"
                                                                                           data-title="编辑接口"
                                                                                           data-width="850"
                                                                                           data-height="650">编辑</a>
                                                                                    </@shiro.hasPermission>
                                                                                    <@shiro.hasPermission name="editTThirdInterfaceConfig">
                                                                                        <#if third.interfaceStatus==0>
                                                                                            <a class="btn btn-primary btn-xs "
                                                                                               data-tiggle="ajax"
                                                                                               data-submit-url="/system/tThirdInterfaceConfig/updateStatus?interfaceStatus=1&id=${(third.id)!}">禁用</a>
                                                                                        <#else>
                                                                                            <a class="btn btn-primary btn-xs "
                                                                                               data-tiggle="ajax"
                                                                                               data-submit-url="/system/tThirdInterfaceConfig/updateStatus?interfaceStatus=0&id=${(third.id)!}">启用</a>
                                                                                        </#if>

                                                                                    </@shiro.hasPermission>

                                                                                    <@shiro.hasPermission name="deleteUser">
                                                                                        <a class="btn btn-danger btn-xs"
                                                                                           data-tiggle="ajax"
                                                                                           data-submit-url="/system/tThirdInterfaceConfig/delete?id=${(third.id)!}"
                                                                                           data-confirm="您确定要删除该条记录吗?">删除</a>
                                                                                    </@shiro.hasPermission>

                                                                                </td>
                                                                            </tr>
                                                                        </#list>
                                                            </table>
                                                        </div><!-- /.box-body -->
                                                        <div class="box-footer row"
                                                             style="width: 99%;margin-left: 1px;">
                                                            <div class="col-md-6">
                                                                        <#include "../../common/paginateBar.ftl" />
                                                                        <@paginate pageData=pageData actionUrl="/system/tThirdInterfaceConfig/list/" urlParas="?search=${search!}&daterange=${daterange!}&interfaceGroup=${(interfaceGroupId)}"  />
                                                            </div>
                                                            <div class="col-md-6 pull-left">
                                                                        <#include "../../common/paginate.ftl" />
                                                                        <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/system/tThirdInterfaceConfig/list/" urlParas="?search=${search!}&pageSize=${pageSize!}&interfaceGroup=${(interfaceGroupId)}"  />
                                                            </div>
                                                        </div>
                                                    </div><!-- /.box -->
                                                </div>
                                            </div><!--列表结束-->
                                        </div>
                                    </#list>
                                </@dictTag>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section><!-- /.content -->
    </div><!-- /.content-wrapper -->
</@body>
<@footer>
    <script type="application/javascript">
        //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
        layui.use('element', function () {
            var element = layui.element;
            element.on('tab(demo)', function (data) {
                console.log(data);
                var tabid = data.elem.context.id;
                var groupId = tabid.split("tab_");
                location.href = "/system/tThirdInterfaceConfig/list/1?interfaceGroup=" + groupId[1];
            });
        });

    </script>
</@footer>