<#include "../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" action="/push/action/save">
    <div class="box-body">
        <input type="hidden" name="id" value="${(entity.id)!}" />
        <input type="hidden" name="deep" value="${(entity.deep)!}" />
        <div class="form-group">
            <label for="pid"  class="col-sm-2 control-label">父级<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <select  name="pid" class="form-control select2" style="width: 100%;" lay-ignore>
                    <option value="0">无父级</option>
                    <#list treeList as item>
                        <option value="${(item.id)!}" <#if (item.id==entity.pid)>selected</#if>>
                            ${(item.navigates)!}
                        </option>
                    </#list>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="title"  class="col-sm-2 control-label">导航<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="title" name="title" value="${(entity.title)!}" class="form-control" placeholder="请输入标题" maxlength="25" lay-verify="required">
            </div>
        </div>
        <div class="form-group">
            <label for="value"  class="col-sm-2 control-label">编码<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="value" name="value" value="${(entity.value)!}" class="form-control" placeholder="请输入编码" maxlength="25" lay-verify="required">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">分类</label>
            <div class="col-sm-10">
                <select  name="type" class="form-control select2" style="width: 100%;" lay-ignore>
                    <option value="navigation"  <#if (entity.type=="navigation")>selected</#if> >导航</option>
                    <option value="channel"  <#if (entity.type=="channel")>selected</#if> >频道</option>
                    <option value="colum"  <#if (entity.type=="colum")>selected</#if> >栏目</option>
                    <option value="othor"  <#if (entity.type=="othor")>selected</#if> >其他</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">参数</label>
            <div class="col-sm-10">
            <input type="hidden" id="keys" name="keys" value="" />
            <input type="hidden" id="values" name="values" value="" />
            <a id="add-key-val-btn" class="btn btn-primary" href="javascript:;"><i class="fa fa-plus"></i> 新增参数</a>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label"></label>
            <div class="col-sm-10">
                <div id="key-val-box">
                    <#if (params)??>
                        <#list params as item>
                    <div class="key-val-item" style="margin-bottom: 10px;">
                        <input type="text" name="ikey" value="${item.key}" class="form-control a-key" placeholder="说明" maxlength="15">
                        <input type="text" name="ivalue" value="${item.value}" class="form-control a-value" placeholder="值" maxlength="200">
                    </div>
                        </#list>
                    </#if>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label"></label>
            <div class="col-sm-10">
                <button type="submit" class="btn btn-success" lay-submit lay-filter="submit" onclick="check()"><i class="fa fa-save"></i>  提 交</button>
                <a  class="btn btn-default" href="javascript:parent.layer.closeAll('iframe');"><i class="fa fa-close"></i>  取消</a>
            </div>
        </div>
    </div>
</form>
</@body>
<@footer>
<script>
    $(function(){

        $('#add-key-val-btn').on('click',function(){
            var len = $('.key-val-item').length
            $('#key-val-box').append('<div class="key-val-item" style="margin-bottom: 10px;">' +
                    '<input type="text" name="ikey" value="" class="form-control a-key" placeholder="说明" maxlength="15">' +
                    '<input type="text" name="ivalue" value="" class="form-control a-value" placeholder="值" maxlength="200">' +
                    '</div>');
        });
    });
    function check(){
        var $keys = $('.a-key');
        var keys = '';
        console.log('len:' + $keys.length);
        for(i = 0; i< $keys.length ; i++){
            keys = keys + $keys[i].value + ',';
        }
        console.log('keys:' + keys);
        $('#keys').val(keys);

        var $values = $('.a-value');
        var values = '';
        for(i = 0; i< $values.length ; i++){
            values = values + $values[i].value + ',';
        }
        console.log(values);
        $('#values').val(values);

        return true;
    }
</script>
</@footer>