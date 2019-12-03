<#include "../../common/layout.ftl">
<@header>
<link rel="stylesheet" href="/plugins/bootstrap-fileinput/css/fileinput.css">
<link rel="stylesheet" href="/app/css/formSelects.css">
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>手上青秀 > 事项基础库
            <#--<#if (entity.serviceType)??>-->
            <#--<@dictTag method="dictValueByType" type="service_type"value="${entity.serviceType!}"> ${(dictValueByType)!}</@dictTag>-->
            <#--<#else>-->
            <#--<@dictTag method="dictValueByType" type="service_type" value="${serviceType!}"> ${(dictValueByType)!}</@dictTag>-->
            <#--</#if>-->
                > 添加/编辑
            </small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <form class="form-horizontal layui-form layui-form-pane" method="post"
              <#if (entity.id)??>action="/appc/tGovProject/doEdit"<#else>action="/appc/tGovProject/doAdd"</#if>>
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-body">
                            <input type="hidden" name="serviceType"
                                   <#if (entity.serviceType)??>value="${(entity.serviceType)}"
                                   <#else>value="${serviceType}"</#if>/>
                            <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
                            <div class="form-group">
                                <label for="projectTitle" class="col-sm-2 control-label">事项名称<span
                                        class="xing_red"> *</span>
                                </label>
                                <div class="col-sm-4">
                                    <input type="text" id="projectTitle" name="projectTitle"
                                           value="${(entity.projectTitle)!}" class="form-control" placeholder="请输入事项名称"
                                           maxlength="100"/>
                                </div>
                                <label for="projectType" class="col-sm-2 control-label">事项类型</label>
                                <div class="col-sm-4">
                                    <input type="text" id="projectType" name="projectType"
                                           value="${(entity.projectType)!}" class="form-control"
                                           placeholder="请输入事项类型"
                                    />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="baseCode" class="col-sm-2 control-label">基本编码<span
                                        class="xing_red"> *</span></label>
                                <div class="col-sm-4">
                                    <input type="text" id="baseCode" name="baseCode" value="${(entity.baseCode)!}"
                                           class="form-control"
                                           placeholder="请输入基本编码" lay-verify="required"/>
                                </div>
                                <label for="presentCount" class="col-sm-2 control-label">到场次数</label>
                                <div class="col-sm-4">
                                    <input type="text" id="presentCount" name="presentCount"
                                           value="${(entity.presentCount)!}"
                                           class="form-control" placeholder="请输入到场次数"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="processCode" class="col-sm-2 control-label">服务类型<span
                                        class="xing_red"> *</span></label>
                                <div class="col-sm-4">
                                    <select id="serviceType" name="serviceType" class="form-control select2"
                                            lay-ignore
                                            style="width: 100%;"
                                            lay-verify="required">
                                        <option value="" disabled selected>--请选择服务类型--</option>
                                        <@dictTag method="getDictListByType" type="service_type" >
                                            <#list getDictListByType as m>
                                                <option value="${(m.value)!}"
                                                    <#if "${(m.value)!}"=="${(entity.serviceType)!}">
                                                        selected
                                                    </#if>
                                                >${(m.label)!}</option>
                                            </#list>
                                        </@dictTag>
                                    </select>
                                </div>
                                <label for="acceptTolerance" class="col-sm-2 control-label">容缺受理</label>
                                <div class="col-sm-4">
                                    <label>
                                        <input name="acceptTolerance" type="radio" class="minimal" value="是"
                                               <#if (entity.acceptTolerance)??&&"${(entity.acceptTolerance)}"=="是">checked</#if>
                                               lay-ignore>是
                                    </label>
                                    <label>
                                        <input name="acceptTolerance" type="radio" class="minimal" value="否"
                                               <#if (entity.acceptTolerance)??&&"${(entity.acceptTolerance)}"=="否">checked</#if>
                                               lay-ignore>否
                                    </label>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="powerSource" class="col-sm-2 control-label">权力来源</label>
                                <div class="col-sm-4">
                                    <input type="text" id="powerSource" name="powerSource"
                                           value="${(entity.powerSource)!}" class="form-control" placeholder="请输入权力来源"
                                    />
                                </div>
                                <label for="toleranceTime" class="col-sm-2 control-label">容缺时限</label>
                                <div class="col-sm-4">
                                    <input type="text" id="toleranceTime" name="toleranceTime"
                                           value="${(entity.toleranceTime)!}" class="form-control" placeholder="请输入容缺时限"
                                    />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="projectThemeId" class="col-sm-2 control-label">事项主题</label>
                                <div class="col-sm-4">
                                    <input type="hidden" id="projectThemeId" name="projectThemeId"
                                           value="${(entity.projectThemeId)!}"/>
                                    <select id="selectTheme" class="form-control select2"
                                            lay-ignore
                                            multiple="multiple"
                                            size="3"
                                            style="width: 100%;">
                                            <#list themeList as m>
                                                <option value="${(m.id)!}"
                                                        <#if (m.isSelected)>selected</#if>>${(m.themeTitle)!}</option>
                                            </#list>
                                    </select>
                                </div>
                                <label for="toleranceAllowance" class="col-sm-2 control-label">容缺补正方式</label>
                                <div class="col-sm-4">
                                    <input type="text" id="toleranceAllowance" name="toleranceAllowance"
                                           value="${(entity.toleranceAllowance)!}" class="form-control"
                                           placeholder="请输入容缺补正方式"
                                    />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="applyMethod" class="col-sm-2 control-label">申请方式</label>
                                <div class="col-sm-4">
                                    <input type="text" id="applyMethod" name="applyMethod"
                                           value="${(entity.applyMethod)!}"
                                           class="form-control" placeholder="请输入申请方式"/>
                                </div>
                                <label for="processType" class="col-sm-2 control-label">办理形式</label>
                                <div class="col-sm-4">
                                    <input type="text" id="processType" name="processType"
                                           value="${(entity.processType)!}" class="form-control" placeholder="请输入办理形式"
                                    />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="applyObject" class="col-sm-2 control-label">实施对象</label>
                                <div class="col-sm-10">
                                    <textarea type="text" id="applyObject" name="applyObject" rows="3"
                                              class="form-control"
                                              placeholder="请输入申请主体">${(entity.applyObject)!}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="serviceObject" class="col-sm-2 control-label">实施对象性质<span
                                        class="xing_red"> *</span>
                                </label>
                                <div class="col-sm-4">
                                    <input type="text" id="serviceObject" name="serviceObject"
                                           value="${(entity.serviceObject)!}"
                                           class="form-control" placeholder="请输入服务对象" lay-verify="required"
                                           maxlength="130"/>
                                </div>
                                <label for="projectType" class="col-sm-2 control-label">
                                    办件类型<span class="xing_red"> *</span>
                                </label>
                                <div class="col-sm-4">
                                         <@dictTag method="getDictListByType" type="project_type" >
                                             <#list getDictListByType as m>
                                                 <label>
                                                     <input name="officeType" type="radio" class="minimal"
                                                            <#if "${(m.value)!}"=="${(entity.officeType)!}">
                                                                checked
                                                            <#elseif !entity.officeType??>
                                                                checked
                                                            </#if>
                                                            value="${(m.value)!}"
                                                            lay-ignore> ${(m.label)!}
                                                 </label>
                                             </#list>
                                         </@dictTag>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="applyHierarchy" class="col-sm-2 control-label">行使层级</label>
                                <div class="col-sm-4">
                                    <input type="text" id="applyHierarchy" name="applyHierarchy"
                                           value="${(entity.applyHierarchy)!}" class="form-control"
                                           placeholder="请输入行使层级"
                                    />
                                </div>
                                <label for="processRange" class="col-sm-2 control-label">通办范围</label>
                                <div class="col-sm-4">
                                    <input type="text" id="processRange" name="processRange"
                                           value="${(entity.processRange)!}" class="form-control" placeholder="请输入通办范围"
                                    />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="maxCount" class="col-sm-2 control-label">数量限制<span
                                        class="xing_red"> *</span>
                                </label>
                                <div class="col-sm-4">
                                    <input type="text" id="maxCount" name="maxCount" value="${(entity.maxCount)!}"
                                           class="form-control"
                                           placeholder="请输入数量限制" lay-verify="required"/>
                                </div>
                                <label for="processPublicity" class="col-sm-2 control-label">办理公示</label>
                                <div class="col-sm-4">
                                    <input type="text" id="processPublicity" name="processPublicity"
                                           value="${(entity.processPublicity)!}" class="form-control"
                                           placeholder="请输入办理公示"
                                    />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="yearlyInspection" class="col-sm-2 control-label">年检或年审</label>
                                <div class="col-sm-4">
                                    <input type="text" id="yearlyInspection" name="yearlyInspection"
                                           value="${(entity.yearlyInspection)!}" class="form-control"
                                           placeholder="请输入年检或年审"
                                    />
                                </div>
                                <label for="processProgressInquiries" class="col-sm-2 control-label">进度查询网址</label>
                                <div class="col-sm-4">
                                    <input type="text" id="processProgressInquiries" name="processProgressInquiries"
                                           value="${(entity.processProgressInquiries)!}" class="form-control"
                                           placeholder="请输入进度查询网址"
                                    />
                                </div>
                            </div>
                            <!-- 办理网址 -->
                            <div class="form-group">
                                <label for="webAddress" class="col-sm-2 control-label">办理网址</label>
                                <div class="col-sm-4">
                                    <input type="text" id="webAddress" name="webAddress"
                                           value="${(entity.webAddress)!}" class="form-control" placeholder="请输入办理网址"
                                    />
                                </div>
                                <label for="progressInquiriesPhone" class="col-sm-2 control-label">进度咨询电话</label>
                                <div class="col-sm-4">
                                    <input type="text" id="progressInquiriesPhone" name="progressInquiriesPhone"
                                           value="${(entity.progressInquiriesPhone)!}" class="form-control"
                                           placeholder="请输入进度咨询电话"
                                    />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="legalFinishTime" class="col-sm-2 control-label">法定办结时限</label>
                                <div class="col-sm-4">
                                    <input type="text" id="legalFinishTime" name="legalFinishTime"
                                           value="${(entity.legalFinishTime)!}" class="form-control"
                                           placeholder="请输入法定办结时限"
                                    />
                                </div>
                                <label for="processingTime" class="col-sm-2 control-label">承诺办理时限<span
                                        class="xing_red"> *</span>
                                </label>
                                <div class="col-sm-4">
                                    <input type="text" id="processingTime" name="processingTime"
                                           value="${(entity.processingTime)!}"
                                           class="form-control" placeholder="请输入承诺办理时限" lay-verify="required"
                                           maxlength="20"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="acceptResult" class="col-sm-2 control-label">受理结果</label>
                                <div class="col-sm-4">
                                    <input type="text" id="acceptResult" name="acceptResult"
                                           value="${(entity.acceptResult)!}"
                                           class="form-control" placeholder="请输入受理结果"/>
                                </div>
                                <label for="express" class="col-sm-2 control-label">送达方式</label>
                                <div class="col-sm-4">
                                    <input type="text" id="express" name="express" value="${(entity.express)!}"
                                           class="form-control"
                                           placeholder="请输入送达方式"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="applySystem" class="col-sm-2 control-label">增值服务</label>
                                <div class="col-sm-10">
                                    <input type="hidden" id="deliveryTypeinput" name="deliveryType"
                                           value="${(entity.deliveryType)!1}">
                                    <input type="hidden" id="isDeliveryinput" name="isDelivery"
                                           value="${(entity.isDelivery)!0}">
                                    <input type="hidden" id="isCertificateMakinginput" name="isCertificateMaking"
                                           value="${(entity.isCertificateMaking)!0}">
                                    <#if (entity.isDelivery)??>
                                    <input type="checkbox" onclick="onDelivery();" id="isDeliveryId" value="1"
                                           <#if  entity.isDelivery==1>checked</#if> lay-ignore>可配送  </label>&nbsp;
                                        &nbsp;
                                    <input type="checkbox" onclick="onCertificateMaking();" id="isCertificateMakingId"
                                           <#if entity.isCertificateMaking==1>checked</#if> value="1"
                                           lay-ignore>需制证  </label>&nbsp; &nbsp;
                                    <#else >
                                    <input type="checkbox" onclick="onDelivery();" id="isDeliveryId" value="1"
                                           lay-ignore>可配送  </label>&nbsp; &nbsp;
                                    <input type="checkbox" onclick="onCertificateMaking();" id="isCertificateMakingId"
                                           value="1" lay-ignore>需制证  </label>&nbsp; &nbsp;
                                    </#if>
                                    <input type="checkbox" onclick="onDeliveryType();" id="deliveryType" value="0"
                                           <#if entity.deliveryType==0>checked</#if> lay-ignore>上门取件</label>&nbsp;
                                    &nbsp;

                                </div>
                            </div>
                            <!-- 是否可在线办理：0不允许，1允许 -->
                            <div class="form-group">
                                <label for="isAvailableOnline" class="col-sm-2 control-label">是否可在线办理</label>
                                <div class="col-sm-10">
                                    <@dictTag method="getDictListByType" type="project_isAvailableOnline" >
                                        <#list getDictListByType as m>
                                            <label>
                                                <input name="isAvailableOnline" type="radio" class="minimal"
                                                            <#if "${(m.value)!}"=="${(entity.isAvailableOnline)!}">
                                                                checked
                                                            <#elseif !entity.isAvailableOnline??>
                                                                checked
                                                            </#if>
                                                       value="${(m.value)!}"
                                                       lay-ignore> ${(m.label)!}
                                            </label>
                                        </#list>
                                    </@dictTag>
                                </div>
                            </div>
                            <!-- 是否属于优化营商：0不属于，1属于 -->
                            <div class="form-group">
                                <label for="isOptimizationBusiness" class="col-sm-2 control-label">是否属于优化营商</label>
                                <div class="col-sm-10">
                                    <@dictTag method="getDictListByType" type="project_isOptimizationBusiness" >
                                        <#list getDictListByType as m>
                                            <label>
                                                <input name="isOptimizationBusiness" type="radio" class="minimal"
                                                            <#if "${(m.value)!}"=="${(entity.isOptimizationBusiness)!}">
                                                                checked
                                                            <#elseif !entity.isOptimizationBusiness??>
                                                                checked
                                                            </#if>
                                                       value="${(m.value)!}"
                                                       lay-ignore> ${(m.label)!}
                                            </label>
                                        </#list>
                                    </@dictTag>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="applySystem" class="col-sm-2 control-label">运行系统</label>
                                <div class="col-sm-10">
                                    <input type="text" id="applySystem" name="applySystem"
                                           value="${(entity.applySystem)!}" class="form-control" placeholder="请输入运行系统"
                                    />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="chargingStandard" class="col-sm-2 control-label">是否收费</label>
                                <div class="col-sm-4">
                                    <input type="text" id="isCharging" name="isCharging"
                                           value="${(entity.isCharging)!}"
                                           class="form-control" placeholder="请输入收费标准"/>
                                </div>
                                <label for="progressInquiriesPhone" class="col-sm-2 control-label">收费方式</label>
                                <div class="col-sm-4">
                                    <input type="text" id="chargingType" name="chargingType"
                                           value="${(entity.chargingType)!}" class="form-control"
                                           placeholder="请输入收费方式"
                                    />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="chargingStandard" class="col-sm-2 control-label">收费标准</label>
                                <div class="col-sm-10">
                                    <textarea type="text" id="chargingStandard" name="chargingStandard" rows="3"
                                              class="form-control editor_div"
                                              placeholder="请输入收费标准" >${(entity.chargingStandard)!}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="chargingStandard" class="col-sm-2 control-label">收费依据</label>
                                <div class="col-sm-10">
                                    <textarea type="text" id="chargingBase" name="chargingBase" rows="3"
                                              class="form-control editor_div"
                                              placeholder="请输入收费依据" >${(entity.chargingBase)!}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">结果样本</label>
                                <div class="col-sm-10">
                                    <input type="hidden" id="acceptResultSample" name="acceptResultSample"
                                           value="${(entity.acceptResultSample)!}">

                                    <a class="btn btn-primary dialog " href="javascript:;" data-title=" 附件管理"
                                       data-url="/system/accessory/add?fileQuantity=0&vessel=acceptResultSample&classify=acceptResultSample&dict=sys_project"
                                       data-width="1200" data-height="700"><i class="fa fa-plus"></i> 添加附件</a>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="systemLogo" class="col-sm-2 control-label"></label>
                                <div class="col-sm-10">
                                    <ul class="uiisar acceptResultSample_url">

                                    </ul>
                                </div>
                            </div>


                            <div class="form-group">
                                <label for="basis" class="col-sm-2 control-label">设定依据</label>
                                <div class="col-sm-10">
                                    <textarea type="text" id="basis" name="basis" rows="3"
                                              class="form-control editor_div"
                                              placeholder="请输入设定依据" style="height: 200px">${(entity.basis)!}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="qxhf" class="col-sm-2 control-label">权限划分</label>
                                <div class="col-sm-10">
                                    <textarea type="text" id="qxhf" name="qxhf" rows="3"
                                              class="form-control editor_div"
                                              placeholder="请输入权限划分" style="height: 200px"
                                    >${(entity.qxhf)!}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="xsnr" class="col-sm-2 control-label">行使内容</label>
                                <div class="col-sm-10">
                                    <textarea type="text" id="xsnr" name="xsnr" rows="3" class="form-control editor_div"
                                              placeholder="请输入行使内容" style="height: 200px"
                                    >${(entity.xsnr)!}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="condition" class="col-sm-2 control-label">实施条件</label>
                                <div class="col-sm-10">
                                    <textarea type="text" id="condition" name="condition" rows="3"
                                              class="form-control editor_div"
                                              placeholder="请输入实施条件"
                                              style="height: 200px">${(entity.condition)!}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="scfsjbz" class="col-sm-2 control-label">审查方式及标准</label>
                                <div class="col-sm-10">
                                    <textarea type="text" id="scfsjbz" name="scfsjbz" class="form-control editor_div"
                                              placeholder="请输入审查方式及标准" style="height: 200px"
                                    >${(entity.scfsjbz)!}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="cjwtjzysx" class="col-sm-2 control-label">常见问题及注意事项</label>
                                <div class="col-sm-10">
                                    <textarea type="text" id="cjwtjzysx" name="cjwtjzysx"
                                              class="form-control editor_div"
                                              placeholder="请输入常见问题及注意事项" style="height: 200px"
                                    >${(entity.cjwtjzysx)!}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="zrsx" class="col-sm-2 control-label">责任事项</label>
                                <div class="col-sm-10">
                                    <textarea type="text" id="zrsx" name="zrsx" class="form-control editor_div"
                                              placeholder="请输入责任事项" style="height: 200px"
                                    >${(entity.zrsx)!}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="zzqx" class="col-sm-2 control-label">追责情形</label>
                                <div class="col-sm-10">
                                    <textarea type="text" id="zzqx" name="zzqx" class="form-control editor_div"
                                              placeholder="请输入追责情形" style="height: 200px"
                                    >${(entity.zzqx)!}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="xzfy" class="col-sm-2 control-label">行政复议</label>
                                <div class="col-sm-10">
                                    <textarea type="text" id="xzfy" name="xzfy" class="form-control editor_div"
                                              placeholder="请输入行政复议" style="height: 200px"
                                    >${(entity.xzfy)!}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="xzss" class="col-sm-2 control-label">行政诉讼</label>
                                <div class="col-sm-10">
                                    <textarea type="text" id="xzss" name="xzss" class="form-control editor_div"
                                              placeholder="请输入行政诉讼" style="height: 200px"
                                    >${(entity.xzss)!}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="notice" class="col-sm-2 control-label">填报须知</label>
                                <div class="col-sm-10">
                                    <textarea class="form-control editor_div" id="notice" rows="3" name="notice"
                                              style="height: 200px" placeholder="请输入填报须知">${(entity.notice)!}</textarea>
                                </div>
                            </div>
                        <#--<div class="form-group">-->
                        <#--<label for="flowChart" class="col-sm-2 control-label">办理流程图</label>-->
                        <#--<input type="hidden" id="flowChart" name="flowChart" value="${(entity.flowChart)!}">-->
                        <#--<div class="form-group col-sm-10">-->
                        <#--<input name="file" type="file" class="file-loading" id="systemLogo">-->
                        <#--</div>-->
                        <#--</div>-->

                            <div class="form-group">
                                <label for="flowChart" class="col-sm-2 control-label">办理流程图</label>
                                <div class="col-sm-10">
                                    <input type="hidden" id="flowChart" name="flowChart" value="${(entity.flowChart)!}">

                                    <a class="btn btn-primary dialog " href="javascript:;" data-title=" 附件管理"
                                       data-url="/system/accessory/add?fileQuantity=1&vessel=flowChart&classify=flowChart&dict=sys_project"
                                       data-width="1200" data-height="700"><i class="fa fa-plus"></i> 添加附件</a>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="systemLogo" class="col-sm-2 control-label"></label>
                                <div class="col-sm-10">
                                    <ul class="uiisar flowChart_url">
                                         <#if entity.flowChart?? && entity.flowChart!="" >
                                             <li>
                                                 <span class="layui-icon  layui-icon-close" name="flowChart"
                                                       test="${(entity.flowChart)!''}">&#x1006;</span>
                                                              <@commonTags method="getFileSuffix" type="1" value="${(entity.flowChart)!'--'}">
                                                                  <#if getFileSuffix==0>
                                                                        <img onclick="advPreviewImg(this)"
                                                                             src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(entity.flowChart)!''}">
                                                                  <#else>.
                                                                         <img onclick="advPreviewImg(this)"
                                                                              class="imgdows"
                                                                              src="../../../images/file_wj.png">
                                                                  </#if>
                                                              </@commonTags>
                                             </li>
                                         </#if>

                                    </ul>
                                </div>
                            </div>


                            <div class="form-group">
                                <label for="isEnabled" class="col-sm-2 control-label">是否可用
                                </label>
                                <div class="col-sm-10">
                                    <@dictTag method="getDictListByType" type="is_enabled" >
                                        <#list getDictListByType as m>
                                             <label>
                                                 <input name="isEnabled" type="radio" class="minimal"
                                                        <#if "${(m.value)!}"=="${(entity.isEnabled)!}">
                                                                checked
                                                        <#elseif !entity.isEnabled??>
                                                                checked
                                                        </#if>
                                                        value="${(m.value)!}"
                                                        lay-ignore> ${(m.label)!}
                                             </label>
                                        </#list>
                                    </@dictTag>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="agency" class="col-sm-2 control-label">中介公司
                                </label>
                                <div class="col-sm-10">
                                    <select id="project_agency" name="agency" xm-select="select1">
                                        <option value="">----请选择中介公司----</option>
                                        <#if agencyList??>
                                            <#list agencyList as agency>
                                             <option value="${(agency.id)!}">${(agency.name)!}</option>
                                            </#list>
                                        </#if>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-12">
                                    <div style="text-align: center">
                                        <button type="button" class="btn btn-red" onclick="javasript:history.back(-1)">
                                            <i class="fa fa-backward"></i>
                                            返 回
                                        </button>
                                        <button type="submit" class="btn btn-success"
                                                lay-submit lay-filter="submit"><i
                                                class="fa fa-save"></i>
                                            提 交
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div><!-- /.box-body -->
                    </div>
                </div>
            </div>
        </form>
    </section>
</div>
</@body>
<@footer>
<script src="/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
<script src="/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
<script src="/app/js/file-upload.js"></script>
<script src="/app/js/formSelects.js"></script>
<script>


    //事项主题
    $('#selectTheme').on("change", function () {
        var obj = this;
        var themeVal = "";
        for (var i = 0; i < obj.options.length; i++) {
            if (obj.options[i].selected) {
                themeVal += obj.options[i].value + ",";
            }
        }
        $("#projectThemeId").val(themeVal.substring(0, themeVal.length - 1));
    });

    function onDeliveryType() {
        if ($('#deliveryType').is(':checked')) {
            $("#deliveryTypeinput").val(0);
        } else {
            $("#deliveryTypeinput").val(1);
        }
    }

    function onDelivery() {
        if ($('#isDeliveryId').is(':checked')) {
            $("#isDeliveryinput").val(1);
        } else {
            $("#isDeliveryinput").val(0);
        }
    }

    function onCertificateMaking() {
        if ($('#isCertificateMakingId').is(':checked')) {
            $("#isCertificateMakinginput").val(1);
        } else {
            $("#isCertificateMakinginput").val(0);
        }
    }

    $(document).ready(function () {
        jkhae();
        //中介公司默认选择
        initAgencySelect();
    });

    function GetValue(se, obj, id) {
        // var html = "";
        var va = $("#" + obj.vessel).val();
        if (va != "") {
            $("#" + obj.vessel).val(obj.url + "," + va);
        } else {
            $("#" + obj.vessel).val(obj.url);
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
                        '<span class="layui-icon  layui-icon-close" name="' + obj.vessel + '" test="' + obj.url[i] + '">&#x1006;</span>' +
                        '<img onclick="advPreviewImg(this)" src="' + url + '"> ' +
                        '</li>'
            } else {
                html = '<li>' +
                        '<span class="layui-icon  layui-icon-close" name="' + obj.vessel + '" test="' + obj.url[i] + '">&#x1006;</span>' +
                        '<img onclick="advPreviewImg(this)" src="../../../images/file_wj.png"> ' +
                        '</li>'
            }
            if (se == 1) {
                $("." + obj.vessel + "_url").html(html);
                $("#" + obj.vessel).val(obj.url);
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

    $(document).ready(function () {
        var htmls = "";
        var ur = '<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>'
        var imgalist = "${(entity.acceptResultSample)!"-"}";
        if (imgalist != "-" && imgalist != "") {
            var _p = imgalist.split(',');
            for (var j = 0; j < _p.length; j++) {
                var fileName = _p[j].lastIndexOf(".");
                var fileNameLength = _p[j].length;
                var suffix = _p[j].substring(fileName + 1, fileNameLength);//截
                var array = ["JPG", "JPEG", "PNG", "GIF", "jpg", "jpeg", "png", "gif"];
                var index = $.inArray(suffix, array);
                if (index >= 0) {
                    htmls += '<li>' +
                            '<span class="layui-icon  layui-icon-close" name="acceptResultSample"  test="' + _p[j] + '">&#x1006;</span>' +
                            '<img onclick="advPreviewImg(this)" src="' + ur + _p[j] + '"> ' +
                            '</li>'
                } else {
                    htmls += '<li>' +
                            '<span class="layui-icon  layui-icon-close" name="acceptResultSample"  test="' + _p[j] + '">&#x1006;</span>' +
                            '<img onclick="advPreviewImg(this)" src="../../../images/file_wj.png"> ' +
                            '</li>'
                }
                $(".acceptResultSample_url").html(htmls);
            }
        }

        jkhae();
    });

    //设置中介公司默认选中值
    function initAgencySelect(){
        layui.use(['jquery', 'formSelects'], function(){
            console.log("-----initAgencySelect----");
            var agency="${(entity.agency)!}";
            if(agency!=null&&agency.length>0){
                var agencyArr=agency.split(",");
                var formSelects = layui.formSelects;
                formSelects.value('select1', agencyArr);
            }
        });
    }
</script>

<style>
    .uiisar li {
        width: 160px;
        padding: 10px;
        display: -webkit-inline-box;
    }
</style>
</@footer>