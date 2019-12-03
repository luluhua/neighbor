<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
      action="/appc/tGovConsult/doReply"
      xmlns="http://www.w3.org/1999/html">
        <#if (consult.id)??><input type="hidden" name="consultId" value="${(consult.id)}"/></#if>
    <div class="box-body">
        <div class="form-group">
            <label for="title" class="col-sm-2 control-label">咨询标题</label>
            <div class="col-sm-10" style="padding-top: 7px">
              ${(consult.title)!}
            </div>
        </div>
        <div class="form-group">
            <label for="themeName" class="col-sm-2 control-label">咨询主题</label>
            <div class="col-sm-10" style="padding-top: 7px">
                ${(consult.themeName)!}
            </div>
        </div>
        <div class="form-group">
            <label for="content" class="col-sm-2 control-label">咨询内容</label>
            <div class="col-sm-10" style="padding-top: 7px">
                ${(consult.content)!}
            </div>
        </div>
        <div class="form-group">
            <label for="content" class="col-sm-2 control-label">在线问答</label>
        </div>
        <div class="form-group">
            <div class="col-sm-1"></div>
            <div class="col-sm-11">
                <div class="input-group">
                    <textarea class="form-control" id="content" name="content" maxlength="500" style="width: 675px; height: 100px;" lay-verify="required" placeholder="回复内容"></textarea>
                    <div class="input-group-btn">
                        <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i>回复</i></button>
                    </div>
                </div>
                <div style="padding-top: 10px"></div>
                <div class="chat" id="chat-box" style="overflow: auto; width: auto; height: 300px;padding-top: 20px">
                <#list msgList as m>
                    <#if m.userType==1>
                        <div class="item">
                            <img src='<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(m.avatarUrl)!}' class='online' onerror=src="/images/default.png">
                            <p class="message">
                                <a href="#" class="name">
                                    <#if (m.dtCreate)?string("yyyyMMdd") == .now?string("yyyyMMdd")>
                                        <small class="text-muted pull-right"><i class="fa fa-clock-o"></i>今天 ${(m.dtCreate?time)}</small>
                                    <#else>
                                        <small class="text-muted pull-right"><i class="fa fa-clock-o"></i>${(m.dtCreate?string('MM月dd日 HH:mm:ss'))}</small>
                                    </#if>
                                    ${(m.userName)!'&ensp;'}
                                </a>
                            </p>
                            <div class="attachment" style="margin-right: 0;">
                                <p class="filename">
                                    ${(m.content)!}
                                </p>
                            </div>
                        </div>
                    <#else >
                        <div class="item">
                            <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(m.avatarUrl)!}"  class="offline" onerror=src="/images/default.png">
                            <p class="message">
                                <a href="#" class="name">
                                     <#if (m.dtCreate)?string("yyyyMMdd") == .now?string("yyyyMMdd")>
                                        <small class="text-muted pull-right"><i class="fa fa-clock-o"></i>今天 ${(m.dtCreate?time)}</small>
                                     <#else>
                                        <small class="text-muted pull-right"><i class="fa fa-clock-o"></i>${(m.dtCreate?string('MM月dd日 HH:mm:ss'))}</small>
                                     </#if>
                                    ${(m.userName)!}
                                </a>
                                ${(m.content)!}
                            </p>
                        </div>
                    </#if>
                </#list>
                </div>
            </div>
        </div>
    </div><!-- /.box-body -->
</form>
</@body>
<@footer>
</@footer>