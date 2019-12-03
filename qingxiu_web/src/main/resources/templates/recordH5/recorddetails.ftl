<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title></title>
    <link rel="shortcut icon" href="/base/images/iPhone1024@2x.png">
    <link href="/base/css/mui.min.css" rel="stylesheet"/>
    <link href="/record/css/recorddetails.css" rel="stylesheet"/>
    <link href="/record/css/timeline.css" rel="stylesheet"/>
    <link rel="stylesheet" type="text/css" href="/app/css/boxImg.css">
    <link rel="stylesheet" type="text/css" href="/plugins/layui/css/layui.css">
    <script src="/base/js/mui.min.js"></script>
    <script src="/base/js/jquery-1.8.3.min.js"></script>
    <script src="/plugins/layui/layui.js"></script>
    <script src="/app/js/modules/xform.js"></script>

    <script type="text/javascript" charset="utf-8">

        mui.init();

        window.onload = function () {
            mui('.mui-scroll-wrapper').scroll({
                deceleration: 0.0005 //flick 减速系数，系数越大，滚动速度越慢，滚动距离越小，默认值0.0006
            });
        }

    </script>
</head>
<body>

<!-- 主界面菜单同时移动 -->
<!-- 侧滑导航根容器 -->
<div class="mui-off-canvas-wrap mui-draggable">
    <!-- 主页面容器 -->
    <div class="mui-inner-wrap">
        <!-- 页眉导航 -->
    <#--<header class="mui-bar mui-bar-nav">-->
    <#--<h1 class="mui-title">办事审批</h1>-->
    <#--</header>-->
        <!-- 主页面内容容器 -->
        <div class="mui-content mui-scroll-wrapper">
            <div class="mui-scroll">
                <div class="box content-wrapper">
                    <div class="elsease">
                        <div class="reord_type">
                            <b href="javascript:;" class="pitch_on">信息审核</b>
                            <b href="javascript:;">审核历史</b>
                            <b href="javascript:;">办事历史</b>
                            <b href="javascript:;">消息列表</b>
                            <br style="clear:both">
                        </div>
                    </div>

                    <div id="shenhexinxi"> <!-- 审核信息 -->
                        <div class="reord_info">
                            <div class="info_title">
                                <span class="icon-fuwuleix"></span>
                                <b>服务类型</b>
                                <br style="clear:both">
                            </div>
                            <div class="info_com">
                                <table class="layui-table">
                                    <colgroup>
                                        <col width="30%">
                                        <col width="70%">
                                    </colgroup>
                                    <thead>
                                    </thead>

                                    <tbody>
                                    <tr>
                                        <td style="text-align: right; background: #ebf5ff">服务类型</td>
                                        <td><#if govProject.serviceType=0>
                                            行政审批
                                        <#else >
                                                 基层服务
                                        </#if></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; background: #ebf5ff">提交时间</td>
                                        <td>${(govProject.dtCreate?string('yyyy-MM-dd HH:mm:ss'))!'--'}</td>
                                    </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="reord_info">
                            <div class="info_title">
                                <span class="icon-shixiangxinxi"></span>
                                <b>事项信息</b>
                                <br style="clear:both">
                            </div>
                            <div class="info_com">
                                <table class="layui-table">
                                    <colgroup>
                                        <col width="30%">
                                        <col width="70%">
                                    </colgroup>
                                    <thead>
                                    </thead>

                                    <tbody>
                                    <tr>
                                        <td style="text-align: right; background: #ebf5ff">事项信息</td>
                                        <td>${(govProject.projectTitle)!}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="reord_info">
                            <div class="info_title">
                                <span class="icon-chulibumen"></span>
                                <b>处理部门</b>
                                <br style="clear:both">
                            </div>
                            <div class="info_com">
                                <table class="layui-table">
                                    <colgroup>
                                        <col width="30%">
                                        <col width="70%">
                                    </colgroup>
                                    <thead>
                                    </thead>

                                    <tbody>
                                    <tr>
                                        <td style="text-align: right; background: #ebf5ff">处理部门</td>
                                        <td>${(sysOrg.name)}</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; background: #ebf5ff">行政区域</td>
                                        <td>${(city.name)!} ${(stree.name)!} ${(community.name)!}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="reord_info">
                            <div class="info_title">
                                <span class="icon-yonghuxinx"></span>
                                <b>用户信息</b>
                                <br style="clear:both">
                            </div>
                            <div class="info_com">
                                <table class="layui-table">
                                    <colgroup>
                                        <col width="30%">
                                        <col width="70%">
                                    </colgroup>
                                    <thead>
                                    </thead>

                                    <tbody>
                                    <tr>
                                        <td style="text-align: right; background: #ebf5ff">姓名</td>
                                        <td>${(appUser.username)!''}</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; background: #ebf5ff">手机号</td>
                                        <td>${(appUser.mobile)!''}</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; background: #ebf5ff">身份证号码</td>
                                        <td>${(appUser.idCard)!''}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="reord_info">
                            <div class="info_title">
                                <span class="icon-cailaoxinxi"></span>
                                <b>材料信息</b>
                                <br style="clear:both">
                            </div>
                            <div class="info_com">
                                <table class="layui-table">
                                    <tbody>
                                    <#list inputList as ma>
                                        <#if ma.valueStr !="">
                                    <tr>
                                        <td>${(ma.name)}：${(ma.valueStr)!}</td>
                                    </tr>
                                        </#if>
                                    </#list>
                                    <#list imageList as fi>
                                        <tr>
                                            <td>${(fi.name)}：<br/>
                                        <#list fi.value as files>
                                            <img width="20%" data-preview-src="${(files.materialValue)!'--'}"
                                                 data-preview-group="1"
                                                 class="imgdow"
                                                 src="${(files.materialValue)!'--'}">
                                        </#list>
                                            </td>
                                        </tr>
                                    </#list>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>



            <#if (audit)??>
                    <div id="shenhelisi" style="display: none;"><!-- 审核历史 -->
                        <div class="content">
                            <article>
                                <#list auditList as list>
                                    <section>
                                        <span class="<#if list.result==0>point-time point-red <#else >point-times</#if>"></span>
                                        <time datetime="2013-03">
                                            <span>${(list.dtCreate?string('yyyy-MM-dd HH:mm:ss'))!'--'}</span>
                                        </time>
                                        <aside>
                                            <div style="">
                                                <table class="layui-table">
                                                    <colgroup>
                                                        <col width="30%">
                                                        <col width="70%">
                                                    </colgroup>
                                                    <tbody>
                                                    <tr>
                                                        <td style="text-align: right; background: #ebf5ff">审核人</td>
                                                        <td>${(list.username)}</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right; background: #ebf5ff">结果</td>
                                                        <td style="color: <#if list.result==0> #f6393f <#else>#1c87bf</#if>"><#if list.result==0>
                                                            不通过  <#else >通过 </#if></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right; background: #ebf5ff">意见</td>
                                                        <td>${(list.reason)!"--"}</td>
                                                    </tr>
                                                      <#if (list.materiaList) ?? >
                                                        <tr>
                                                            <td style="text-align: right; background: #ebf5ff">材料</td>
                                                            <td><#list list.materiaList as materiaList>
                                                                <@commonTags method="getFileSuffix" type="1" value="${(materiaList.materialsUrl)!'--'}">
                                                                    <#if getFileSuffix==0>
                                                                    <img
                                                                            data-preview-src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(materiaList.materialsUrl)!'--'}"
                                                                            data-preview-group="2"
                                                                            src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(materiaList.materialsUrl)!'--'}"
                                                                    >
                                                                    <#else >
                                                                     <img class="imgdows"
                                                                          src="../../../images/default.png">
                                                                    </#if>
                                                                </@>
                                                            </#list>
                                                                ${(list.reason)!"--"}</td>
                                                        </tr>
                                                      </#if>
                                                    </tbody>
                                                </table>

                                            </div>
                                        </aside>
                                    </section>
                                </#list>

                            </article>
                        </div>
                    </div><!-- 审核历史结束 -->
            <#else >
             <div id="shenhelisi" style="display: none;"><!-- 无数据图片 -->
                 <div class="content">
                     <div>
                         <img style="width: 100%" src="/images/h5/empty.png">

                     </div>
                 </div>
             </div>
            </#if>

                    <div id="banshilishi" style="display: none;"><!-- 办事历史 -->
                        <div class="content">
                            <article>
                                <section>
                                    <span class="point-time point-times"></span>
                                    <time datetime="2013-03">
                                        <span>提交材料</span>
                                    </time>
                                    <aside>
                                        <p class="things">${(appUser.username)}</p>
                                        <p class="brief">提交时间<span
                                                class="text-blue">${(entity.dtCreate?string('yyyy-MM-dd HH:mm:ss'))!'--'}</span>
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
                    </div><!-- 办事历结束-->

            <#if msga=1>
                    <div id="xiaoxiliebiao" style="display: none;"><!-- 消息列表 -->
                        <div class="reord_info">
                            <div class="info_com">

                                <table class="layui-table">
                                    <colgroup>
                                        <col width="25%">
                                        <col width="50%">
                                        <col width="25%">
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
                        </div>

                    </div><!-- 消息列表结束 -->
            <#else >
             <div id="xiaoxiliebiao" style="display: none;"><!-- 无数据图片 -->
                 <div class="content">
                     <div>
                         <img style="width: 100%" src="/images/h5/empty.png">

                     </div>
                 </div>
             </div>
            </#if>
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

                    <!-- 审核-->
                      <#if entity.recordStatus==1>
                    <div class="reord_info submit_record">
                        <div class="yueor">
                            <div class="info_title">
                                <span class="icon-shenhe"></span>
                                <b>审核</b>
                                <br style="clear:both">
                            </div>
                          <div class="info_com">
                              <form class="form-horizontal" id="form-recird" method="post"
                                    action="/appc/tGovProjectAudit/doAdd"
                              ">
                              <input type="hidden" name="type" value="1">
                              <input type="hidden" id="recordId" name="recordId" value="${(recordId)!}">
                              <input type="hidden" id="materialsFlag" name="materialsFlag"
                                     value="${(materialsFlag)!}">
                              <table class="layui-table">
                                  <colgroup>
                                      <col width="30%">
                                      <col width="70%">
                                  </colgroup>
                                  <tbody>
                                  <tr>
                                      <td style="text-align: right; background: #ebf5ff">审核</td>
                                      <td>
                                          <div class="mui-input-row mui-radio">
                                              <label>通过</label>
                                              <input name="result" type="radio" checked value="1">
                                          </div>
                                          <div class="mui-input-row mui-radio">
                                              <label>不通过</label>
                                              <input name="result" type="radio" value="0">
                                          </div>
                                      </td>
                                  </tr>
                                  <#--<tr>-->
                                  <#--<td style="text-align: right; background: #ebf5ff">审核结果</td>-->
                                  <#--<td>通过</td>-->
                                  <#--</tr>-->
                                  <tr>
                                      <td style="text-align: right; background: #ebf5ff">常用意见</td>
                                      <td>
                                          <div class="mui-input-row">
                                              <select name="orgId" id="orgId" class="mui-h5"
                                                      style="margin:auto; color:#000;">
                                                  <option value="">选择常用意见</option>
                                                        <#list frequentlyList as lylist>
                                                           <option value="${(lylist.content)!}">${(lylist.content)!}</option>
                                                        </#list>

                                              </select>
                                          </div>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td style="text-align: right; background: #ebf5ff">意见</td>
                                      <td>
                                          <textarea name="reason" id="reason" class="texta"></textarea>
                                      </td>
                                  </tr>
                                  </tbody>
                              </table>
                              <div class="open_submit">
                                  <button type="submit">提交</button>
                              </div>
                              </form>
                          </div>
                          <!-- 审核结束 -->
                      </#if>
                </div>
                </div>
                    <div class="kong">

                    </div>


                </div>
            </div>
        </div>
    </div>
</div>
<button type="submit" style="z-index:9999;" class="btn btn-block" onclick="goBack()">返回</button>
</body>
<script type="text/javascript">

    mui.init({
        statusBarBackground: '#f7f7f7'

    });
    mui('body').on('tap', 'a', function () {
        window.top.location.href = this.href;
    });

    mui('.elsease').on('tap', 'b', function () {
        $(this).addClass("pitch_on").siblings().removeClass("pitch_on");
        var index = $(this).index();
        if (index == 0) {
            $("#shenhexinxi").css({'display': 'block'});
            $("#shenhelisi").css({'display': 'none'});
            $("#banshilishi").css({'display': 'none'});
            $("#xiaoxiliebiao").css({'display': 'none'});
        } else if (index == 1) {
            $("#shenhelisi").css({'display': 'block'});
            $("#shenhexinxi").css({'display': 'none'});
            $("#banshilishi").css({'display': 'none'});
            $("#xiaoxiliebiao").css({'display': 'none'});
        } else if (index == 2) {
            $("#banshilishi").css({'display': 'block'});
            $("#shenhelisi").css({'display': 'none'});
            $("#shenhexinxi").css({'display': 'none'});
            $("#xiaoxiliebiao").css({'display': 'none'});
        } else if (index == 3) {
            $("#xiaoxiliebiao").css({'display': 'block'});
            $("#banshilishi").css({'display': 'none'});
            $("#shenhelisi").css({'display': 'none'});
            $("#shenhexinxi").css({'display': 'none'});
        }
    });

    $('#orgId').change(function () {
        var data = $(this).val();
        $("#reason").val(data);
    });

</script>
<script src="/app/js/modules/zoom.js"></script>
<#--<script src="/app/js/modules/boxImg.js"></script>-->
<script src="/base/js/mui.previewimage.js"></script>
<script src="/base/js/mui.zoom.js"></script>
<script>
    mui.previewImage();

    function goBack() {
        window.location.href = "/h5App/gotoTaskApp";
    }

    var spin_n = 0;
    mui('body').on('tap', '.tuiioer', function () {
        spin_n += 90;
        $(".fer").css({
            "transform": "rotate(" + spin_n + "deg)",
            "-moz-transform": "rotate(" + spin_n + "deg)",
            "-ms-transform": "rotate(" + spin_n + "deg)",
            "-o-transform": "rotate(" + spin_n + "deg)",
            "-webkit-transform": "rotate(" + spin_n + "deg)"
        });
    });
</script>
</html>