<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
	<div class="row">
        <div class="col-md-12">
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab_1" data-toggle="tab">添加目录</a></li>
                    <li><a href="#tab_2" data-toggle="tab">添加菜单</a></li>
                    <li><a href="#tab_3" data-toggle="tab">添加功能</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="tab_1">
                        <div class="row">
                            <div class="col-md-6">
                                <form role="form" class="layui-form layui-form-pane" method="post"
                                      action="/system/menu/doAddDir">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="uname">分组 </label> <span class="xing_red"> *</span>
                                            <select name="serviceType" class="form-control select2 input-select-200"
                                                    lay-verify="required" lay-ignore>
                                                <option value="">--请选择--</option>
											<@dictTag method="getDictListByType" type="menu_service_type" >
                                                <#list getDictListByType as m>
													<option value="${(m.value)!}">${(m.label)!}</option>
                                                </#list>
                                            </@dictTag>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="uname">编码 </label>
                                            <input type="text" name="code" class="form-control" placeholder="系统自动生成"
                                                   readonly>
                                        </div>
                                        <div class="form-group">
                                            <label for="uname">目录名称 <span class="xing_red"> *</span> </label>
                                            <input type="text" name="menuName" class="form-control"
                                                   placeholder="请输入目录名称" lay-verify="required">
                                        </div>
                                        <div class="form-group">
                                            <label for="uname">是否显示</label>
									   <@dictTag method="getDictListByType" type="is_yes_no" >
                                           <#list getDictListByType as m>
															<input type="radio" name="isEnabled" class="minimal"
                                                                   value="${(m.value)!}" lay-ignore checked>
                                               ${(m.label)!}
														&nbsp;
                                           </#list>
                                       </@dictTag>
                                        </div>
                                        <div class="form-group">
                                            <label for="uname">排序 <span class="xing_red"> *</span> </label>
                                            <input type="text" name="sort" class="form-control" placeholder="请输入排序"
                                                   lay-verify="required|number">
                                        </div>
                                        <div class="form-group">
                                            <label for="uname">图标</label>
                                            <input type="text" name="icon" value="fa-folder" class="form-control"
                                                   placeholder="请输入图标,如:fa-user">
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-success" lay-submit
                                                    lay-filter="submit"><i class="fa fa-save"></i> 提 交
                                            </button>
                                            <a class="btn btn-default"
                                               href="javascript:parent.layer.closeAll('iframe');"><i
                                                    class="fa fa-close"></i> 取消</a>
                                        </div>
                                    </div><!-- /.box-body -->
                                </form>
                            </div>
                        </div>
                    </div><!-- /.tab-pane -->

                    <div class="tab-pane" id="tab_2">
                        <div class="row">
                            <div class="col-md-6">
                                <form role="form" class="layui-form layui-form-pane" method="post"
                                      action="/system/menu/doAddMenu">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>父级菜单</label>
                                            <select name="pid" class="form-control select2" style="width: 100%;"
                                                    lay-verify="required" lay-ignore>
											  <#list list as m>

                                                  <option value="${(m.id)!}">${(m.code)!}-${(m.menuName)!}</option>
                                              </#list>
                                            </select>
                                            <input id="menuServiceType" name="serviceType" type="hidden" value="1">
                                        </div><!-- /.form-group -->
                                        <div class="form-group">
                                            <label for="uname">编码 </label>
                                            <input type="text" name="code" class="form-control" placeholder="系统自动生成"
                                                   readonly>
                                        </div>
                                        <div class="form-group">
                                            <label for="uname">菜单名称</label>
                                            <input type="text" name="menuName" class="form-control"
                                                   placeholder="请输入菜单名称" lay-verify="required">
                                        </div>
                                        <div class="form-group">
                                            <label for="uname">菜单URL</label>
                                            <input type="text" name="url" class="form-control" placeholder="请输入菜单URL"
                                                   lay-verify="required">
                                        </div>
                                        <div class="form-group">
                                            <label for="uname">是否显示</label>
									   		<@dictTag method="getDictListByType" type="is_yes_no" >
                                                <#list getDictListByType as m>
													<input type="radio" name="isEnabled" class="minimal"
                                                           value="${(m.value)!}" lay-ignore checked>
                                                    ${(m.label)!}
													&nbsp;
                                                </#list>
                                            </@dictTag>
                                        </div>
                                        <div class="form-group">
                                            <label for="uname">排序</label>
                                            <input type="text" name="sort" class="form-control" placeholder="请输入排序"
                                                   lay-verify="required|number">
                                        </div>
                                        <div class="form-group">
                                            <label for="uname">图标</label>
                                            <input type="text" name="icon" value="fa-file" class="form-control"
                                                   placeholder="请输入图标,如:fa-user">
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-success" lay-submit
                                                    lay-filter="submit"><i class="fa fa-save"></i> 提 交
                                            </button>
                                            <a class="btn btn-default"
                                               href="javascript:parent.layer.closeAll('iframe');"><i
                                                    class="fa fa-close"></i> 取消</a>
                                        </div>
                                    </div><!-- /.box-body -->
                                </form>
                            </div>
                        </div>
                    </div><!-- /.tab-pane -->

                    <div class="tab-pane" id="tab_4">
                        <div class="row">
                            <div class="col-md-6">
                                <form role="form" class="layui-form layui-form-pane" method="post"
                                      action="/system/menu/doAddMenu">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>父级菜单</label>
                                            <select name="pid" class="form-control select2" style="width: 100%;"
                                                    lay-verify="required" lay-ignore>
											  <#list submenulist as m>

                                                  <option value="${(m.id)!}">${(m.code)!}-${(m.menuName)!}</option>
                                              </#list>
                                            </select>
                                            <input id="menuServiceType" name="serviceType" type="hidden" value="1">
                                        </div><!-- /.form-group -->
                                        <div class="form-group">
                                            <label for="uname">编码 </label>
                                            <input type="text" name="code" class="form-control" placeholder="系统自动生成"
                                                   readonly>
                                        </div>
                                        <div class="form-group">
                                            <label for="uname">菜单名称</label>
                                            <input type="text" name="menuName" class="form-control"
                                                   placeholder="请输入菜单名称" lay-verify="required">
                                        </div>
                                        <div class="form-group">
                                            <label for="uname">菜单URL</label>
                                            <input type="text" name="url" class="form-control" placeholder="请输入菜单URL"
                                                   lay-verify="required">
                                        </div>
                                        <div class="form-group">
                                            <label for="uname">是否显示</label>
									   		<@dictTag method="getDictListByType" type="is_yes_no" >
                                                <#list getDictListByType as m>
													<input type="radio" name="isEnabled" class="minimal"
                                                           value="${(m.value)!}" lay-ignore checked>
                                                    ${(m.label)!}
													&nbsp;
                                                </#list>
                                            </@dictTag>
                                        </div>
                                        <div class="form-group">
                                            <label for="uname">排序</label>
                                            <input type="text" name="sort" class="form-control" placeholder="请输入排序"
                                                   lay-verify="required|number">
                                        </div>
                                        <div class="form-group">
                                            <label for="uname">图标</label>
                                            <input type="text" name="icon" value="fa-file" class="form-control"
                                                   placeholder="请输入图标,如:fa-user">
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-success" lay-submit
                                                    lay-filter="submit"><i class="fa fa-save"></i> 提 交
                                            </button>
                                            <a class="btn btn-default"
                                               href="javascript:parent.layer.closeAll('iframe');"><i
                                                    class="fa fa-close"></i> 取消</a>
                                        </div>
                                    </div><!-- /.box-body -->
                                </form>
                            </div>
                        </div>
                    </div><!-- /.tab-pane -->

                    <div class="tab-pane" id="tab_3">
                        <div class="row">
                            <div class="col-md-6">
                                <form role="form" class="layui-form layui-form-pane" method="post"
                                      action="/system/menu/doAddAction">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label>选择目录/菜单</label>
                                            <select id="dir" class="form-control select2" style="width: 100%;"
                                                    lay-verify="required" lay-ignore>
                                                <option value="" selected="selected">--请选择--</option>
											 <#list list as m>
											 <option value="${(m.id)!}">${(m.code)!}-${(m.menuName)!}</option>
                                             </#list>
                                            </select>
                                            <select id="pid" name="pid" class="form-control select2"
                                                    style="width: 100%;" lay-verify="required" lay-ignore>
                                                <option value="" selected="selected">--请选择--</option>
                                            </select>


                                            <input id="actionServiceType" name="serviceType" type="hidden" value="1">
                                        </div>
                                        <div class="form-group">
                                            <label for="uname">编码 </label>
                                            <input type="text" name="code" class="form-control" placeholder="系统自动生成"
                                                   readonly>
                                        </div>
                                        <div class="form-group">
                                            <label for="uname">功能名称</label>
                                            <input type="text" name="menuName" class="form-control"
                                                   placeholder="请输入目录名称" lay-verify="required">
                                        </div>
                                        <div class="form-group">
                                            <label for="resource">权限资源</label>
                                            <input type="text" id="resource" name="resource" class="form-control"
                                                   placeholder="请输入权限资源名称" lay-verify="required|check"
                                                   check-url="/system/menu/checkMenuResource">
                                        </div>
                                        <div class="form-group">
                                            <label for="uname">是否显示</label>
									   		<@dictTag method="getDictListByType" type="is_yes_no" >
                                                <#list getDictListByType as m>
													<input type="radio" name="isEnabled" class="minimal"
                                                           value="${(m.value)!}" lay-ignore checked>
                                                    ${(m.label)!}
													&nbsp;
                                                </#list>
                                            </@dictTag>
                                        </div>
                                        <div class="form-group">
                                            <label for="uname">排序</label>
                                            <input type="text" name="sort" class="form-control" placeholder="请输入排序"
                                                   lay-verify="required|number">
                                        </div>
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-success" lay-submit
                                                    lay-filter="submit"><i class="fa fa-save"></i> 提 交
                                            </button>
                                            <a class="btn btn-default"
                                               href="javascript:parent.layer.closeAll('iframe');"><i
                                                    class="fa fa-close"></i> 取消</a>
                                        </div>
                                    </div><!-- /.box-body -->
                                </form>
                            </div>
                        </div>
                    </div><!-- /.tab-pane -->

                </div><!-- /.tab-pane -->
            </div><!-- /.tab-content -->
        </div><!-- nav-tabs-custom -->
    </div>
</@body>
<@footer>
<script>
    $("#dir").on('change', function () {
        var pid = $(this).val();
        $.post('/system/menu/json?_dc=' + new Date().getTime(), {pid: pid}, function (response) {
            if (response.code == 200) {
                $("#pid").empty();
                $("#pid").select2({
                    data: response.data
                });
            }
        });
    });

    $("#pid").on('change', function () {
        var pid = $(this).val();
        $.post('/system/menu/json?_dc=' + new Date().getTime(), {pid: pid}, function (response) {
            if (response.code == 200) {
                if (response.data.length != 0) {
                    $("#pids").empty();
                    $("#pids").select2({
                        data: response.data
                    });
                }

            }
        });
    });

</script>
</@footer>