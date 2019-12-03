<#include "../../common/layout.ftl">
<@header>
<link rel="stylesheet" type="text/css" href="/app/css/timeline.css" xmlns="http://www.w3.org/1999/html">
<link rel="stylesheet" type="text/css" href="/app/css/boxImg.css">
<link rel="stylesheet" type="text/css" href="/plugins/layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="/app/css/jquery.magnify.css">

</@header>
<@body>
<div class="content-wrapper">

    <section class="content-header">
        <h1>
            <small>
                <a href="/appc/tGovRecord/list/1"> 办事记录</a> > 审核
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
                                    <b href="javascript:void"> 审核记录</b>
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
                                            <a>  <#if govProject.serviceType=0>
                                                行政审批
                                            <#else >
                                                 基层服务
                                            </#if></a>
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
                                            <a>${(appUser.name)!''}</a>
                                            <h5>手机号码：</h5>
                                            <a><@commonTags method="getDecrypt3DEs" type="1" value="${(appUser.mobile)!}">${(getDecrypt3DEs)!}</@commonTags></a>
                                            <br style='clear:both'/>
                                        </div>
                                        <div class="recoerd_tab" style="margin-top: 0px !important">
                                            <h5>身份证号：</h5>
                                            <a style="width: 90% !important">
                                                <@commonTags method="getDecrypt3DEs" type="1" value="${(appUser.idCard)!}">${(getDecrypt3DEs)!}</@commonTags>
                                            </a>
                                            <br style='clear:both'/>
                                        </div>
                                    </div>
                                </div>

                                <div class="recoerd_matter">
                                    <span class="cailiaoxinx"></span>
                                    <b>材料信息：</b>
                                    <a href="/appc/tGovRecord/recordZipdownload/${(recordId)!''}?explain=${(govProject.projectTitle)}办事材料"
                                       class="download"">打包下载</a>
                                    <br style='clear:both'/>
                                    <div class="tab_cl" id="imgdow" style="margin-top: -7px">
                                         <#list projectFormList as form>
                                             <div class="recoerd_tab_cal line-height-35">
                                                 <h5 style="width: auto">${(form.formName)!}：</h5>
                                                 <div class="div-clear"></div>
                                                 <a class="btn btn-primary btn-xs dialog mar-30" data-title="打印文档"
                                                    data-width="1000" data-height="900" href="javascript:;"
                                                    data-url="/appc/tGovRecord/printDoc/${(form.id)!}?recordId=${(recordId)!''}">查看详情</a>
                                                 <br style='clear:both'/>
                                             </div>
                                         </#list>
                                    <#--<#list inputList as ma>-->
                                    <#--<#if ma.valueStr!="">-->
                                    <#--<div class="recoerd_tab_cal" i>-->
                                    <#--<h5 style="width: auto">${(ma.name)!}：</h5>-->
                                    <#--<a style="line-height: 40px">${(ma.valueStr)!}</a>-->
                                    <#--<br style='clear:both'/>-->
                                    <#--</div>-->
                                    <#--</#if>-->
                                    <#--</#list>-->
                                         <#list fileList as fi>
                                         <div class="recoerd_tab_cal line-height-35">
                                             <#list fi.value as files>
                                                <h5 style="width: auto">${(fi.name)!}：</h5>
                                                 <div class="div-clear"></div>
                                                 <a class="btn btn-primary btn-xs mar-30"
                                                    href="${(files.materialValue)!}" target="_blank">下载</a>
                                                 <input type="hidden" value="">
                                             </#list>
                                             <br style='clear:both'/>
                                         </div>
                                         </#list>
                                          <#list imageList as fi>
                                         <div class="recoerd_tab_cal" i>
                                             <h5>${(fi.name)}：</h5>
                                             <div class="div-clear"></div>
                                             <#list fi.value as files>
                                                 <div class="caye_img">
                                                     <!--startprint-->
                                                     <img data-magnify="gallery" id="${(files.id)!}"
                                                          data-group="1"
                                                          data-id="${(files.id)!}" data-type="${(files.materialsSign)!}"
                                                          data-src="${(files.materialValue)!'--'}"
                                                          class="<#if (files.materialsSign)??>
                                                              <#if files.materialsSign==1>
                                                          biaojile</#if></#if>"
                                                          src="${(files.materialValue)!'--'}">
                                                     <span style="display:<#if (files.materialsSign)??><#if files.materialsSign==1>block</#if></#if>"
                                                           class="gfyuiet" id="${(files.id)!}s">不合格</span>
                                                     <!--endprint-->
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
                                <#if (recordAddress)??>
                                 <div class="recoerd_matter">
                                     <span class="shenhe"></span>
                                     <b>上门取件：</b>
                                     <br style='clear:both'/>
                                     <div class="tab_cls">
                                         <table class="layui-table">
                                             <tr>
                                                 <td style="text-align: right; background: #ebf5ff">姓名：</td>
                                                 <td style="background: #fff">
                                                     ${(recordAddress.contactName)!"--"}
                                                 </td>
                                                 <td style="text-align: right; background: #ebf5ff">手机号码：</td>
                                                 <td style="background: #fff">
                                                     ${(recordAddress.contactPhone)!"--"}
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="text-align: right; background: #ebf5ff">取件地址：</td>
                                                 <td style="background: #fff" colspan="3">
                                                     ${(recordAddress.addressDetail)!"--"}
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="text-align: right; background: #ebf5ff">取件说明：</td>
                                                 <td style="background: #fff" colspan="3">
                                                     ${(recordAddress.remark)!"--"}
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="text-align: right; background: #ebf5ff">取件状态：</td>
                                                 <td style="background: #fff">
                                                                <@dictTag method="dictValueByType" type="delivery_status" value="${(recordAddress.status)!}"> ${(dictValueByType)!}</@dictTag>
                                                 </td>
                                                 <td style="text-align: right; background: #ebf5ff">取件时间：</td>
                                                 <td style="background: #fff">
                                                     ${(recordAddress.deliveryTime?string('yyyy-MM-dd HH:mm:ss'))!}
                                                 </td>
                                             </tr>
                                             <tr>
                                                 <td style="text-align: right; background: #ebf5ff">备注：</td>
                                                 <td style="background: #fff" colspan="3">
                                                     ${(recordAddress.deliveryRemark)!""}
                                                 </td>
                                             </tr>
                                         </table>
                                     </div>
                                 </div>
                                </#if>
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

                                                             <img data-magnify="gallery" data-group="2"
                                                                  data-src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(materiaList.materialsUrl)!'--'}"
                                                                  class=""
                                                                  src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(materiaList.materialsUrl)!'--'}">
                                                            <#else >
                                                             <img class="imgdows" src="../../../images/file_wj.png">
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
                                    <#if (recordAddress)??&&(govProject.isCharging=='收费')>
                                <div class="recoerd_info">
                                    <div class="recoerd_matter">
                                        <span class="shenhe"></span>
                                        <b>支付信息：</b>
                                        <br style='clear:both'/>
                                        <div class="tab_cls">
                                            <table class="layui-table">
                                                <tr>
                                                    <td style="text-align: right; background: #ebf5ff">付款单号：</td>
                                                    <td style="background: #fff">
                                                        ${(charging.paymentNumber)!"--"}
                                                    </td>
                                                    <td style="text-align: right; background: #ebf5ff">付款状态：</td>
                                                    <td style="background: #fff">
                                                        <@dictTag method="dictValueByType" type="charging_state" value="${(charging.state)!}"> ${(dictValueByType)!}</@dictTag>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right; background: #ebf5ff">付款用户：</td>
                                                    <td style="background: #fff">
                                                        ${(charging.paymentUser)!"--"}
                                                    </td>
                                                    <td style="text-align: right; background: #ebf5ff">付款时间：</td>
                                                    <td style="background: #fff">
                                                        ${(charging.dtPayment?string('yyyy-MM-dd HH:mm:ss'))!}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right; background: #ebf5ff">付款渠道：</td>
                                                    <td style="background: #fff">
                                                        ${(charging.paymentChannel)!"--"}
                                                    </td>
                                                    <td style="text-align: right; background: #ebf5ff">已付金额：</td>
                                                    <td style="background: #fff">
                                                        ${(charging.paid)!"--"}
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                                    </#if>
                            </div> <!-- 信息审核-->

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
                                                                 <a style="height: auto">${(list.reason)!"--"}</a>
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
                                                                                              src="../../../images/file_wj.png">
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
                                                <p class="things">${(appUser.name)}</p>
                                                <p class="brief">提交时间:
                                                    <span class="text-green">${(entity.handleTime?string('yyyy-MM-dd HH:mm:ss'))!'--'}</span>
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
                                                        <p class="things">${(appUser.name)}</p>
                                                        <p class="brief">操作时间:
                                                            <span class="text-green">${(loglist.dtCreate?string('yyyy-MM-dd HH:mm:ss'))!'--'}</span>
                                                        </p>
                                                         <#if (loglist.remark)??>
                                                            <p class="things">说明：${(loglist.remark)!''}</p>
                                                         </#if>
                                                    </aside>
                                                 <#else >
                                                  <aside>
                                                      <p class="things">处理部门：${(loglist.orgnmae)!}</p>
                                                      <p class="things">处理人：${(loglist.username)!}
                                                      <#--(${(loglist.rolename)})-->
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
                                    </article>
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
                                        <td>${(msg.sender)}</td>
                                        <td>${(msg.msgContent)}</td>
                                        <td>${(msg.dtCreate)}</td>
                                    </tr>
                                    </#list>
                                    </tbody>
                                </table>

                            </div>
                            </#if>
                            <!-- 审核 -->
                    <#if (entity.recordStatus==1&&isSlRole) ||(taskId)??>
                            <div class="recoerd_info">
                                <form class="form-horizontal" id="form-detail-recird" method="post"
                                      action="<#if actiontype==0>/appc/tGovProjectAudit/doAdd<#else >/appc/tGovProjectAudit/approval</#if>">
                                    <input type="hidden" id="recordId" name="recordId" value="${(recordId)!}">
                                    <input type="hidden" name="taskId" value="${(taskId)!}"/>
                                    <input type="hidden" name="procInstId" value="${(procInstId)!}">
                                    <input type="hidden" id="materialsFlag" name="materialsFlag"
                                           value="${(materialsFlag)!}">
                                <#if (recordAddress)??>
                                    <#if (recordAddress.status==0)>
                                        <div class="recoerd_matter">
                                            <input type="hidden" name="recordAddressId" value="${(recordAddress.id)!}"/>
                                            <span class="shenhe"></span>
                                            <b>上门取件：</b>
                                            <br style='clear:both'/>
                                            <div class="tab_cls">
                                                <table class="layui-table">
                                                    <tr>
                                                        <td style="text-align: right; background: #ebf5ff">姓名：</td>
                                                        <td style="background: #fff">
                                                            ${(recordAddress.contactName)!"--"}
                                                        </td>
                                                        <td style="text-align: right; background: #ebf5ff">手机号码：</td>
                                                        <td style="background: #fff">
                                                            ${(recordAddress.contactPhone)!"--"}
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right; background: #ebf5ff">取件地址：</td>
                                                        <td style="background: #fff" colspan="3">
                                                            ${(recordAddress.addressDetail)!"--"}
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right; background: #ebf5ff">取件说明：</td>
                                                        <td style="background: #fff" colspan="3">
                                                            ${(recordAddress.remark)!"--"}
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right; background: #ebf5ff">取件状态：</td>
                                                        <td style="background: #fff">
                                                        <@dictTag method="dictValueByType" type="delivery_status" value="${(recordAddress.status)!}"> ${(dictValueByType)!}</@dictTag>
                                                        </td>
                                                        <td style="text-align: right; background: #ebf5ff">取件时间：</td>
                                                        <td style="background: #fff">
                                                            <input type="text"
                                                                   class="form-control date input-select-200"
                                                                   id="deliveryTime" name="deliveryTime"
                                                                   value="${(recordAddress.deliveryTime?string('yyyy-MM-dd HH:mm:ss'))!}"
                                                                   placeholder="选择取件时间"
                                                                   lay-verify="required">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right; background: #ebf5ff">备注：</td>
                                                        <td style="background: #fff" colspan="3">
                                                            <textarea class="form-control" name="deliveryRemark"
                                                                      rows="3" placeholder="请输入备注，最多300个字符 ..."
                                                                      lay-verify="required">${(recordAddress.deliveryRemark)!""}</textarea>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                    <#else >
                                    <div class="recoerd_matter">
                                        <span class="shenhe"></span>
                                        <b>上门取件：</b>
                                        <br style='clear:both'/>
                                        <div class="tab_cls">
                                            <table class="layui-table">
                                                <tr>
                                                    <td style="text-align: right; background: #ebf5ff">姓名：</td>
                                                    <td style="background: #fff">
                                                        ${(recordAddress.contactName)!"--"}
                                                    </td>
                                                    <td style="text-align: right; background: #ebf5ff">手机号码：</td>
                                                    <td style="background: #fff">
                                                        ${(recordAddress.contactPhone)!"--"}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right; background: #ebf5ff">取件地址：</td>
                                                    <td style="background: #fff" colspan="3">
                                                        ${(recordAddress.addressDetail)!"--"}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right; background: #ebf5ff">取件说明：</td>
                                                    <td style="background: #fff" colspan="3">
                                                        ${(recordAddress.remark)!"--"}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right; background: #ebf5ff">取件状态：</td>
                                                    <td style="background: #fff">
                                                        <@dictTag method="dictValueByType" type="delivery_status" value="${(recordAddress.status)!}"> ${(dictValueByType)!}</@dictTag>
                                                    </td>
                                                    <td style="text-align: right; background: #ebf5ff">取件时间：</td>
                                                    <td style="background: #fff">
                                                        ${(recordAddress.deliveryTime?string('yyyy-MM-dd HH:mm:ss'))!}
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right; background: #ebf5ff">备注：</td>
                                                    <td style="background: #fff" colspan="3">
                                                        ${(recordAddress.deliveryRemark)!""}
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    </#if>
                                </#if>
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
                                                        <input type="radio" name="result" title="通过" value="1"
                                                               ay-filter="erweima"
                                                               checked>
                                                        <input type="radio" name="result" title="不通过" value="0"
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
                                                        <textarea name="reason" id="reason"
                                                                  class="textar-remark "></textarea>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right; background: #ebf5ff">上传材料</td>
                                                    <td style="background: #fff">
                                                        <input type="hidden" id="audit_file" name="auditfile">
                                                        <a class="btn btn-primary dialog " href="javascript:;"
                                                           data-title=" 附件管理"
                                                           data-url="/system/accessory/add?fileQuantity=0&vessel=audit_file&classify=audit_file&dict=audit_file"
                                                           data-width="1200" data-height="700"><i
                                                                class="fa fa-plus"></i> 添加附件</a>
                                                        <div id="ImgPreview">
                                                            <ul class="uiisar audit_file_url">

                                                            </ul>
                                                        </div>

                                                    </td>
                                                </tr>

                                                </tbody>

                                            </table>

                                        </div>
                                    </div>

                                    <div class="recoerd_matter">
                                        <div class="sub">
                                            <button id="record_detail_submit" class="btn btn-success"><i
                                                    class="fa fa-save"></i> 提 交
                                            </button>
                                            <#if entity.recordStatus==2>
                                                <a class="btn btn-primary dialog" href="javascript:;" data-title="发送消息"
                                                   data-url="/system/tGovRecordMsg/add/${(recordId)}"
                                                   data-width="550" data-height="350"> 发送消息</a>
                                            </#if>
                                        </div>
                                    </div>

                                </form>
                            </div> <!-- 审核 -->
                    </#if>
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
            var inde = $(this).index();  //
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

<script src="/app/js/modules/zoom.js"></script>

<script>
    $(document).ready(function () {
        jkhae();
    });

    $('#orgId').change(function () {
        var data = $(this).val();
        $("#reason").val(data);
    });

    function GetValue(se, obj, id) {
        var va = $("#" + obj.vessel).val();
        if (va != "") {
            $("#" + obj.vessel).val(obj.id + "," + va);
        } else {
            $("#" + obj.vessel).val(obj.id);
        }


        for (var i = 0; i < obj.url.length; i++) {
            var html = "";
            var url = '<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>' + obj.url[i];
            var fileName = obj.url[i].lastIndexOf(".");
            var fileNameLength = obj.url[i].length;
            var suffix = obj.url[i].substring(fileName + 1, fileNameLength);//截
            var array = ["JPG", "JPEG", "PNG", "GIF", "jpg", "jpeg", "png", "gif"];
            var index = $.inArray(suffix, array);
            if (index >= 0) {
                html = '<li>' +
                        '<span class="layui-icon  layui-icon-close" name="' + obj.vessel + '" test="' + obj.id[i] + '">&#x1006;</span>' +
                        '<img data-magnify="gallery" data-src="' + url + '"  src="' + url + '"> ' +
                        '</li>'
            } else {
                html = '<li>' +
                        '<span class="layui-icon  layui-icon-close" name="' + obj.vessel + '" test="' + obj.id[i] + '">&#x1006;</span>' +
                        '<img src="../../../images/file_wj.png"> ' +
                        '</li>'
            }
            if (se == 1) {
                $("." + obj.vessel + "_url").html(html);
            } else {
                $("." + obj.vessel + "_url").append(html);
            }

        }

        jkhae();

    }

    function jkhae() {
        $(".uiisar span").click(function () {
            $(this).next().parent().remove();
            var name = $(this).attr("name");
            var hjsgr = $("#" + name).val();
            var key = $(this).attr('test');
            var sess = (',' + hjsgr + ',').replace(',' + key + ',', ',').substr(1).replace(/,$/, '');
            $("#" + name).val(sess);
        });
    }

    $("#record_detail_submit").click(function (e) {
        layer.confirm('确定要提交该记录？', {
            btn: ['确认', '取消'] //按钮
        }, function (index) {
            $("#form-detail-recird").submit();
            layer.close(index);
            return true;
        }, function (index) {
            layer.close(index);
            return false;
        });
        return false;
    });
    $('#deliveryTime').daterangepicker({
        "autoApply": true,
        "singleDatePicker": true,
        "showDropdowns": true,
        "timePicker": true,
        "timePicker24Hour": true,
        // "opens": "center",
        locale: {
            format: "YYYY-MM-DD HH:mm:ss",
            applyLabel: '确定',
            cancelLabel: '取消',
            daysOfWeek: ['日', '一', '二', '三', '四', '五', '六'],
            monthNames: ['一月', '二月', '三月', '四月', '五月', '六月',
                '七月', '八月', '九月', '十月', '十一月', '十二月'
            ],
            // firstDay: 1
        },
    }, function (start) {

    });

</script>
<style>
    .uiisar li {
        width: 160px;
        padding: 10px;
        display: -webkit-inline-box;
    }
</style>
<script src="/app/js/jquery.magnify.js"></script>
 <script src="/plugins/layui/layui.js"></script>
</@footer>