<#include "../../common/layout.ftl">
<@header>
<link rel="stylesheet" href="/plugins/bootstrap-fileinput/css/fileinput.css">
<link rel="stylesheet" href="/app/css/formSelects.css">
<link rel="stylesheet" href="/plugins/video-7.5.5/css/video-js.min.css">
<script src="/plugins/video-7.5.5/video.min.js"></script>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>活动管理 > <a href="/activity/tActivityEnroll/list/1">报名管理</a> >审核上架</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <form id="submit-form" class="form-horizontal layui-form layui-form-pane" method="post"
             <#if (entity.id)??> action="/activity/tActivityEnroll/doApprove"</#if>>
            <input type="hidden" id="id" name="id" value="${(entity.id)}"/>
            <input type="hidden" id="approveStatus" name="approveStatus"/>
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="group" class="col-sm-2 control-label">分组</label>
                                <div class="col-sm-4">
                                    <p class="form-control">${(entity.workGroup)!}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="workName" class="col-sm-2 control-label">作品名称</label>
                                <div class="col-sm-4">
                                    <p class="form-control">${(entity.workName)!}</p>
                                </div>
                                <label for="workClass" class="col-sm-2 control-label">作品分类</label>
                                <div class="col-sm-4">
                                    <p class="form-control">${(entity.workClass)!}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="name" class="col-sm-2 control-label">作者姓名</label>
                                <div class="col-sm-4">
                                    <p class="form-control">${(entity.name)!}</p>
                                </div>
                                <label for="gender" class="col-sm-2 control-label">性别</label>
                                <div class="col-sm-4">
                                    <p class="form-control">
                                        <@dictTag method="dictValueByType" type="gender_type" value="${(entity.gender)!}"> ${(dictValueByType)!}</@dictTag>
                                    </p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="age" class="col-sm-2 control-label">年龄</label>
                                <div class="col-sm-4">
                                    <p class="form-control">${(entity.age)!}</p>
                                </div>
                                <label for="phone" class="col-sm-2 control-label">联系方式</label>
                                <div class="col-sm-4">
                                    <p class="form-control">${(entity.phone)!}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="affiliation" class="col-sm-2 control-label">所属学校（或机构）</label>
                                <div class="col-sm-4">
                                    <p class="form-control">${(entity.affiliation)!}</p>
                                </div>
                                <label for="instructor" class="col-sm-2 control-label">指导老师</label>
                                <div class="col-sm-4">
                                    <p class="form-control">${(entity.instructor)!}</p>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="workDescription" class="col-sm-2 control-label">作品阐述</label>
                                <div class="col-sm-10">
                                    <textarea class="form-control" rows="5" disabled style="background-color: white;">${(entity.workDescription)!}</textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="workPath" class="col-sm-2 control-label">作品上传（图片或视频）</label>
                                <div class="col-sm-10" >
                                    <#if "${(entity.workPath)!}"?index_of(".mp4")!=-1
                                    ||"${(entity.workPath)!}"?index_of(".MP4")!=-1
                                    ||"${(entity.workPath)!}"?index_of(".mov")!=-1
                                    ||"${(entity.workPath)!}"?index_of(".MOV")!=-1
                                    >
                                        <video id="my-video" class="video-js vjs-default-skin vjs-big-play-centered"
                                               controls preload="auto" width="440" height="264"
                                               poster="http://video-js.zencoder.com/oceans-clip.png"
                                               data-setup='{"example_option":true}'>
                                            <source src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(entity.workPath)!}"
                                                    type='video/mp4'/>
                                            <source src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(entity.workPath)!}"
                                                    type='video/mov'/>
                                        </video>
                                    <#else >
                                        <div id="layer-photos" class="layer-photos-demo">
                                            <#list '${(entity.workPath)!}'?split(",") as path>
                                                <div style="display: inline-block">
                                                    <img layer-pid=""
                                                         layer-src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${path}"
                                                         src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${path}"
                                                         width="164" height="164"
                                                         onclick="viewImage()"
                                                         alt="">
                                                </div>
                                            </#list>
                                        </div>
                                    </#if>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">审核：</label>
                            </div>
                            <div class="recoerd_matter">
                            <#--<span class="shenhe"></span>-->
                            <#--<b>审核：</b>-->
                            <#--<br style='clear:both'/>-->
                                <label for="workPath" class="col-sm-1 control-label"></label>
                                <div class="tab_cls col-sm-11">
                                    <table class="layui-table">
                                        <colgroup>
                                            <col width="10%">
                                            <col width="93%">
                                        </colgroup>
                                        <tbody>
                                        <tr>
                                            <td style="text-align: right; background: #ebf5ff">是否通过</td>
                                            <td style="background: #fff">
                                                <input type="radio" name="approveStatus" title="通过" value="1"
                                                       lay-filter="erweima"
                                                       <#if entity.approveStatus??&&entity.approveStatus==1>checked</#if> >
                                                <input type="radio" name="approveStatus" title="不通过" value="0"
                                                       lay-filter="erweima"
                                                       <#if entity.approveStatus??&&entity.approveStatus==0>checked</#if>>
                                            </td>
                                        </tr>
                                        <tr id="reason_tr"
                                            <#if entity.approveStatus??&&entity.approveStatus==1>style="display: none"</#if>>
                                            <td style="text-align: right; background: #ebf5ff">理由</td>
                                            <td style="background: #fff">
                                                <textarea name="reason" id="reason" class="textar-remark form-control"
                                                          style="width: -webkit-fill-available;"></textarea>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
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
<script src="/plugins/video-7.5.5/zh-cn.js"></script>
<script>
    videojs.options.flash.swf = "video-js.swf";
    var myPlayer = videojs('my-video');
    myPlayer.on("firstplay", function () {
        myPlayer.width(840);
        myPlayer.height(420);
    });
    layui.use('form', function () {
        var form = layui.form;
        form.render(); // 加入这一句
        //单选框点击事件（括号里边是lay-filter的值）
        form.on('radio(erweima)', function (data) {
            if (data.value == 0) {
                $('#reason_tr').show();
                $('#reason').attr('lay-verify', 'required');
            } else if (data.value == 1) {
                $('#reason_tr').hide();
                $('#reason').removeAttr('lay-verify');
            }
        });
    });
    function viewImage() {
        layer.photos({
            photos: '#layer-photos'
            ,shift: 5 //0-6的选择，指定弹出图片动画类型，默认随机
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