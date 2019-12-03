<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" action="/jczl/tJczlCase/doEdit">
    <div class="box-body">
        <div class="form-group">

            <div class="col-sm-10" style="margin: auto; float: none">
                <table class="layui-table">
                    <colgroup>
                        <col width="15%">
                        <col width="35%">
                        <col width="15%">
                        <col width="35%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">标题</td>
                        <td>${(entity.cTitle)!}</td>
                        <td style="text-align: right; background: #ebf5ff">部门</td>
                        <td>${(org.name)!'--'}</td>
                    </tr>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">案件类型</td>
                        <td>${(casetype.cName)!}</td>
                        <td style="text-align: right; background: #ebf5ff">案件状态</td>
                        <td><#if entity.cStatus==0>待审核<#elseif entity.cStatus==1>未领取<#elseif entity.cStatus==2>
                 未完成<#elseif entity.cStatus==3>超期办理
                        <#elseif entity.cStatus==4>超期办结<#elseif entity.cStatus==5>待检查<#elseif entity.cStatus==6>作废案件
                        <#elseif entity.cStatus==7>待审核 <#elseif entity.cStatus==8>待已办结<#elseif entity.cStatus==9>街道协调
                        <#elseif entity.cStatus==10>城区协调<#elseif entity.cStatus==11>市级协调<#elseif entity.cStatus==12>
                            非正常办结
                        </#if></td>
                    </tr>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">所属网格</td>
                        <td>${(grid.gName)!}</td>
                        <td style="text-align: right; background: #ebf5ff">地址</td>
                        <td>${(entity.cAddress)!'--'}</td>
                    </tr>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">案件来源</td>
                        <td>
                            <#if entity.cOrigin==1>基层治理APP<#elseif entity.cOrigin==2>手上青秀-我要爆料</#if>
                        </td>
                        <td style="text-align: right; background: #ebf5ff">紧急类型</td>
                        <td><#if (entity.cLevel)??>
                            <#if entity.cLevel=1>非常紧急<#elseif entity.cLevel=2>紧急<#elseif entity.cLevel=3>普通</#if>
                        <#else >
                                --
                        </#if>

                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">责任人</td>
                        <td>${(entity.cDutyPerson)!}</td>
                        <td style="text-align: right; background: #ebf5ff">截止时间</td>
                        <td>${(entity.cDeadline?string('yyyy-MM-dd'))!'--'}</td>
                    </tr>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">处置人</td>
                        <td>${(entity.cDisposer)!}</td>
                        <td style="text-align: right; background: #ebf5ff">案件编号</td>
                        <td>${(entity.cCode)!}</td>
                    </tr>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">上报人</td>
                        <td>${(appuser.username)!}</td>
                        <td style="text-align: right; background: #ebf5ff">上报时间</td>
                        <td>${(entity.dtReport?string('yyyy-MM-dd'))!'--'}</td>
                    </tr>
                    <tr>
                        <td style="text-align: right; background: #ebf5ff">说明</td>
                        <td>${(entity.cExplain)!}</td>
                        <#if (imglist?size>0)>

                    </tr>
                    <tr>
                            <td style="text-align: right; background: #ebf5ff">上报材料</td>
                            <td><#list imglist as imglist>
                                <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(imglist.name)!'--'}"
                                     onerror="this.src='../../../images/default.png'" style="width: 100px">
                            </#list></td>
                        </#if>
                    </tr>

                    </tbody>
                </table>
            </div>
        <#--<div class="form-group">-->
        <#--<label class="col-sm-2 control-label">&nbsp;</label>-->
        <#--<div class="col-sm-10">-->
        <#--<a class="btn btn-primary btn-xs" href="/jczl/tJczlCase/pass/${(entity.id)!}?status=1"> 通过</a>-->
        <#--<a class="btn btn-danger btn-xs" href="/jczl/tJczlCase/pass/${(entity.id)!}?status=2"> 作废</a>-->
        <#--</div>-->
        <#--</div>-->

        </div><!-- /.box-body -->
</form>
</@body>
<@footer>
</@footer>