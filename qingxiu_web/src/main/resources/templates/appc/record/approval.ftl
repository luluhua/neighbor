<#include "../../common/layout.ftl">
<@header>
    <link rel="stylesheet" type="text/css" href="/app/css/timeline.css">
    <link rel="stylesheet" type="text/css" href="/app/css/boxImg.css">
    <link rel="stylesheet" type="text/css" href="/plugins/layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="/app/css/jquery.magnify.css">
</@header>
<@body>
<div class="content-wrapper">

    <section class="content-header">
        <h1>
            <small>
                <a href="/appc/tGovRecord/list/1"> <a href="javascript:history.back(-1);"> 审批大厅</a></a> > 待审批
            </small>
        </h1>
    </section>
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="form-horizontal layui-form layui-form-pane">
                        <div class="box-body">
                            <div class="recoerd_title">
                                <h1>办事审批</h1>
                            </div>
                            <div class="group">
                                <div class="recoerd_group">
                                    <b class="selects" href="javascript:void"> 信息审核</b>
                                    <b href="javascript:void"> 审核历史</b>
                                    <b href="javascript:void"> 办事历史</b>
                                    <b href="javascript:void"> 消息列表</b>
                                </div>
                            </div>
                            <!-- 信息审核-->
                            <div class="recoerd_info" id="reco">
                                <div class="recoerd_matter">
                                    <span class="leixing"></span>
                                    <b>服务类型</b>
                                    <br style='clear:both'/>
                                    <div class="tab_cl">
                                        <div class="recoerd_tab ideas">
                                            <h5>服务类型：</h5>
                                            <a><#if govProject.serviceType=0>
                                                行政审批
                                            <#else >
                                             基层服务
                                            </#if></a>
                                        <#-- <h5>提交时间：</h5>
                                         <a>${(govProject.dtCreate?string('yyyy-MM-dd'))!'--'}</a>
                                         <br style='clear:both'/>-->
                                        </div>
                                    </div>
                                </div>

                                <div class="recoerd_matter">
                                    <span class="shixiangxinx"></span>
                                    <b>事项信息：</b>
                                    <br style='clear:both'/>
                                    <div class="tab_cl">
                                        <div class="recoerd_tab ideas">
                                            <h5>事项信息：</h5>
                                            <a>${(govProject.projectTitle)!}</a>
                                            <br style='clear:both'/>
                                        </div>
                                    </div>
                                </div>

                                <div class="recoerd_matter">
                                    <span class="chulibumen"></span>
                                    <b>处理部门：</b>
                                    <br style='clear:both'/>
                                    <div class="tab_cl">
                                        <div class="recoerd_tab">
                                            <h5>办理部门：</h5>
                                            <a>${(sysOrg.name)}</a>
                                            <h5>行政区域：</h5>
                                            <a>${(city.name)!} ${(stree.name)!} ${(community.name)!}</a>
                                            <br style='clear:both'/>
                                        </div>
                                    <#--<div class="recoerd_tab ideas" style="margin-top: 0px !important">-->
                                    <#--<h5>办理地址：</h5>-->
                                    <#--<a>${(sysOrgAddress.address)!}</a>-->
                                    <#--<br style='clear:both'/>-->
                                    <#--</div>-->
                                    </div>
                                </div>

                                <div class="recoerd_matter">
                                    <span class="yonghuxinx"></span>
                                    <b>用户信息：</b>
                                    <br style='clear:both'/>
                                    <div class="tab_cl">
                                        <div class="recoerd_tab">
                                            <h5>姓名：</h5>
                                            <a>${(appUser.username)!''}</a>
                                            <h5>手机号码：</h5>
                                            <a>${(appUser.mobile)!''}</a>
                                            <br style='clear:both'/>
                                        </div>
                                        <div class="recoerd_tab" style="margin-top: 0px !important">
                                            <h5>身份证号：</h5>
                                            <a style="width: 90% !important">${(appUser.idCard)!''}</a>
                                            <br style='clear:both'/>
                                        </div>
                                    </div>
                                </div>

                                <div class="recoerd_matter">
                                    <span class="cailiaoxinx"></span>
                                    <b>材料信息：</b>

                                <#--<a href="/appc/tGovRecord/recordZipdownload/${(recordId)}"-->
                                <#--class="download"">打包下载</a>-->
                                    <a href="/appc/tGovRecord/recordZipdownload/${(recordId)!''}?explain=${(govProject.projectTitle)}办事材料"
                                       class="download"">打包下载</a>

                                    <br style='clear:both'/>
                                    <div class="tab_cl" id="imgdow" style="margin-top: -7px">
                                           <#list projectFormList as form>
                                               <a class="btn btn-primary btn-xs dialog" data-title="打印文档"
                                                  data-width="1000" data-height="900" href="javascript:;"
                                                  data-url="/appc/tGovRecord/printDoc/${(form.id)!}?recordId=${(recordId)!''}">打印《${(form.formName)!}
                                                   》</a>
                                           </#list>
                                    <#--<#list materialsList as ma>-->
                                    <#--<div class="recoerd_tab_cal" i>-->
                                    <#--<#if  (ma.materialUrl)??>-->
                                    <#--<h5>${(ma.materialName)}：</h5>-->
                                    <#--<div class="caye_img">-->
                                    <#--<@commonTags method="getFileSuffix" type="1" value="${(ma.materialUrl)!'--'}">-->
                                    <#--<#if getFileSuffix==1>-->
                                    <#--<img modal="zoomImg"-->
                                    <#--class="imgdow"-->
                                    <#--src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(ma.materialUrl)!'--'}">-->
                                    <#--</#if>-->
                                    <#--</@>-->
                                    <#--</div>-->
                                    <#--<input type="hidden" value="">-->
                                    <#--<a href="/download/downloadFile/${(ma.id)}"-->
                                    <#--class="download ca_download" name="">下载</a>-->
                                    <#--<#else >-->
                                    <#--<h5 style="width: 10%;">${(ma.materialName)}：</h5>-->
                                    <#--<a style="line-height: 40px">${(ma.materialContent)!}</a>-->
                                    <#--</#if>-->
                                    <#--<#if  (ma.materialUrl)??>-->
                                    <#--<h5>${(ma.materialName)}：</h5>-->
                                    <#--<div class="caye_img">-->
                                    <#--<@commonTags method="getFileSuffix" type="1" value="${(ma.materialUrl)!'--'}">-->
                                    <#--<#if getFileSuffix==0>-->
                                    <#--<img modal="zoomImg"-->
                                    <#--class="imgdow"-->
                                    <#--src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(ma.materialUrl)!'--'}">-->
                                    <#--</#if>-->
                                    <#--</@>-->
                                    <#--</div>-->
                                    <#--<input type="hidden" value="">-->
                                    <#--<a href="/download/downloadFile/${(ma.id)}"-->
                                    <#--class="download ca_download" name="">下载</a>-->
                                    <#--<#else >-->
                                    <#--<h5 style="width: auto">${(ma.materialName)}：</h5>-->
                                    <#--<a style="line-height: 40px">${(ma.materialContent)!}</a>-->
                                    <#--</#if>-->
                                    <#--<br style='clear:both'/>-->
                                    <#--</div>-->

                                    <#--</#list>-->
                                         <#list inputList as ma>
                                             <#if ma.valueStr!="">
                                             <div class="recoerd_tab_cal" i>
                                                 <h5 style="width: auto">${(ma.name)}：</h5>
                                                 <a style="line-height: 40px">${(ma.valueStr)!}</a>
                                                 <br style='clear:both'/>
                                             </div>
                                             </#if>
                                         </#list>
                                         <#list fileList as fi>
                                         <div class="recoerd_tab_cal" i>
                                             <h5>${(fi.name)}：</h5>
                                             <#list fi.value as files>
                                            《${(fi.name)}》
                                                 <input type="hidden" value="">
                                             <#--<a href="/download/downloadFile/${(files.id)}"class="download ca_download" name="">下载</a>-->
                                             </#list>
                                             <br style='clear:both'/>
                                         </div>
                                         </#list>
                                          <#list imageList as fi>
                                         <div class="recoerd_tab_cal" i>
                                             <h5>${(fi.name)}：</h5>
                                             <#list fi.value as files>
                                                 <div class="caye_img">
                                                     <img data-magnify="gallery"
                                                          class="" data-src="${(files.materialValue)!'--'}"
                                                          src="${(files.materialValue)!'--'}">


                                                 </div>
                                                 <input type="hidden" value="">
                                             <#--<a href="/download/downloadFile/${(files.id)}"class="download ca_download" name="">下载</a>-->
                                             </#list>
                                             <br style='clear:both'/>
                                         </div>
                                          </#list>
                                    </div>
                                </div>

                                <!-- 最新审核信息 -->
                             <#if (audit)??>
                                <div class="recoerd_matter">
                                    <span class="shenhexinxi"></span>
                                    <b>审核信息：</b>
                                    <br style='clear:both'/>
                                    <div class="tab_cl" style="height: auto">
                                        <div class="recoerd_tab">
                                            <h5>审批人：</h5>
                                            <a>${(audit.username)}</a>
                                            <h5>审核结果：</h5>
                                            <a style="color: <#if audit.result==0>#f6393f <#else>#1c87bf</#if>;"><#if audit.result==0>
                                                不通过 <#else >通过</#if></a>
                                            <br style='clear:both'/>
                                        </div>
                                        <div class="recoerd_tab" style="margin-top: 0px !important">
                                            <h5>审核时间：</h5>
                                            <a style="width: 90% !important">${(audit.dtCreate?string('yyyy-MM-dd HH:mm:ss'))!'--'}</a>
                                            <br style='clear:both'/>
                                        </div>
                                        <div class="recoerd_tab ideas"
                                             style="margin-top: 0px !important;height: auto!important">
                                            <h5>意见：</h5>
                                            <a style="height: auto" class="ceoe">${(audit.reason)!"--"}</a>
                                            <br style='clear:both'/>
                                        </div>
                                        <#if s==1>
                                        <div class="recoerd_tab"
                                             style="margin-top: 0px !important;height: 100px !important">
                                            <h5 style="height: 100px">材料：</h5>
                                            <div style="height: 100px; width: 90%!important;float: left; background: #fff;"
                                                 class="ceoe">
                                                    <#list materiaList as materiaList>
                                                    <div class="caud_img">
                                                        <@commonTags method="getFileSuffix" type="1" value="${(materiaList.materialsUrl)!'--'}">
                                                            <#if getFileSuffix==0>

                                                            <img data-magnify="gallery"
                                                                 data-src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(materiaList.materialsUrl)!'--'}"
                                                                 class=""
                                                                 src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(materiaList.materialsUrl)!'--'}">
                                                            <#else >
                                                             <img class="imgdows" src="../../../images/default.png">
                                                            </#if>
                                                        </@>
                                                    </div>
                                                    </#list>
                                                <a href="/appc/tGovRecord/zipdownload/${(audit.materialsFlag)}?explain=${(audit.username)}审核材料"
                                                   class="reauddew"
                                                   name="">下载</a>
                                            </div>

                                            <br style='clear:both'/>
                                        </div>
                                        </#if>


                                    </div>
                                </div>
                             </#if>
                            </div> <!-- 信息审核--> <!-- 信息审核-->


                            <!-- 审核历史 -->
                    <#if (audit)??>
                            <div class="recoerd_info" id="history" style="display: none">
                                <div class="content">
                                    <article>
                                         <#list auditList as list>
                                             <section>
                                                 <span class=" <#if list.result==0>point-time point-red <#else >point-times</#if>"></span>
                                                 <time datetime="2013-03">
                                                     <span>${(list.dtCreate?string('yyyy-MM-dd HH:mm:ss'))!'--'}</span>
                                                 </time>
                                                 <aside>
                                                     <div class="recoerd_matter">
                                                         <div class="tab_cl">
                                                             <div class="recoerd_tab lishi">
                                                                 <h5>审批人：</h5>
                                                                 <a style="border-top: 1px solid #E7E7E7;">${(list.username)}</a>
                                                                 <h5>审核结果：</h5>
                                                                 <a style="border-top: 1px solid #E7E7E7;color:<#if list.result==0> #f6393f <#else>#1c87bf</#if>;"><#if list.result==0>
                                                                     不通过  <#else >通过 </#if></a>
                                                                 <br style='clear:both'/>
                                                             </div>
                                                             <div class=" recoerd_tab liyj"
                                                                  style="margin-top: 0px !important;height: auto">
                                                                 <h5>意见：</h5>
                                                                 <a style="height: auto">${(list.reason)!""}</a>
                                                                 <br style='clear:both'/>
                                                             </div>
                                                             <!-- 审核材料 -->

                                                             <#if (list.materiaList) ?? >
                                                             <div class="recoerd_tab"
                                                                  style="margin-top: 0px !important;height: 100px !important">
                                                                 <h5 style="width: 15%; height: 100px">材料：</h5>
                                                                 <div style="height: 100px; width: 85%!important;float: left; background: #fff;"
                                                                      class="ceoe">
                                                                            <#list list.materiaList as materiaList>
                                                                            <div class="caud_img">
                                                                                <@commonTags method="getFileSuffix" type="1" value="${(materiaList.materialsUrl)!'--'}">
                                                                                    <#if getFileSuffix==0>

                                                                                    <img data-magnify="gallery"
                                                                                         data-src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(materiaList.materialsUrl)!'--'}"
                                                                                         class=""
                                                                                         src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(materiaList.materialsUrl)!'--'}">
                                                                                    <#else >
                                                                                         <img class="imgdows"
                                                                                              src="../../../images/default.png">
                                                                                    </#if>
                                                                                </@>
                                                                            </div>
                                                                            </#list>
                                                                     <a href="/appc/tGovRecord/zipdownload/${(list.materialsFlag)}?explain=${(list.username)}审核材料"
                                                                        class="reauddew" name="">下载</a>
                                                                 </div>
                                                                 <br style='clear:both'/>
                                                             </div>
                                                             </#if>

                                                         </div>
                                                     </div>
                                                 </aside>
                                             </section>
                                         </#list>
                                    </article>
                                </div>
                            </div><!--审核历史 -->
                    </#if>

                            <!-- 办事历史 -->
                            <div class="recoerd_info" id="workhistory" style="display: none">
                                <div class="content">
                                    <article>
                                        <section class="banshilis">
                                            <span class="point-times "></span>
                                            <time datetime="2013-03">
                                                <span>提交材料</span>
                                            </time>
                                            <aside>
                                                <p class="things">${(appUser.username)}</p>
                                                <p class="brief">提交时间:
                                                    <span class="text-green">${(entity.dtCreate?string('yyyy-MM-dd HH:mm:ss'))!'--'}</span>
                                                </p>
                                            </aside>
                                        </section>
                                  <#if (recordLogs)??>
                                      <#list recordLogs as loglist>
                                             <section class="banshilis">
                                                 <span class="point-times "></span>
                                                 <time datetime=" 2013-03">
                                        <@dictTag method="dictValueByType" type="record_log_step" value="${(loglist.step)!}">
                                            <span>${(dictValueByType)!}</span>
                                        </@dictTag>
                                                 </time>
                                          <#if loglist.step==8||loglist.step==5||loglist.step==9>
                                                    <aside>
                                                        <p class="things">${(appUser.username)}</p>
                                                        <p class="brief">操作时间:
                                                            <span class="text-green">${(entity.dtCreate?string('yyyy-MM-dd HH:mm:ss'))!'--'}</span>
                                                        </p>
                                                         <#if (loglist.remark)??>
                                                            <p class="things">说明：${(loglist.remark)!''}</p>
                                                         </#if>
                                                    </aside>
                                          <#else >
                                                 <aside>
                                                     <p class="things">处理部门：${(loglist.orgnmae)!}</p>
                                                     <p class="things">处理人：${(loglist.username)!}
                                                     <#--(${(loglist.rolename)}) -->
                                                     </p>
                                                   <#if (loglist.remark)??>
                                                     <p class="things">说明：${(loglist.remark)!}</p>
                                                   </#if>
                                                     <p class="brief">处理时间:
                                                         <span class="text-green">${(loglist.dtCreate?string('yyyy-MM-dd HH:mm:ss'))!'--'}</span>
                                                     </p>
                                                 </aside>
                                          </#if>
                                             </section>
                                      </#list>
                                  </#if>
                                </div>
                            </div>
                            <!-- 办事历史 -->

                            <!-- 消息列表 -->
                     <#if msga=1>
                            <div class="recoerd_info" id="pro_info" style="display: none">
                                <table class="layui-table">
                                    <colgroup>
                                        <col width="10%">
                                        <col width="73%">
                                        <col width="17%">
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th>发送人</th>
                                        <th>内容</th>
                                        <th>发送时间</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <#list masgList as msg>
                                    <tr>
                                        <td>${(msg.sender)!''}</td>
                                        <td>${(msg.msgContent)!''}</td>
                                        <td>${(msg.dtCreate)!''}</td>
                                    </tr>
                                    </#list>
                                    </tbody>
                                </table>

                            </div>
                     </#if>
                            <!-- 审核 -->

                            <div class="recoerd_info">
                                <form class="form-horizontal " method="post" id="form-approval-recird"
                                      action="/appc/tGovProjectAudit/approval" onsubmit="return uploadaud()">
                                    <input type="hidden" id="recordId" name="recordId" value="${(recordId)!}">
                                    <input type="hidden" name="taskId" value="${(taskId)!}"/>
                                    <input type="hidden" name="procInstId" value="${(procInstId)!}">
                                    <input type="hidden" id="materialsFlag" name="materialsFlag"
                                           value="${(materialsFlag)!}">
                                    <div class="recoerd_matter">
                                        <span class="shenhe"></span>
                                        <b>审核：</b>
                                        <br style='clear:both'/>

                                        <div class="tab_cls">
                                            <table class="layui-table">
                                                <colgroup>
                                                    <col width="10%">
                                                    <col width="93%">
                                                </colgroup>
                                                <tbody>
                                                <tr>
                                                    <td style="text-align: right; background: #ebf5ff">是否通过</td>
                                                    <td style="background: #fff">
                                                        <input type="radio" name="state" title="通过" value="1"
                                                               ay-filter="erweima"
                                                               checked>
                                                        <input type="radio" name="state" title="不通过" value="0"
                                                               ay-filter="erweima">

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right; background: #ebf5ff">常用意见</td>
                                                    <td style="background: #fff">
                                                        <select name="orgId" id="orgId"
                                                                class="form-control select2 input-select-200" lay-ignore
                                                                style="width: 100%;"
                                                                lay-verify="required">
                                                            <option value="">选择常用意见</option>
                                                            <#list frequentlyList as lylist>
                                                        <option value="${(lylist.content)!}">${(lylist.content)!}</option>
                                                            </#list>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right; background: #ebf5ff">意见</td>
                                                    <td style="background: #fff">
                                                        <textarea id="reason" name="remark"
                                                                  class="textar-remark "></textarea>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right; background: #ebf5ff">上传材料</td>
                                                    <td style="background: #fff">
                                                        <button style="float: left" type="button" class="layui-btn"
                                                                id="test1">
                                                            <i class="layui-icon">&#xe67c;</i>选择文件
                                                        </button>
                                                        <div id="ImgPreview"></div>
                                                        <a class="btn btn-primary"
                                                           style="height: 39px;line-height: 30px;display: none"
                                                           id="daw" href="javascript:;"> 开始上传</a>
                                                    </td>
                                                </tr>

                                                </tbody>

                                            </table>


                                        </div>
                                    </div>

                                    <div class="recoerd_matter">
                                        <div class="sub">
                                            <button id="record_approval_submit" class="btn btn-success"><i
                                                    class="fa fa-save"></i> 提 交
                                            </button>
                                            <a class="btn btn-primary dialog" href="javascript:;" data-title="发送消息"
                                               data-url="/system/tGovRecordMsg/add/${(recordId)}"
                                               data-width="550" data-height="350"> 发送消息</a>
                                        </div>
                                    </div>

                                </form>
                            </div> <!-- 审核 -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
</@body>
<@footer>


<script>
    $(function () {

        $(".recoerd_group b").click(function () {
            $(this).addClass("selects").siblings().removeClass("selects");
            var inde = $(this).index();
            if (inde == 0) {
                $("#reco").css({'display': 'block'})
                $("#history").css({'display': 'none'})
                $("#workhistory").css({'display': 'none'})
                $("#pro_info").css({'display': 'none'})
            } else if (inde == 1) {
                $("#reco").css({'display': 'none'})
                $("#history").css({'display': 'block'})
                $("#workhistory").css({'display': 'none'})
                $("#pro_info").css({'display': 'none'})
            } else if (inde == 2) {
                $("#reco").css({'display': 'none'})
                $("#history").css({'display': 'none'})
                $("#workhistory").css({'display': 'block'})
                $("#pro_info").css({'display': 'none'})
            } else if (inde == 3) {
                $("#reco").css({'display': 'none'})
                $("#history").css({'display': 'none'})
                $("#workhistory").css({'display': 'none'})
                $("#pro_info").css({'display': 'block'})
            }
        })
    })
</script>

<script src="/app/js/jquery.magnify.js"></script>

<script>

    $(document).ready(function () {
        //序列化表单
        $.fn.extend({
            serializeObject: function () {
                var o = {};
                var a = this.serializeArray();
                $.each(a, function () {
                    if (this.name != "file") {//排除文件上传
                        if (o[this.name]) {
                            if (!o[this.name].push) {
                                o[this.name] = [o[this.name]];
                            }
                            o[this.name].push(this.value || '');
                        } else {
                            o[this.name] = this.value || '';
                        }
                    }
                });
                return o;
            }
        });

        //上传文件
        layui.use('upload', function () {
            var upload = layui.upload;    //apkUpload
            //apk文件上传
            var uploadInst = upload.render({
                elem: '#test1',
                url: '/appc/tGovAuditMaterial/doAdd',
                auto: false,
                bindAction: '#daw',
                accept: 'file',
                size: 10240,
                multiple: true,
                number: 3,
                data: {
                    "groupId": 2,
                    "serviceId": $("#materialsFlag").val(),
                    "saveTypeId": 0,
                },
                choose: function (obj) {
                    //将每次选择的文件追加到文件队列
                    var files = obj.pushFile();
                    //预读本地文件，如果是多文件，则会遍历。(不支持ie8/9)
                    obj.preview(function (index, file, result) {
                        if (file.size > 0 && $('#ImgPreview').find('img').length === 0) {
                            $('#ImgPreview').empty();
                        }
                        // 添加图片 ImgPreview-预览的dom元素的id
                        $('#ImgPreview').append('<div class="image-container" id="container' + index + '"><span id="upload_img_' + index + '" class="layui-icon layui-icon-close yrie">&#x1006;</span>' +
                                '<img id="showImg' + index + '" style="" src="' + result + '" alt="' + file.name + '"></div>'
                        );
                        // $("#daw").css({'display': '-webkit-inline-box'});
                        //删除某图片
                        $("#upload_img_" + index).bind('click', function () {
                            delete files[index];
                            $("#container" + index).remove();
                            var a = $("#ImgPreview ").find(".image-container").length;
                            if (a == 0) {
                                $("#daw").css({'display': 'none'});
                            }
                        });
                        //某图片放大预览
                        $("#showImg" + index).bind('click', function () {
                            var width = $("#showImg" + index).width();
                            var height = $("#showImg" + index).height();
                            var scaleWH = width / height;
                            var bigH = 600;
                            var bigW = scaleWH * bigH;
                            if (bigW > 900) {
                                bigW = 900;
                                bigH = bigW / scaleWH;
                            }
                            // 放大预览图片
                            layer.open({
                                type: 1,
                                title: false,
                                closeBtn: 1,
                                shadeClose: true,
                                area: [bigW + 'px', bigH + 'px'], //宽高
                                content: "<img width='" + bigW + "' height='" + bigH + "' src=" + result + " />"
                            })
                        })
                    })
                }

                , before: function (obj) {

                    var img_num = $("#ImgPreview ").find(".image-container").length;
                    console.log('img_num:' + img_num)
                    if (img_num > 3) {
                        layer.msg('最多上传3张图片！');
                        return false;
                    }
                    layer.msg('图片上传中...', {
                        icon: 16,
                        shade: 0.01,
                        time: 0
                    })
                },


                done: function (res) {
                    layer.close(layer.msg());
                },
            });
        });

    })


    function uploadaud() {
        $("#daw")[0].click();
        return true;
    }

    $('#orgId').change(function () {
        var data = $(this).val();
        $("#reason").val(data);
    });

    //判断当前上传的材料数是否大于3
    $("#record_approval_submit").on("click", function () {
        var ImgPreview_len = $("#ImgPreview ").find(".image-container").length;
        if (ImgPreview_len > 3) {
            layer.msg('最多上传3张图片！');
            return false;
        } else {
            $("#form-approval-recird").submit();
        }
    });
</script>
</@footer>