<#include "../../common/layout.ftl">
<@header>
<link rel="stylesheet" href="/plugins/bootstrap-fileinput/css/fileinput.min.css">
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>系统管理 > 用户中心</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab_1" data-toggle="tab">个人信息</a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab_1">
                            <div class="row">
                                <div class="col-md-6">
                                    <form role="form"
                                          data-validator-option="{theme:'bootstrap', timely:2, stopOnError:true}"
                                          method="post" action="/system/me/updateUser">
                                        <div class="box-body">
                                            <input type="hidden" value="${(sysUser.id)!}" id="id" name="id">
                                            <div class="form-group">
                                                <label for="userName">用户名</label>
                                                <input type="text" name="username" value="${(sysUser.username)!}"
                                                       class="form-control" readonly="readonly">
                                            </div>
                                            <div class="form-group">
                                                <label>真实姓名</label>
                                                <input type="text" value="${(realname)!'--'}" class="form-control"
                                                       disabled="disabled">
                                            </div>
                                            <div class="form-group">
                                                <label>所在部门</label>
                                                <input type="text" value="${(sysOrg.name)!'--'}" class="form-control"
                                                       disabled="disabled">
                                            </div>
                                            <div class="form-group">
                                                <label>角色信息</label>
                                                <input type="text" value="${(sysRole)!}" class="form-control"
                                                       disabled="disabled">
                                            </div>
                                            <div class="form-group">
                                                <label>手机号码</label>
                                                <input type="text" value="${(mobile)!}" class="form-control"
                                                       disabled="disabled">
                                            </div>
                                            <div class="form-group">
                                                <label>昵称</label>
                                                <input type="text" value="${(sysUser.nickname)!}" name="nickname"
                                                       class="form-control">
                                            </div>
                                            <div class="box-footer">
                                                <button type="submit" class="btn btn-success"><i class="fa fa-save"></i>
                                                    提 交
                                                </button>
                                            </div>
                                    </form>
                                </div>
                            </div>
                        </div><!-- /.tab-pane -->
                    </div><!-- /.tab-pane -->
                </div><!-- /.tab-content -->
            </div>
        </div>
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</@body>
<@footer>
<script src="/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
<script src="/plugins/bootstrap-fileinput/js/locales/zh.js"></script>

</@footer>