<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>手上青秀 > 注册用户管理</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/appc/tAppUser/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                            <@shiro.hasPermission name="addTAppUser">
                                <div class="input-group">
                                    <a class="btn btn-primary dialog" href="javascript:;" data-title="创建注册用户"
                                       data-url="/appc/tAppUser/add"
                                       data-width="800" data-height="400"><i class="fa fa-plus"></i>创建注册用户</a>
                                </div>
                            </@shiro.hasPermission>
                            <div class="input-group">
                                <select name="userType" class="form-control">
                                    <option value="">--用户类型查询--</option>
                                        <@dictTag method="getDictListByType" type="user_type" >
                                            <#list getDictListByType as m>
                                                <option value="${(m.value)!}"
                                                        <#if "${(m.value)!}"=="${(userType)!}">selected</#if>
                                                >${(m.label)!}</option>
                                            </#list>

                                        </@dictTag>
                                </select>
                            </div>
                            <div class="input-group">
                                <select name="status" class="form-control">
                                    <option value="">--状态查询--</option>
                                        <@dictTag method="getDictListByType" type="app_user_status" >
                                            <#list getDictListByType as m>
                                                <option value="${(m.value)!}"
                                                        <#if "${(m.value)!}"=="${(status)!}">selected</#if>
                                                >${(m.label)!}</option>
                                            </#list>

                                        </@dictTag>
                                </select>
                            </div>
                            <div class="input-group">
                                <select name="authStatus" class="form-control">
                                    <option value="">--认证状态查询--</option>
                                        <@dictTag method="getDictListByType" type="auth_status" >
                                            <#list getDictListByType as m>
                                                <option value="${(m.value)!}"
                                                        <#if "${(m.value)!}"=="${(authStatus)!}">selected</#if>
                                                >${(m.label)!}</option>
                                            </#list>

                                        </@dictTag>
                                </select>
                            </div>
                            <div class="input-group">
                                <input type="text" name="search" value="${search!}" class="form-control"
                                       placeholder="手机号码">
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>头像</th>
                                <th>昵称</th>
                                <th>手机号码</th>
                                <th>用户类型</th>
                                <th>认证类型</th>
                                <th>账户类型</th>
                                <th>最后登录时间</th>
                                <th>注册时间</th>
                                <th width="80px">操作</th>
                            </tr>
     <#list pageData.getRecords() as entity>
        <tr>
            <td>
                <img onclick="previewImg(this)"
                     src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(entity.avatar)!'--'}"
                     onerror="this.src='../../../images/default.png'"
                     style="width: 50px;height:50px;border-radius:25px">
            </td>
            <td>${(entity.nickname)!'--'}</td>
            <td>
             <@commonTags method="getDecrypt3DEs" type="1" value="${(entity.mobile)!}">${(getDecrypt3DEs)!}</@commonTags>
            </td>
            <td>
               <@dictTag method="dictValueByType" type="user_type" value="${(entity.userType)!}"> ${(dictValueByType)!}</@dictTag>
            </td>
            <td> <@dictTag method="dictValueByType" type="auth_status" value="${(entity.authStatus)!}"> ${(dictValueByType)!}</@dictTag></td>
            <td>
                <select id="accountType_${(entity.id)!}" class="form-control input-select-100" last="${(entity.accountType)!}"
                        onchange="changeAccountType(${(entity.id)!})">
                       <@dictTag method="getDictListByType" type="app_account_type" >
                           <#list getDictListByType as m>
                               <option value="${(m.value)!}"
                                   <#if "${(m.value)!}"=="${(entity.accountType)!}">
                                       selected
                                   </#if>
                               >${(m.label)!}</option>
                           </#list>
                       </@dictTag>
                </select>
            </td>
            <td>${(entity.lastLoginDate?string('yyyy-MM-dd'))!'--'}</td>
            <td>${(entity.dtCreate?string('yyyy-MM-dd'))!'--'}</td>
            <td>
                <@shiro.hasPermission name="detailTAppUser">
                    <#if entity.userType=1>
                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                   data-url="/appc/tAppUser/detail/${(entity.id)!}"
                   data-title="用户信息详情" data-width="1050" data-height="550">详情</a>
                    <#else >
                  <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                     data-url="/appc/tCompanyInfo/detail/${(entity.id)!}"
                     data-title="用户信息详情" data-width="1050" data-height="650">详情</a>
                    </#if>
                </@shiro.hasPermission>
                <@shiro.hasPermission name="deleteTAppUser">
                <a class="btn btn-danger btn-xs"
                   data-tiggle="ajax"
                   data-submit-url="/appc/tAppUser/delete?id=${(entity.id)!}"
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
	  		  <@paginate pageData=pageData actionUrl="/appc/tAppUser/list/" urlParas="?search=${search!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/appc/tAppUser/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
                        </div>
                    </div>
                </div><!-- /.box -->
            </div>
        </div>
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</@body>
<@footer>
<script type="text/javascript">
    var dataUrl = "/appc/tAppUser/changeAccountType"
    function changeAccountType(id) {
        var last = $('#accountType_' + id).attr("last");
        var sele_ = $('#accountType_' + id).val();
        var msg = "";
        if (sele_ == 0) {
            msg = "普通用户"
        } else if (sele_ == 1) {
            msg = "内部用户";
        }
        $.confirm({
            type: 'red',
            closeIcon: true,
            title: '警告',
            content: '确认修改账户类型为[' + msg + ']?',
            buttons: {
                '确认': {
                    btnClass: 'btn-blue',
                    action: function () {
                        $.get(dataUrl, {id: id, accountType: sele_}, function (json) {
                            $.alert({
                                title: '提示',
                                content: json.msg,
                                buttons: {"好的": {btnClass: 'btn-blue'}}
                            });

                        });
                    }
                },
                '取消': {
                    action: function () {
                        $('#accountType_' + id).val(last);
                    }
                }
            }
        });
    }
</script>
</@footer>