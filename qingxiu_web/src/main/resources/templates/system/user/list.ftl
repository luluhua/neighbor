<#include "../../common/layout.ftl">
<@header>
</@header>
<@body>
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                <small>系统管理 > 用户管理</small>
            </h1>
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <form action="/system/user/list/1" method="post" class="form-inline">
                            <div class="box-header">
                                <div class="input-group">
                                    <@shiro.hasPermission name="addUser">
                                        <a class="btn btn-primary dialog" href="javascript:;"
                                           data-url="/system/user/add" data-title="添加用户" data-width="850"
                                           data-height="650"><i class="fa fa-plus"></i> 添加</a>
                                    </@shiro.hasPermission>
                                </div>
                                <div class="input-group">
                                    <input type="text" name="search" value="${search!}" class="form-control"
                                           placeholder="用户名、手机号码查询">
                                    <div class="input-group-btn">
                                        <button class="btn btn-default" type="submit"><i class="fa fa-search"></i>
                                        </button>
                                    <#--                                        <a href="/system/user/list/1" class="btn btn-default"><i-->
                                    <#--                                                    class="fa fa-refresh"></i></a>-->
                                    </div>
                                </div>
                                <div class="input-group pull-right">
                                    <button type="button" class="btn btn-primary btn-flat" onclick="exportTo('用户数据');">
                                        <i class="fa fa-file-excel-o"></i> 导出
                                    </button>
                                </div>
                            </div><!-- /.box-header -->
                        </form>
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <tr>
                                <#--                                    <th>头像</th>-->
                                    <th>用户名</th>
                                    <th>真实姓名</th>
                                    <th>邮箱</th>
                                    <th>手机号码</th>
                                    <th>部门</th>
                                    <th>状态</th>
                                    <th width="220px">操作</th>
                                </tr>
                                <#list pageData.getRecords() as user>
                                    <tr>

                                        <td>${(user.username)!'--'}</td>
                                        <td>${(user.realname)!'--'}</td>
                                        <td>${(user.email)!'--'}</td>
                                        <td><@commonTags method="getDecrypt3DEs" type="1" value="${(user.mobile)!}">${(getDecrypt3DEs)!}</@></td>
                                    <#--<td>${(user.dtCreate?string('yyyy/MM/dd HH:mm:ss'))!'--'}</td>-->
                                        <td>${(user.name)!'--'}</td>

                                        <td><#if user.status==0>启用<#else><font color="red">禁用</font></#if></td>
                                        <td style="line-height: 30px;">
                                            <@shiro.hasPermission name="editUser">
                                                <a class="btn btn-primary btn-xs dialog" href="javascript:;"
                                                   data-url="/system/user/edit/${(user.id)!}" data-title="编辑用户"
                                                   data-width="850" data-height="650">编辑</a>
                                            </@shiro.hasPermission>
                                        <#--<@shiro.hasPermission name="editUser">-->
                                        <#--<a class="btn btn-primary btn-xs dialog" href="javascript:;"-->
                                        <#--data-url="/system/user/toSettingPsd/${(user.id)!}" data-title="设置密码"-->
                                        <#--data-width="850" data-height="350">设置密码</a>-->
                                        <#--</@shiro.hasPermission>-->
                                             <@shiro.hasPermission name="editUser">
                                             <#-- <a class="btn btn-primary btn-xs "
                                                 data-tiggle="ajax"
                                                 data-submit-url="/system/user/reSettingPsd/${(user.id)!}"
                                                 data-confirm="您确定要为该条记录重置密码吗?">重置密码</a>-->
                                             <#-- 关闭重置密码 update zyj 20190619
                                             <a class="btn btn-primary btn-xs repwd" data-id="${(user.id)!}">重置密码</a>
                                             -->
                                             </@shiro.hasPermission>
                                            <@shiro.hasPermission name="editUser">
                                                <#if user.status==0>
                                                    <a class="btn btn-primary btn-xs "
                                                       data-tiggle="ajax"
                                                       data-submit-url="/system/user/updateStatus?status=1&id=${(user.id)!}">禁用</a>
                                                <#else>
                                                    <a class="btn btn-primary btn-xs "
                                                       data-tiggle="ajax"
                                                       data-submit-url="/system/user/updateStatus?status=0&id=${(user.id)!}">启用</a>
                                                </#if>

                                            </@shiro.hasPermission>
                                            <@shiro.hasPermission name="deleteUser">
                                                <a class="btn btn-danger btn-xs"
                                                   data-tiggle="ajax"
                                                   data-submit-url="/system/user/delete?id=${(user.id)!}"
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
                                <@paginate pageData=pageData actionUrl="/system/user/list/" urlParas="?search=${search!}&daterange=${daterange!}"  />
                            </div>
                            <div class="col-md-6 pull-left">
                                <#include "../../common/paginate.ftl" />
                                <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/system/user/list/" urlParas="?search=${search!}&pageSize=${pageSize!}"  />
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
    // 自定义弹出窗，提交后需提示是否成功 add zyj 20190618
    $('.repwd').on('click', function () {
        var uid = $(this).data('id');
        console.log(uid);
        layer.confirm('您确定要重置该管理员的密码吗?', {
            btn: ['确定', '取消'], //按钮
            title: "警告"
        }, function () {
            var url = '/system/user/reSettingPsd/' + uid;
            $.ajax({
                type: "post",
                url: url,
                data: null,
                dataType: "json",
                async: false,
                success: function (d) {
                    console.log(d);
                    if (d.code == 200) {
                        layer.alert('<span>重置' + d.data.name + '的登录密码成功</span><br/>' +
                                '<span>已将新密码“' + d.data.pwd + '”通过短信发送给了' + d.data.mobile + '</span>',
                                {//第一个参数是提示文本
                                    skin: 'layui-layer-lan'//蓝色外框皮肤
                                    , closeBtn: '好的'//没有关闭按钮
                                    , shift: 5 //动画类型，为5的动画效果不突兀，动画效果类型还可以是1,2,3,4,....
                                });
                    } else {
                        layer.msg('重置登录密码失败', {icon: 2});

                    }
                }
            });
        });
    })

</script>
</@footer>