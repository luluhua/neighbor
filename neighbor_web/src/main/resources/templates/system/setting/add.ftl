<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
    <form class="form-horizontal layui-form layui-form-pane" method="post" action="/system/setting/doAdd">
        <div class="box-body">
            <div class="form-group">
                <label for="sysSettingGroup" class="col-sm-2 control-label">系统设置分组<span
                        class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <select name="sysSettingGroup" class="form-control select2" lay-ignore style="width: 100%;"
                            lay-verify="required">
                        <@dictTag method="getDictListByType" type="setting_group" >
                            <#list getDictListByType as m>
                                <option <#if "${(m.value)!}"=="${(code)!}">selected</#if>
                                        value="${(m.value)!}"> ${(m.code)!}
                                    -${(m.label)!}</option>
                            </#list>
                        </@dictTag>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="sysKey" class="col-sm-2 control-label">系统设置key<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <input type="text" id="realname" name="sysKey" class="form-control" placeholder="请输入系统设置key"
                           lay-verify="required">
                    <p class="help-block"
                       class="ts-color">* 用户调用标识别</p>
                </div>
            </div>
            <div class="form-group">
                <label for="sysName" class="col-sm-2 control-label">系统设置名称<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <input type="text" id="sysName" name="sysName" class="form-control" placeholder="请输入系统设置名称"
                           lay-verify="required">
                </div>
            </div>
            <div class="form-group">
                <label for="sysValue" class="col-sm-2 control-label">系统设置值<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <input type="text" id="sysValue" name="sysValue" class="form-control" placeholder="请输入系统设置值"
                           lay-verify="required">
                </div>
            </div>
            <div class="form-group">
                <label for="sort" class="col-sm-2 control-label">排序<span class="xing_red"> *</span></label>
                <div class="col-sm-10">
                    <input type="text" id="sort" name="sort" class="form-control" placeholder="请输入排序"
                           lay-verify="required">
                </div>
            </div>
            <div class="form-group">
                <label for="sysDesc" class="col-sm-2 control-label">描述</label>
                <div class="col-sm-10">
                    <textarea class="form-control" name="sysDesc" rows="3" placeholder="请输入描述，最多300个字符 ...">
                    </textarea>
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
</@body>
<@footer>
</@footer>