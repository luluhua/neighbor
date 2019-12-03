<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
    <#if (msg)??>
    <div style="text-align: center;font-size: 15px; color: red;">${(msg)!}</div>
    </#if>
    <#if (qrCoerUrl)??>
    <img src="${(qrCoerUrl)!}" style="width: 300px;height: 300px;text-align: center;margin-left: 20px;">
<div style="text-align: center;">
    <span style="font-size: 14px;margin-bottom: 5px;" id="channelNameId">渠道名称:${(qrCoerName)!}</span><br/>
    <button type="button" class="btn btn-success" id="qrcodeDownBtn">下载二维码</button>
    <button type="button" class="btn btn-success" id="qrcodeBgDownBtn">下载海报</button>
    <canvas id="Mycanvas" width="750" height="1064" style="display:none;"></canvas>
    <canvas id="Mycanvas1" width="300" height="330" style="display:none;"></canvas>
</div>
    </#if>
</@body>
<@footer>
<script>
    $("#qrcodeDownBtn").click(function () {
        var c = document.getElementById("Mycanvas1");
        var ctx = c.getContext("2d");
        var bg = {
            width: 750,
            height: 1064,
            src: "${(qrCoerBgUrl)!}"
        }
        var code = {
            width: 300,
            height: 300,
            src: "${(qrCoerUrl)!}"
        }
        var userInfo = {
            name: "${(qrCoerName)!}",
            width: 130,
            height: 130,
            src: ""
        }
        var image1 = new Image();
        // 解决图片的跨域问题
        // image1.setAttribute("crossOrigin",'*');
        image1.src = code.src + '?v=' + Math.random(); // 处理缓存
        image1.crossOrigin = "*";  // 支持跨域图片
        // image.src = bg.src;
        // image.onload = function () {
        //     ctx.drawImage(image, 0, 0, bg.width, bg.height);
        //     ctx.drawImage(image1, 0, 0, code.width, code.height);
        //     ctx.save();
        //     ctx.arc(185, 1235, 65, 0, Math.PI * 2, false);
        //     ctx.clip();
        //     ctx.drawImage(image2, 214, 906, userInfo.width, userInfo.height); // 在刚刚裁剪的园上画图
        //     ctx.restore(); // 还原状态
        //     ctx.font = "15px Georgia";
        //     ctx.fillStyle = '#000000';
        //     ctx.fillText(userInfo.name, 290, 906);
        //     downFile(ctx);
        // }
        image1.onload = function () {
            //画布背景色
            ctx.fillStyle = "#ffffff";
            ctx.fillRect(0, 0, 300, 330);
            //添加二维码到画布
            ctx.drawImage(image1, 0, 0, code.width, code.height);
            ctx.restore(); // 还原状态
            //添加文字到画布
            ctx.font = "15px Georgia";
            ctx.fillStyle = '#000000';
            ctx.fillText(userInfo.name, 20, 310);
            ctx.save();
            ctx.clip();
            //下载图片
            downFile(ctx);
        }
    });
    $("#qrcodeBgDownBtn").click(function () {
        var c = document.getElementById("Mycanvas");
        var ctx = c.getContext("2d");
        var bg = {
            width: 750,
            height: 1064,
            src: "${(qrCoerBgUrl)!}"
        }
        var code = {
            width: 300,
            height: 300,
            src: "${(qrCoerUrl)!}"
        }
        var userInfo = {
            name: "${(qrCoerName)!}",
            width: 130,
            height: 130,
            src: "${(qrCoerUrl)!}"
        }
        var image1 = new Image();
        // 解决图片的跨域问题
        image1.src = code.src + '?v=' + Math.random(); // 处理缓存
        image1.crossOrigin = "*";  // 支持跨域图片

        var image = new Image();
        image.src = bg.src+ '?v=' + Math.random(); // 处理缓存
        image.crossOrigin = "*";  // 支持跨域图片

        var image2 = new Image();
        image2.src = userInfo.src + '?v=' + Math.random(); // 处理缓存
        image2.crossOrigin = "*";  // 支持跨域图片

        image.onload = function () {
            ctx.drawImage(image, 0, 0, bg.width, bg.height);
            ctx.drawImage(image1, 230, 586, code.width, code.height);
            ctx.save();
            ctx.arc(185, 1235, 65, 0, Math.PI * 2, false);
            ctx.clip();
            ctx.drawImage(image2, 270, 926, userInfo.width, userInfo.height); // 在刚刚裁剪的园上画图
            ctx.restore(); // 还原状态
            ctx.font = "15px Georgia";
            ctx.fillStyle = '#000000';
            ctx.fillText(userInfo.name,230, 906);
            downFile(ctx);
        }
    });
    function downFile(ctx) {
        var type = 'png';
        var imgData = ctx.canvas.toDataURL(type);
        /**
         * 获取mimeType
         * @param  {String} type the old mime-type
         * @return the new mime-type
         */
        var _fixType = function (type) {
            type = type.toLowerCase().replace(/jpg/i, 'jpeg');
            var r = type.match(/png|jpeg|bmp|gif/)[0];
            return 'image/' + r;
        };
        // 加工image data，替换mime type
        imgData = imgData.replace(_fixType(type), 'image/octet-stream');

        /**
         * 在本地进行文件保存
         * @param  {String} data     要保存到本地的图片数据
         * @param  {String} filename 文件名
         */
        var saveFile = function (data, filename) {
            var save_link = document.createElementNS('http://www.w3.org/1999/xhtml', 'a');
            save_link.href = data;
            save_link.download = filename;
            var event = document.createEvent('MouseEvents');
            event.initMouseEvent('click', true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
            save_link.dispatchEvent(event);
        };
        // 下载后的问题名
        var filename = '分享渠道:${(qrCoerName)!}' + '.' + type;
        // download
        saveFile(imgData, filename);
    }
</script>
</@footer>