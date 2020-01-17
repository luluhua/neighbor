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
        <#--<#list entity as list>-->
        <#--<div class="boxscroll_dl  <#if list.userid !=me.id>left-u <#else >right-u </#if>">-->
        <#--<#if list.userid !=me.id>-->
        <#--<img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(list.userAvatar)!'--'}"-->
        <#--onerror="this.src='${ctx}/base/images/sys_avatar.jpg'">-->
        <#--<#else ><img src="${(me.avatarUrl)!}" onerror="this.src='${ctx}/base/images/default.jpg'"></#if>-->
        <#--<div class="haeasf">-->
        <#--<p> ${(list.content)!}-->
        <#--<#if list.files??>-->
        <#--<#list list.files?split(",") as fi>-->
        <#--<img src="${fi}">-->
        <#--</#list>-->
        <#--</#if>-->
        <#--</p>-->

        <#--</div>-->
        <#--</div>-->
        <#--</#list>-->
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
    getMessageList();


    function getMessageList() {
        var userid = "${(userid)!}";
        var friendid = "${(sender)!}";
        var mes = "${(me.id)}";
        $.ajax({
                    type: "post",
                    url: "${ctx}/message/messageList", //向后端请求数据的url
                    data: {"userid": userid, "friendid": friendid},
                    success: function (res) {
                        if (res.count == "0") {
                            var html = ""
                            var cleimg = "${ctx}/base/images/default.jpg"
                            var imgurl = "<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>";
                            for (var i = 0; i < res.data.length; i++) {
                                // alert(res.data[i].userAvatar)
                                var fxd = "";
                                var toux;
                                var img;
                                if (res.data[i].userid == mes) {
                                    fxd = "left-u";
                                } else {
                                    fxd = "right-u";
                                }
                                if (res.data[i].userAvatar == "" && res.data[i].type == 0) {
                                    toux = "${ctx}/base/images/sys_avatar.jpg"
                                }
                                if (res.data[i].userAvatar == "" && res.data[i].type == 1) {
                                    toux = "${ctx}/base/images/default.jpg"
                                }
                                if (res.data[i].userAvatar != "") {
                                    toux = imgurl + res.data[i].userAvatar;
                                }
                                if ("" + res.data[i].userid + "" == "${(me.id)}") {
                                    img = '<img src="' + toux + '">'
                                } else {
                                    img = '<img src="${(me.avatarUrl)!}">'

                                }
                                html += '<div class="boxscroll_dl ' + fxd + '">' + img + '' +
                                        '<div class="haeasf">' +
                                        '<p>' + res.data[i].content + '</p>' +
                                        '</div>' +
                                        '</div>'
                            }
                            $("#boxscroll").html(html);

                        } else {
                            alert("无数据");
                        }
                    }
                }
        );
    }

    $(".but-for").click(function () {
        var content = $("#content").val();
        var sender = $("#sender").val();
        if (content != null && content != "") {
            $.ajax({
                type: "post",
                url: "${ctx}/message/doAdd", //向后端请求数据的url
                data: {
                    "userId": sender,
                    "content": content,
                },
                success: function (data) {
                    /* if(data.result=="0"){
                        alert("上传失败");
                    }else{
                        alert("上传成功");
                    } */
                }
            });
        }

    })
</script>

</@footer>
