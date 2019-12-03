<#include "../../common/layout.ftl">
<@header>
<link rel="stylesheet" href="/plugins/bootstrap-fileinput/css/fileinput.css">
</@header>
<@body>
 <div class="content-wrapper">
    <section class="content-header">
        <h1>
            <small><a href="/dj/tDjMeeting/list/1">
                党员活动（会议） </a> >
                详情
            </small>
        </h1>
        <button type="submit"  style="z-index:9999; width: 100px;right: 10px;float: right;margin-top: -20px;margin-bottom: 10px;" class="btn btn-primary" onclick="goBack()">返回</button>
    </section>
    <section class="content">
        <div class="form-horizontal layui-form layui-form-pane">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="mtType" class="col-sm-2 control-label">会议分类</label>
                                <div class="col-sm-10">
                                    <p class="form-control"><@dictTag method="dictValueByType" type="mt_classify" value="${(entity.mtClassify)!}"> ${(dictValueByType)!}</@dictTag></p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="djOrgName" class="col-sm-2 control-label">党组织</label>
                                <div class="col-sm-10">
                                    <p class="form-control input-title-500">${(entity.djOrgName)!"--"}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="title" class="col-sm-2 control-label">会议标题</label>
                                <div class="col-sm-10">
                                    <p class="form-control">${(entity.title)!"--"}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mtTheme" class="col-sm-2 control-label">会议主题</label>
                                <div class="col-sm-10">
                                    <p class="form-control " >${(entity.mtTheme)!"--"}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="dtMeeting" class="col-sm-2 control-label">会议时间</label>
                                <div class="col-sm-10">
                                    <p class="form-control input-select-200">${(entity.dtMeeting?string('yyyy-MM-dd HH:mm:ss'))!}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="address" class="col-sm-2 control-label">会议地点</label>
                                <div class="col-sm-10">
                                    <p class="form-control">${(entity.address)!}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mtType" class="col-sm-2 control-label">会议类型</label>
                                <div class="col-sm-10">
                                    <p class="form-control input-select-200 "><@dictTag method="dictValueByType" type="${(entity.mtClassify)!}" value="${(entity.mtType)!}"> ${(dictValueByType)!}</@dictTag></p>
                                </div>
                            </div>
                                <div class="form-group">
                                    <label for="mtType" class="col-sm-2 control-label">参会人员</label>
                                    <div class="col-sm-10">
                                        <textarea rows="4" class="form-control" disabled style="background-color: white">${(entity.participants)!}</textarea>
                                    </div>
                                </div>
                            <div class="form-group">
                                <label for="numberOfAbsences" class="col-sm-2 control-label">缺席人数</label>
                                <div class="col-sm-10">
                                    <p class="form-control input-number-100">${(entity.numberOfAbsences)!}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="attendance" class="col-sm-2 control-label">出席人数</label>
                                <div class="col-sm-10">
                                    <p class="form-control input-number-100">${(entity.attendance)!}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mtContent" class="col-sm-2 control-label">会议内容</label>
                                <div class="col-sm-10">
                                        <p class="form-control" style="height: auto">${(entity.mtContent)!}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mtFile" class="col-sm-2 control-label">会议图片</label>
                                <div class="col-sm-10">
                                    <ul class="uiisar mtFile_url">
                                            <#if entity.mtFile?? && entity.mtFile!="" >
                                                <#list entity.mtFile?split(",") as p>
                                                <#if p!="">
                                                    <li>
                                                    <@commonTags method="getFileSuffix" type="1" value="${p}">
                                                        <#if getFileSuffix==0>
                                                            <img onclick="advPreviewImg(this)" class="imgdows"
                                                                 src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${p}">
                                                        <#else>
                                                            <img onclick="advPreviewImg(this)"
                                                                 class="imgdows"
                                                                 src="../../../images/file_wj.png">
                                                        </#if>
                                                    </@commonTags>
                                                    </li>
                                                </#if>
                                                </#list>
                                            </#if>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
 </div>
</@body>
<@footer>
<style>
    .uiisar li {
        width: 160px;
        padding: 10px;
        display: -webkit-inline-box;
    }
</style>
<script>
    function goBack() {
        window.location.href = "/dj/tDjMeeting/list/1";
    }
</script>
</@footer>