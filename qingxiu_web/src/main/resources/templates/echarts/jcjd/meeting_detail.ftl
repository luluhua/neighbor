<#include "../../common/layout_dl.ftl">
<@header>
<style>
    .pd{line-height: 30px;}
</style>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" >
    <div class="box-body">
                            <div class="form-group">
                                <label for="djOrgName" class="col-sm-2 control-label">党组织</label>
                                <div class="col-sm-10 pd">
                                    ${(entity.djOrgName)!"--"}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="title" class="col-sm-2 control-label">会议标题</label>
                                <div class="col-sm-10 pd">
                                    ${(entity.title)!"--"}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mtTheme" class="col-sm-2 control-label">会议主题</label>
                                <div class="col-sm-10 pd" >
                                    ${(entity.mtTheme)!"--"}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="dtMeeting" class="col-sm-2 control-label">会议时间</label>
                                <div class="col-sm-10 pd">
                                   ${(entity.dtMeeting?string('yyyy-MM-dd HH:mm:ss'))!}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="address" class="col-sm-2 control-label">会议地点</label>
                                <div class="col-sm-10 pd">
                                    ${(entity.address)!}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mtType" class="col-sm-2 control-label">会议分类</label>
                                <div class="col-sm-10 pd">
                                   <@dictTag method="dictValueByType" type="mt_classify" value="${(entity.mtClassify)!}"> ${(dictValueByType)!}</@dictTag>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mtType" class="col-sm-2 control-label">会议类型</label>
                                <div class="col-sm-10 pd">
                                   <@dictTag method="dictValueByType" type="${(entity.mtClassify)!}" value="${(entity.mtType)!}"> ${(dictValueByType)!}</@dictTag>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mtType" class="col-sm-2 control-label">参会人员</label>
                                <div class="col-sm-10 pd">
                                    ${(entity.participants)!}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="numberOfAbsences" class="col-sm-2 control-label">缺席人数</label>
                                <div class="col-sm-10 pd">
                                    ${(entity.numberOfAbsences)!}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="attendance" class="col-sm-2 control-label">出席人数</label>
                                <div class="col-sm-10 pd">
                                    ${(entity.attendance)!}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mtContent" class="col-sm-2 control-label">会议内容</label>
                                <div class="col-sm-10 pd">
                                    ${(entity.mtContent)!}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="mtFile" class="col-sm-2 control-label">会议图片</label>
                                <div class="col-sm-10 ">
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
</form>
</@body>
<@footer>
</@footer>