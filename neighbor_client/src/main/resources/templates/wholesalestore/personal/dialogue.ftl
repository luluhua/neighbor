<#include "../../common/layout_dl.ftl">
<@header>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/css.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/style.css"/>
    <link href="${ctx}/base/js/layui/css/layui.css" rel="stylesheet"/>
</@header>
<@js>
</@js>
<@body>
<div class="dialog_box">
    <div class="dialog_box1">
        <div id="boxscroll">
        <#list entity as list>
            <div class="boxscroll_dl  <#if list.friendId !=me.id>left-u <#else >right-u </#if>">
        <#if list.friendId !=me.id>
        <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(list.userAvatar)!'--'}"
             onerror="this.src='${ctx}/base/images/sys_avatar.jpg'">
        <#else ><img src="${(me.avatarUrl)!}" onerror="this.src='${ctx}/base/images/default.jpg'"></#if>
                <div class="haeasf">
                    <p> ${(list.content)!}
        <#if list.files??>
            <#list list.files?split(",") as fi>
        <img src="${fi}">
            </#list>
        </#if>
                    </p>

                </div>
            </div>
        </#list>
        </div>

        <!--回复框-->
        <div class="hf_box">
            <input type="hidden" id="sender" value="${(sender)!}">
            <textarea class="text" id="content" placeholder=""></textarea>
            <button class="but-for">发送</button>
        </div>
    </div>
</div>
</@body>
<@footer>
<script src="${ctx}/base/js/init.js" type="text/javascript"></script>
<script>
    connect("${(userid)!}")
    $(".but-for").click(function () {
        var content = $("#content").val();
        var sender = "${(sender)!}";
        if (content != null && content != "") {

            activity.post('${ctx}/message/doAdd',
                    {
                        userId: sender,
                        content: content,
                    },
                    function (result) {
                        if (result.code == 200) {
                            var html = '<div class="boxscroll_dl right-u">' +
                                    '<img src="${(me.avatarUrl)!}" onerror="this.src=\'${ctx}/base/images/default.jpg\'">' +
                                    '<div class="haeasf">' +
                                    '<p>' + content + '</p>' +
                                    '</div>' +
                                    '</div>'
                            $("#boxscroll").append(html);
                            $("#content").val("")
                            var scrollHeight = $('#boxscroll').prop("scrollHeight");
                            $('#boxscroll').scrollTop(scrollHeight, 200);

                            $.getJSON('${ctx}/message/sendmsg?sender=' + sender + '&content=' + content, function (data) {

                            });
                        } else {
                            layer.msg("系统异常，请稍后重试！", {
                                time: 1000,
                                end: function () {
                                }
                            })
                        }
                    });
        }

    })

    function connect(user_id) {
        if ('WebSocket' in window) {
            ws = new WebSocket("ws://127.0.0.1:9111/socketServer/" + user_id);
        }
        else if ('MozWebSocket' in window) {
            ws = new MozWebSocket("ws://127.0.0.1:9111/socketServer/" + user_id);
        }
        else {
            activity.iconNoTooltip("该浏览器不支持即时聊天");
        }
        ws.onmessage = function (evt) {
            console.log(evt.data);
            var friend_id = $("#sender").val();
            var json = $.parseJSON(evt.data);
            if (json.userId == user_id && json.sender == friend_id) {
                var json = $.parseJSON(evt.data);
                var html = '<div class="boxscroll_dl left-u">' +
                        '<img src="' + json.avatarUrl + '" onerror="this.src=\'${ctx}/base/images/sys_avatar.jpg\'">' +
                        '<div class="haeasf">' +
                        '<p>' + json.content + '</p>' +
                        '</div>' +
                        '</div>'
                setTimeout(function () {
                    $("#boxscroll").append(html)
                }, 1000);
                var scrollHeight = $('#boxscroll').prop("scrollHeight");
                $('#boxscroll').scrollTop(scrollHeight, 200);

            }
        };
        ws.onclose = function (evt) {
            activity.shakeTooltip("通讯中断");
        };
        ws.onopen = function (evt) {

        };
    }
</script>

</@footer>
