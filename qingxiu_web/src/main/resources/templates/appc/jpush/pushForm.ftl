<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
 <form role="form" class="layui-form layui-form-pane pd10" method="post" action="/system/jpush/addPush">
     <div class="box-body">

         <div class="form-group">
             <label>推送（gid）</label>
             <input type="text" name="receiptGid" class="form-control" placeholder="">
         </div>
         <div class="form-group">
             <label>推送（uid）</label>
             <input type="text" name="receiptUid" class="form-control" placeholder="">
         </div>
         <div class="form-group">
             <label>模板coded<span class="xing_red"> *</span></label>
             <select id="templateCode" name="templateCode" class="form-control select2" style="width: 100%;" lay-ignore lay-verify="required">
                 <option value="" data-params=''>请选择...</option>
                    <#list tlist as item>
                        <option value="${(item.coded)!}" data-params='${(item.remarks)!}'>
                            ${(item.label)!} - v ${(item.versionNo)!}
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
         </div>

         <div class="form-group">
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
        $('#templateCode').on('change',function(){
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