<#include "../../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
    <form role="form"  id="formId" class="form-horizontal " >
        <input type="hidden" name="id" value="${(tGovProjcetJisong.id)!}" />
        <input type="hidden" name="projectRecordId" value="${(tGovProjcetJisong.projectRecordId)!}" />
        <div class="form-group">
            <label  class="col-sm-2 control-label">快递公司<span class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" id="" name="courierServicesCompany"
                       value="" class="form-control"
                       placeholder="请输入快递公司"/>
            </div>
        </div>
        <div class="form-group">
            <label for="explain" class="col-sm-2 control-label">快递单号</label>
            <div class="col-sm-10">
                <input type="text" id="" name="courierNumber"
                       value="" class="form-control"
                       placeholder="请输入快递单号"/>
            </div>
        </div>
        <div class="form-group">
            <label for="explain" class="col-sm-2 control-label">收货人</label>
            <div class="col-sm-10">
                <input type="text" id="" name="consignee"
                       value="${(tGovProjcetJisong.consignee)!''}" class="form-control" readonly
                       placeholder="请输入收货人"/>
            </div>
        </div>
        <div class="form-group">
            <label for="explain" class="col-sm-2 control-label">收货人电话</label>
            <div class="col-sm-10">
                <input type="text" id="" name="consigneePhone"
                       value="${(tGovProjcetJisong.consigneePhone)!''}" class="form-control"readonly
                       placeholder="请输入收货人电话"/>
            </div>
        </div>
        <div class="form-group">
            <label for="explain" class="col-sm-2 control-label">收货人地址</label>
            <div class="col-sm-10">
                <input type="text" id="" name="consigneeAddress"
                       value="${(tGovProjcetJisong.consigneeAddress)!''}" class="form-control" readonly
                       placeholder="收货人地址"/>
            </div>
        </div>

        <div class="form-group">
            <label for="explain" class="col-sm-2 control-label">备注</label>
            <div class="col-sm-10">
                         <textarea  name="remark" cols="100" rows="100"
                                    style="height:100px;"></textarea>
            </div>
        </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">&nbsp;</label>
                <div class="col-sm-10">
                    <button type="button" class="btn btn-success"onclick="onsub();"><i class="fa fa-save"></i>  提 交</button>
                </div>
            </div>
        </div>
    </form>
</@body>
<@footer>
<script type="application/javascript">

    function onsub(){
        var data = $("#formId").serializeArray();
        $.post("/appc/tGovProjectService/doDelivery",data,function(json){
            if(json.code==200){
                window.parent.location.reload();//刷新父页面
                x_admin_close();
            }else{
                $.alert({
                    title: '提示',
                    content: json.msg,
                    buttons:{"好的":{ btnClass: 'btn-blue'}}
                });
            }
        });

        // $("#formId").submit();
        // return true;
    }
</script>
</@footer>