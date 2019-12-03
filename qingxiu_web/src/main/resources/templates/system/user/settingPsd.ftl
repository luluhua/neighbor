<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>

    <div class="layui-tab">
        <ul class="layui-tab-title">
            <li class="layui-this">登录密码设置</li>
            <li>一级密码设置</li>
            <li>二级密码设置</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <form class="form-horizontal layui-form layui-form-pane" method="post"
                      action="/system/user/doUpdatePas">
                    <div class="box-body">
                        <input type="hidden" name="id" value="${(sysUser.id)!}">
                        <input type="hidden" name="passType" value="1">
                        <div class="form-group">
                            <label for="oldpss" class="col-sm-2 control-label">旧登录密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="oldpss" name="oldpss"
                                       placeholder="请输入旧登录密码"
                                       lay-verify="required|pass|oldpss|check"
                                       check-url="/system/user/checkOldPsd?passType=1&id=${(sysUser.id)!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">新登录密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="password" name="password"
                                       placeholder="请输入新登录密码"
                                       lay-verify="required|pass">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password2" class="col-sm-2 control-label">确认新密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="password2"  name="password2"
                                       placeholder="请再次输入新密码"
                                       lay-verify="required|pass|eqPwd">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">&nbsp;</label>
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i
                                            class="fa fa-save"></i> 提 交
                                </button>
                            </div>
                        </div>
                    </div><!-- /.box-body -->
                </form>

            </div>
            <div class="layui-tab-item">
                <form class="form-horizontal layui-form layui-form-pane" method="post"
                      action="/system/user/doUpdatePas">
                    <div class="box-body">
                        <input type="hidden" name="id" value="${(sysUser.id)!}">
                        <input type="hidden" name="passType" value="2">
                        <div class="form-group">
                            <label for="oldpss" class="col-sm-2 control-label">旧一级密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="oldpss" name="oldpss"
                                       placeholder="请输入一级密码(初始密码与登录密码相同)"
                                       lay-verify="required|pass|oldpss|check"
                                       check-url="/system/user/checkOldPsd?passType=2&id=${(sysUser.id)!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="onepassword" class="col-sm-2 control-label">新一级密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="onepassword" name="password"
                                       placeholder="请输入新一级密码"
                                       lay-verify="required|pass">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password2" class="col-sm-2 control-label">确认新一级密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="onepassword2"  name="password2"
                                       placeholder="请再次输入新一级密码"
                                       lay-verify="required|pass|eqOnepassword">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">&nbsp;</label>
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i
                                            class="fa fa-save"></i> 提 交
                                </button>
                            </div>
                        </div>
                    </div><!-- /.box-body -->
                </form>

            </div>
            <div class="layui-tab-item">
                <form class="form-horizontal layui-form layui-form-pane" method="post"
                      action="/system/user/doUpdatePas">
                    <div class="box-body">
                        <input type="hidden" name="id" value="${(sysUser.id)!}">
                        <input type="hidden" name="passType" value="3">
                        <div class="form-group">
                            <label for="oldpss" class="col-sm-2 control-label">旧二级密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control"  name="oldpss"
                                       placeholder="请输入二级密码(初始密码与登录密码相同)"
                                       lay-verify="required|pass|oldpss|check"
                                       check-url="/system/user/checkOldPsd?passType=3&id=${(sysUser.id)!}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label">新二级密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control"  id="twopassword" name="password"
                                       placeholder="请输入二级密码"
                                       lay-verify="required|pass">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="twopassword2" class="col-sm-2 control-label">确认新二级密码</label>
                            <div class="col-sm-10">
                                <input type="password" class="form-control" id="twopassword2" name="password2"
                                       placeholder="请再次输入新二级密码"
                                       lay-verify="required|pass|eqTwopassword">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">&nbsp;</label>
                            <div class="col-sm-10">
                                <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i
                                            class="fa fa-save"></i> 提 交
                                </button>
                            </div>
                        </div>
                    </div><!-- /.box-body -->
                </form>

            </div>
        </div>
    </div>


</@body>
<@footer>
    <script type="application/javascript">
        //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
        layui.use('element', function(){
            var element = layui.element;

        });
    </script>
</@footer>