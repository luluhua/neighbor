<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
 <form role="form" class="layui-form layui-form-pane pd10" method="post" action="/system/jpush/doAddJPush">
     <div class="box-body">
         <input type="hidden" name="priority" value="${(entity.priority)!}" />
         <input type="hidden" name="retryCount" value="${(entity.retryCount)!}" />
         <div class="form-group">
             <label>指定设备</label>
             <div class="form-control" style="border: 0px;">
             <label><input class=" push-type" type="radio" name="pushType" value="0" checked lay-ignore> 自定义</label>
             <label><input class=" push-type" type="radio" name="pushType" value="2" lay-ignore> 仅在线</label>
             <label><input class=" push-type" type="radio" name="pushType" value="1" lay-ignore> 所有的</label>
             </div>
         </div>
         <div class="form-group" id="device-token">
             <label>IOS设备</label>
             <input type="text" name="deviceToken" class="form-control" placeholder="" >
         </div>
         <div class="form-group" id="client-id">
             <label>Android设备</label>
             <input type="text" name="clientId" class="form-control" placeholder="" >
         </div>
         <div class="form-group">
             <label>推送标题</label>
             <input type="text" name="msgTitle" class="form-control" maxlength="25" placeholder="" lay-verify="required" >
         </div>
         <div class="form-group">
             <label>推送内容</label>
             <input type="text" name="msgText" class="form-control" maxlength="50" placeholder="" lay-verify="required">
         </div>
         <div class="form-group">
             <label>导航</label>
             <select id="actionId" name="actionId" class="form-control select2" style="width: 100%;" lay-ignore lay-verify="required">
                 <option value="" data-params=''>
                     请选择...
                 </option>
                <#list treeList as item>
                    <option value="${(item.id)!}" data-params='${(item.paramsJson)!}'>
                        ${(item.navigates)!}
                    </option>
                </#list>
             </select>
         </div>
         <div class="form-group">
             <input type="hidden" id="keys" name="keys" value="" />
             <input type="hidden" id="values" name="values" value="" />
             <a id="add-key-val-btn" class="btn btn-primary" href="javascript:;"><i class="fa fa-plus"></i> 新增参数</a>
         </div>
         <div id="key-val-box">
         <#--<div class="form-group key-val-item">
             <input type="text" name="key" value="" class="form-control a-key" placeholder="key" maxlength="15">
             <input type="text" name="value" value="" class="form-control a-value" placeholder="value" maxlength="200">
         </div>-->
         </div>
         <#--
         <div class="form-group">
             <label>扩展参数</label>
             <input type="text" name="extrasJson" class="form-control" placeholder="" >
         </div>
           -->
         <div class="form-group" style="padding-top: 15px;">
             <button type="submit" class="btn btn-success" lay-submit lay-filter="submit" onclick="check()"><i class="fa fa-save"></i> 推送
             </button>
         </div>
     </div>
 </form>
</@body>
<@footer>
<script>
    $(function(){
        /**
         * 选择导航
         */
        $('#actionId').on('change',function(){
            var $this = $(this);
            var _p = $this.find("option:selected").data("params");
            loadParams(_p);
        });

        /**
         * 添加新参数
         */
        $('#add-key-val-btn').on('click',function(){
            addInput('','');
        });

        /**
         * 选择指定的设备
         */
        $('.push-type').on('click',function(){
            var $this = $(this);
            var val = $this.val();
            console.log(val);
            if(val == 0){
                $('#device-token').show();
                $('#client-id').show();
            }else{
                $('#device-token').hide();
                $('#client-id').hide();
            }

        });

    });
    function loadParams(_a){
        if(_a){
            console.log(typeof(_a));
            var ary;
            if(typeof(_a) == 'string'){
                ary = eval(_a);
            }else{
                ary = _a;
            }
            for(i =0;i<ary.length;i++){
                addInput(ary[i].value,'');
            }
        }else{
            clearInput();
        }
    }

    function addInput(_k, _v){
        $('#key-val-box').append('<div class="form-group">' +
                '<input type="text" name="key" value="'+_k+'" class="form-control a-key" placeholder="key" maxlength="15">' +
                '<input type="text" name="value" value="'+_v+'" class="form-control a-value" placeholder="value" maxlength="200">' +
                '</div>');
    }

    function clearInput(){
        $('#key-val-box').html('');
    }

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