<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
    <div class="box-body">
        <div class="form-group">
            <label for="partymember_partyBranchOrg" class="col-sm-3 control-label" style="text-align: center;">所在党支部</label>
            <div class="col-sm-9">
                <select id="partymember_partyBranchOrg" name="partyBranchOrg" class="form-control select2 input-select-200" style="width: 400px" lay-ignore>
                <#list orgList as org>
                    <option value="${(org.id)!}">${(org.name)!}</option>
                </#list>
                </select>
            </div>
        </div>
        <div class="form-group" style="margin-top:50px ">
            <label class="col-sm-3 control-label">&nbsp;</label>
            <div class="col-sm-9">
                <button onclick="exportPartyMemberExcel()" class="btn btn-success"><i class="fa fa-save"></i>
                    导出excel
                </button>
            </div>
        </div>
    </div>
</@body>
<@footer>
<script src="/plugins/download/download.js"></script>
<script>
    //导出excel
    function exportPartyMemberExcel(){
        var exportPartymemberFileUrl="/dj/partymember/exportPartyMemberExcel";
        var partyBranchOrg=$("#partymember_partyBranchOrg option:selected").val();
        var partyMemberFileData={orgId:partyBranchOrg};
        $.ajax(exportPartymemberFileUrl, {
            dataType: 'json',
            type: 'get',
            data:partyMemberFileData,
            async: false,
            headers: {'Content-Type': 'application/json'},
            success: function (jsondata) {
                if(jsondata!=null&&jsondata.code==500){
                    $.alert({
                        title: '提示',
                        content: jsondata.msg,
                        buttons: {"好的": {btnClass: 'btn-blue'}}
                    });
                }else{
                    console.log("---->开始导出---");
                    downloadPartyMemberFile("/download/downloadApp", jsondata.msg);
                }
            }
        });
    }

    function downloadPartyMemberFile(url, name) {
        setTimeout(function () {
            var _a = document.createElement("a");
            var evt = document.createEvent('HTMLEvents');
            evt.initEvent('click', false, false);
            _a.href = url + "?paths=" + name;
            _a.download = name;
            _a.target = "_blank";
            _a.dispatchEvent(evt);
            console.log(_a.href);
            document.body.appendChild(_a);
            _a.click();
            setTimeout(function () {
                document.body.removeChild(_a);
            }, 1000);
        }, 100);
    }
</script>
</@footer>