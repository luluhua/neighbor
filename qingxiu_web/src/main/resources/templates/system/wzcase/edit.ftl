<#include "../../common/layout.ftl">
<@header>
<link rel="stylesheet" href="/plugins/bootstrap-fileinput/css/fileinput.css">
</@header>
<style type="text/css">


    .wz-body {
        width: 100%;
        margin: auto;
        /*height: -webkit-fill-available;*/
    }

    .wz_title {
        margin: auto;
        width: 90%;
        height: 90px;
    }

    .wz_title > b {
        width: 90%;
        text-align: center;
        display: block;
        font-size: 22px;
        height: 50px;
    }

    .wz_stales {
        float: right;

    }

    .wz_stales > span {
        float: left;
        padding-left: 20px;;
    }

    .wz_postContent {
        width: 90%;
        margin: auto;
        text-indent: 20px;
    }

    .wz-img-video {
        width: 80%;
        margin: auto;
    }

    .wz-img-vido-s {
        width: 50%;
        margin: auto;
    }

    .wz-img-video > .wz-img-vido-s > video {
        width: 50%;
        margin: auto;
    }

    .wz-img-video > .wz-img-vido-s > img {
        width: 50%;
        margin: auto;
        padding: 10px;
    }

    .wz-rely {
        width: 100%;
    }

    .wz-reply-list {
        width: 80%;
        margin: auto;
        border-top: 1px solid #d2d6de;
        margin-top: 20px;
        display: flow-root;
        padding-top: 20px;
    }

    .wz-users {
        width: 15%;
        float: left;
    }

    .wz-connre {
        width: 80%;
        float: left;
    }

    .wz-reply-time {
        float: right;
    }

    .wz-rely-tithi {
        width: 90%;
        margin: auto;
    }

    .wz_reply_div {
        width: 80%;
        margin: auto;
        border-top: 1.5px solid #d2d6de;
        margin-top: 20px;
        display: flow-root;
        padding-top: 20px;
    }

    .ere {
        width: 80%;
        margin: 30px auto;
    }

    .ere img {
        width: 30%;
        margin: auto;
        display: block;
    }

    .submit_fase {
        width: 60%;
        margin: 50px auto;
    }
</style>
<@body>
<div class="content-wrapper">

    <section class="content-header">
        <h1>
            <small>网络问政 > <a href="/system/wzCase/list/1">问政列表</a> > 查看
            </small>
        </h1>
    </section>
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="form-horizontal layui-form layui-form-pane">
                        <div class="wz-body">
                            <div class="wz_title">
                                <b>${(entity.title)!}</b>
                                <div class="wz_stales">
                                    <span>浏览：${(entity.viewsCount1)!}次</span>
                                    <span>处理部门：${(entity.dep)!}</span>
                                    <span>状态：${(entity.statusText)!}</span>
                                    <span>提问时间：${(entity.postDatetime?string('yyyy-MM-dd'))!'--'}</span>
                                    <span>承诺办结时间：${(entity.postDatetime?string('yyyy-MM-dd'))!'--'}</span>

                                </div>
                            </div>
                            <div class="wz_postContent">
                                ${(entity.postContent)!}

                                <div class="wz-img-video">
                                    <div class="wz-img-vido-s">
                                        <#list caseImglist as caseImglist>
                                            <#if caseImglist.classify="mp4">
                                            <video src="${(caseImglist.name)}" controls="controls"></video>
                                            <#else >
                                            <img onclick="advPreviewImg(this)" src="${(caseImglist.name)}">
                                            </#if>

                                        </#list>

                                    </div>
                                </div>
                            </div>

                            <div class="wz-rely-tithi">
                                <b><span style="color: red;">*</span> 回复内容：</b>
                            </div>
                            <div class="ere"
                            <#list replyList as replylist>
                                <div class="wz-reply-list">
                                    <div class="wz-users">
                                        <b>${(replylist.rpUsername)!'--'}</b>
                                    </div>
                                    <div class="wz-connre">
                                        <div class="wz-conn">
                                            <p>${(replylist.rpContent)}</p>
                                        </div>
                                        <div class="wz-reply-time">
                                            <span>${(replylist.rpDatetime?string('yyyy-MM-dd'))!'--'}</span>
                                        </div>
                                    </div>
                                    <#if (replylist.files)??>
                                        <#list replylist.files as files>
                                            <#if files.classify="mp4">
                                            <video src="${(files.name)}" controls="controls"></video>
                                            <#else >
                                            <img onclick="advPreviewImg(this)" src="${(files.name)}">
                                            </#if>
                                        </#list>
                                    </#if>

                                </div>
                            </#list>
                        </div>
                             <@shiro.hasPermission name="doReplyWzCase">
                                    <form id="from" class=" layui-form layui-form-pane" method="post"
                                          action="/system/wzCase/doReplyWzCase">
                                        <div class="wz_reply_div">
                                            <div class="form-group">
                                                <input type="hidden" id="caseId" name="caseId" class="form-control"
                                                       value="${(entity.id)!''}" lay-verify="required">
                                                <input type="hidden" id="dataSource" name="dataSource"
                                                       class="form-control" value="${(entity.dataSource)!''}"
                                                >
                                                <input type="hidden" id="dataSourceId" name="dataSourceId"
                                                       class="form-control" value="${(entity.dataSourceId)!''}"
                                                >
                                                <div class="col-sm-10">
                                                    <a class="btn btn-primary dialog" style="display: none"
                                                       href="javascript:;"
                                                       data-title=" 附件管理" id="jkhaskr"
                                                       data-url="/system/accessory/add?fileQuantity=1&vessel=editor_id&classify=wzcase&dict=wzcase"
                                                       data-width="1200" data-height="700"><i class="fa fa-plus"></i>
                                                        添加附件</a>
                                                    <textarea rows="3" name="rpContent" id="editor_id"
                                                              placeholder="请输入回复内容" lay-verify="required"></textarea>
                                                </div>
                                            </div>

                                            <div class="submit_fase">
                                                <button type="submit" class="btn btn-success" lay-submit
                                                        lay-filter="submit"><i
                                                        class="fa fa-save"></i> 回复
                                                </button>

                                                <a class="btn btn-default" href="javascript:history.back(-1);">
                                                    <i class="fa fa-close"></i>
                                                    取消
                                                </a>
                                            </div>

                                        </div>
                                    </form>
                             </@shiro.hasPermission>

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
    function GetValue(se, obj, id) {
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
                if (obj.vessel == "editor_id") {
                    $("#remoteUrl").val(url);
                }
            } else {
                layer.msg('此处只能插入图片!', {
                    time: 1000,
                    end: function () {
                    }
                })

            }
        }
    }

</script>
</@footer>
