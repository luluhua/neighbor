<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
    <form class="form-horizontal layui-form layui-form-pane" method="post" action="/system/sysCity/doEdit">
        <input type="hidden" name="id" value="#{(entity.id)!}">
        <div class="box-body">
            <div class="form-group" style="display: <#if entity.pid=0>none</#if> ">
                <label for="pid" class="col-sm-2 control-label">父级:</label>
                <div class="col-sm-10">
                    <select name="pid" class="form-control select2 input-select-200"
                            lay-verify="required" lay-ignore>
                        <option value="0">-- 请选择--</option>
                        <#list list as list>
                            <option value="#{(list.id)!}" ${(list.id==entity.pid)?string('selected="selected"','')}>${(list.name)!}</option>
                        </#list>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="name" class="col-sm-2 control-label">名称</label>
                <div class="col-sm-10">
                    <input type="text" id="name" name="name" value="${(entity.name)!}" class="form-control input-select-200"
                           placeholder="请输入name" lay-verify="required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="abbreviation" class="col-sm-2 control-label">简称</label>
                <div class="col-sm-10">
                    <input type="text" id="abbreviation" name="abbreviation" class="form-control input-select-200"
                           placeholder="请输入简称" value="${(entity.abbreviation)!}">
                </div>
            </div>
            <div class="form-group">
                <label for="code" class="col-sm-2 control-label">编码</label>
                <div class="col-sm-10">
                    <input type="text" id="code" name="code" value="${(entity.code)!}" class="form-control input-select-200"
                           placeholder="请输入code" lay-verify="required"/>
                </div>
            </div>
            <div class="form-group">
                <label for="status" class="col-sm-2 control-label">是否启用</label>
                <div class="col-sm-10">
                    <label>
                        <input name="enabled" type="radio" class="minimal" ${(entity.enabled==1)?string('checked','')}
                               checked value="1" lay-ignore> 启用
                    </label>
                    <label>
                        <input name="enabled" type="radio" class="minimal" ${(entity.enabled==0)?string('checked','')}
                               value="0" lay-ignore> 禁用
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label for="sortIndex" class="col-sm-2 control-label">排序</label>
                <div class="col-sm-10">
                    <input type="number" id="sortIndex" name="sortIndex" value="${(entity.sortIndex)!}"
                           class="form-control input-number-100"
                           placeholder="请输入排序" lay-verify="required"/>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">&nbsp;</label>
                <div class="col-sm-10">
                    <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i>
                        提 交
                    </button>
                </div>
            </div>
        </div><!-- /.box-body -->
    </form>
</@body>
<@footer>
</@footer>