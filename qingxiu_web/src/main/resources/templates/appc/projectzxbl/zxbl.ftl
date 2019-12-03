<#include "../../common/layout.ftl">
<@header>
 <link href="/app/css/zxbl.css" rel="stylesheet"/>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1 style="display: initial;">
            <small>手上青秀 > 在线办理</small>
        </h1>
        <div class="input-group pull-right">
        <button type="button" class="btn btn-primary" onclick="javasript:history.back(-1)">
            <i class="fa fa-backward"></i>
            返 回
        </button>
        </div>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-body table-responsive no-padding">
                        <div class="grbs_right_center_con xzsp">
                        <div class="subpageDIV6">
                            <div class="jeiguoTitle"> <span class="titleName fl">政务服务事项</span> </div>


                            <div class="zixunDiv1">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tbody>
                                    <tr>
                                        <td colspan="2"><b>事项名称：</b><font class="tableTitle">计划生育审核-实行计划生育的职工退休增加退休金5%、10%证明</font></td>
                                    </tr>
                                    <tr>
                                        <td width="50%"><b>实施机构：</b><span> 卫健局 </span></td>
                                        <td><b>受理部门编号：</b><span>Nnqxq-Gsc-Org-2008-1</span></td>
                                    </tr>
                                    <tr>
                                        <td><b>事项类型：</b><span></span></td>
                                        <td><b>法定办结时限：</b><span>
												0
												<label style="margin-left: 10px;">
													工作日
												</label>
                                            </label>
                       </span></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><b>服务对象：</b><span>青秀区辖区范围内退休时符合国家提倡一对夫妻生育一个子女期间实行计划生育的公民。
                      </span></td>
                                    </tr>
                                    <tr>
                                        <td><b>承诺办结时限：</b>0  <label style="margin-left: 10px;"> 工作日<span>
                       </span></td>
                                        <td><b>是否收费：</b><span>
                      不收费
					   </span></td>
                                    </tr>
                                    <tr>
                                        <td><b>预审天数：</b><span> 3
                       <label style="margin-left: 10px;"> 工作日 </label>
                       </span></td>
                                        <td><b>办件类型：</b><span>
											即办件</span></td>
                                    </tr>
                                    <tr>

                                        <td ><b>办理时间：</b><span>工作日：上午9:00-12:00、下午13:30-16:30</span></td>
                                        <td ><b>咨询电话：</b><span>
                     0771—5826901、5826902
                    </span></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><b>备注信息：</b><span></span></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><b>申请说明：</b>
                                            <input name="btn1"  class="sqsmbt" type="button" value="办事指南" onclick="redirectGuideInfo('Gx-Gsc-App-270738-636827159570000000','Gx-Gsc-OrgApp-267150-636827159570000000');" />
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div class="heigth10"></div>
                        </div>
                        <form method="post" id="projBasicInfoForm" enctype="multipart/form-data">
                            <input type="hidden" name="approveId" value="313098">
                            <input type="hidden" name="gscOrgAppId" value="308456">
                            <input type="hidden" name="approveProjectCodeId" value="Gx-Gsc-App-270738-636827159570000000">
                            <input type="hidden" name="gscOrgAppCodeId" value="Gx-Gsc-OrgApp-267150-636827159570000000">
                            <input name="objUserName" id="objUserName" type="hidden" value="刘贵成">
                            <input type="hidden" name="fileInfo" id="fileInfo">
                            <input type="hidden" name="randCode" id="randCode" value="cf54894b-619f-4c85-9f04-fd62b73f2497">

                            <!-- 个人 -->

                            <div class="subpageDIV6">
                                <div class="jeiguoTitle"> <span class="titleName fl">申请人信息</span> </div>
                                <table class="sqxx">
                                    <tbody>
                                    <tr>
                                        <td width="10%" align="right"> 申请人类型: </td>
                                        <td colspan="3">
                                            <select name="">
                                                <option value="0">自然人</option>
                                                <option value="1">法人</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td  align="right" width="10%"> 姓名： </td>
                                        <td  width="40%"><input type="text"  readonly="readonly" value="" class="lin"><label> * </label></td>
                                        <!-- 自然人 -->
                                        <td  align="right" width="10%"> 性别： </td>
                                        <td  >
                                            <input type="text"  readonly="readonly" value="" class="lin"><label> * </label>
                                            <input name="objSexCode" id="objSexCode"  type="hidden"  value='GscUserSex_Male' />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right"> 身份证号： </td>
                                        <td><input name="objUserIdCardNum" id="objUserIdCardNum" readonly datatype="Require" msg="身份证号不能为空！" value="" type="text" class="lin"><label> * </label></td>
                                        <td align="right"> 手机号： </td>
                                        <td><input name="objUserMobileTel" id="objUserMobileTel" datatype="Require" msg="手机号不能为空！" value="" type="text" class="lin"><label> * </label></td>
                                    </tr>
                                    <tr>
                                        <td align="right"> 邮箱： </td>
                                        <td><input name="objOrganEmail" id="objOrganEmail" type="text" value=""  class="lin"></td>
                                        <td align="right"> 电话： </td>
                                        <td><input name="objUserLinkTel" id="objUserLinkTel" type="text" value="" msg="电话不能为空！" class="lin"></td>
                                    </tr>
                                    <tr>
                                        <td align="right"> 通讯地址： </td>
                                        <td ><input type="text" name="objUserAddress" id="objUserAddress" value=""  class="lin"></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!-- 材料附件 -->
                            <div class="subpageDIV6 border1 marginTop">
                                <div class="jeiguoTitle"> <span class="titleName fl">应交材料</span> </div>
                                <table border="0" cellspacing="0" cellpadding="0" class="table-result">
                                    <tbody>
                                    <tr>
                                        <th width="40%"> 应交材料名称 </th>
                                        <th width="5%"> 是否容缺 </th>
                                        <th >&nbsp; </th>
                                    </tr>

                                    <tr>
                                        <td width="40%">
                                            申请表
                                            <!--  1105798-->
                                            <label style="color: red;">* </label>
                                            <input type="hidden" name="datumId" id="attachmentId1" isDefect="0" datumName="申请表" datumNo="1" value="">
                                        </td>
                                        <td >否</td>
                                        <td>
                                            <table id="uploadTable1" style="margin-left: 10px;    float: left;" cellspacing="10">
                                                <tr height="50px">

                                                    <td id="singleTd1">
                                                        <div id="single_file1"></div>
                                                    </td>
                                                    <td id="uploadBtnTd1">
                                                    </td>
                                                    <td id="showRtd1">
                                                        <div id="showDiv1" style="white-space: nowrap;"></div>
                                                    </td>
                                                    <td id="uploadTd1">
                                                        <div class="layui-row">
                                                            <div class="layui-col-md9">
                                                                <input type="file" name="uploadFile1105798"
                                                                       id="uploadFile1" />
                                                            </div>
                                                            <div class="layui-col-md3">
                                                                <input name="btn1"  class="sqsmbt" type="button" value="在线填表" onclick="" />
                                                            </div>
                                                        </div>
                                                    </td>

                                                </tr>
                                                <tr>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="heigth10"></div>
                            </div>

                        </form>
                        <!-- 提交按钮 -->
                        <div class="subButtom marginTop">
                            <input name="button1" onclick="ondosubmit();" type="button" id="submitBtn" value="提 交">
                        </div>
                    </div>
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div>
        </div>
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</@body>
<@footer>
<script type="application/javascript">
    function ondosubmit() {
        window.location.href="/appc/tGovProjectAudit/doOnlineProcessing";
    }
</script>
</@footer>