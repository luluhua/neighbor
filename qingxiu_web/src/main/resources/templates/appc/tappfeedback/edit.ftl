<#include "../../common/layout_dl.ftl">
<@header>
<style>
    .system_msg {
        width: 80%;
        margin: auto;
        padding: 16px;
    }

    .u_info {
        width: 50%;
        float: right;
        text-align: end
    }

    .u_info span {
        font-size: 12px;
    }

    .u_info b {
        font-size: 14px;
    }

    .u_img {
        width: 40px;
        height: 40px;
        float: right;
        margin-top: -15px;
    }

    .u_img img {
        width: 40px;
        height: 40px;
        border-radius: 50%;
    }

    .msg_info {
        width: 90%;
        float: right;
        text-align: left;
    }

    .conuia {
        width: 90%;
    }

    .conuia p {
        text-align: right;
        background-color: #CBE8FE;
        padding: 6px 5px 6px 5px;
        float: right;
        border-radius: 3px;
    }

    .user_msg {
        width: 80%;
        padding: 16px;
    }

    .au_img {
        width: 40px;
        height: 40px;
        margin-top: -15px;
        float: left;
        margin-right: 10px;
    }

    .au_img img {
        width: 40px;
        height: 40px;
        border-radius: 50%;
    }

    .au_info {
        width: 100%;
        float: right;

    }

    .ueirj {
        border: 1px solid #C7C9C9;
        border-radius: 3px;
        margin-left: 10%;
        float: left;
    }

    .ueirj p {
        padding: 6px 5px 6px 5px;
        float: left;
    }

    .img_list {
        margin: auto;
        padding: 0 5px 10px 5px;
    }

    .msg_img {
        width: 120px;
        height: 80px;
        float: left;
        overflow: hidden;
    }

    .msg_img img {
        width: 90%;
    }

    .cuiair {
        width: 60%;
        margin: 20px auto;
    }

    .cuiair button {
        width: 60%;
        margin: auto;
    }

    .lianxifangshi {
        padding-left: 10px;
    }

    .lianxifangshi text {
        color: #0C70C4;
    }
</style>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" action="/appc/tAppFeedback/doReply"
>
    <input type="hidden" name="consultId" value="${(entity.id)!}"/>
    <input type="hidden" name="deviceToken" value="${(deviceToken)!}"/>


<#--<div class="form-group">-->
<#--<label for="title" class="col-sm-2 control-label">app设备</label>-->
<#--<div class="col-sm-10" style="padding-top: 7px">-->
<#--${(deviceToken)!}-->
<#--</div>-->
<#--</div>-->
    <div class="form-group">
        <div class="col-sm-1"></div>
        <div class="col-sm-11">

            <div style="padding-top: 10px"></div>
            <div class="chat" id="chat-box" style="overflow: auto; width: auto; height: 400px;padding-top: 20px">
                <#list msgList as m>
                    <#if m.userType=="1">
                        <div class="system_msg">
                            <div class="u_info">
                                <span>
                                    <#if (m.submTime)?string("yyyyMMdd") == .now?string("yyyyMMdd")>
                                        <small><i class="fa fa-clock-o"></i>今天 ${(m.submTime?time)}</small>
                                    <#else>
                                        <small><i
                                                class="fa fa-clock-o"></i>${(m.submTime?string('MM月dd日 HH:mm:ss'))}</small>
                                    </#if>
                                </span>
                                <b> ${(m.username)!'&ensp;'}</b>
                                <div class="u_img">
                                    <img src="../../../images/kefu.jpg">
                                </div>
                            </div>

                            <div class="msg_info">
                                <div class="conuia">
                                    <p>${(m.content)!}
                                    </p>

                                </div>
                            </div>
                            <br style='clear:both'/>
                        </div>
                    <#else >
                    <div class="user_msg">
                        <div class="au_info">
                            <div class="au_img">
                                <img src="../../../images/yoghu.png">
                            </div>
                            <b>${(m.username)!"匿名"}</b>
                            <span>
                                 <#if (m.submTime)?string("yyyyMMdd") == .now?string("yyyyMMdd")>
                                    <small><i
                                            class="fa fa-clock-o"></i>${(m.submTime?time)}</small>
                                 <#else>
                                    <small><i
                                            class="fa fa-clock-o"></i>${(m.submTime?string('MM月dd日 hh:mm:ss'))}
                                    </small>
                                 </#if>
                            </span>
                            <#if (m.information)??>
                            <span class="lianxifangshi">联系方式:<text>${(m.information)!}</text></span>
                            </#if>
                        </div>

                        <div class="au_info">

                            <div class="ueirj">
                                <p>
                                    ${(m.content)!}
                                </p>
                                <br style='clear:both'/>
                                <#if (m.imgs)??>
                                <div class="img_list">
                                    <#list m.imgs as imglist>
                                        <div class="msg_img">
                                            <img onclick="advPreviewImg(this)"
                                                 src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(imglist.url)!}"
                                                 class="offline" onerror=src="/images/default.png">
                                        </div>
                                    </#list>
                                    <br style='clear:both'/>
                                </div>
                                </#if>
                            </div>
                        </div>
                        <br style='clear:both'/>
                    </div>
                    </#if>
                </#list>
            </div>
            <div class="input-group">
                    <textarea class="form-control" id="content" name="content" maxlength="500"
                              style="width: 675px; height: 100px;" lay-verify="required" placeholder="回复内容"></textarea>

            </div>
            <div class="cuiair">
                <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i>回复</i></button>
            </div>
        </div>
    </div>

    </div><!-- /.box-body -->
</form>
</@body>
<@footer>
</@footer>