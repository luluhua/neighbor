/**
 * Created by TF on 2018/1/15.
 */


var len = $("img[modal='zoomImg']").length;
var arrPic = new Array(); //定义一个数组
for (var i = 0; i < len; i++) {
    arrPic[i] = $("img[modal='zoomImg']").eq(i).prop("src"); //将所有img路径存储到数组中
}

$(document).ready(function () {
    $(".content-wrapper .imgdow").on(function () {

        $("body").css({overflow: "hidden"});
        //给body添加弹出层的html
        $("body").append("<div class=\"mask-layer\">" +
            "   <div class=\"mask-layer-black\"></div>" +
            "   <div class=\"mask-layer-container\">" +
            "       <div class=\"mask-layer-imgbox auto-img-center\"></div>" +
            "       <div class=\"mask-layer-container-operate\">" +
            // "           <button class=\"mask-clockwise-print btn-default-styles\">打印</button>" +
            "           <button class=\"mask-clockwise btn-default-styles\">顺旋转</button>" +
            "           <button class=\"mask-counterclockwise btn-default-styles\">逆旋转</button>" +
            "           <button class=\"mask-close btn-default-styles\">关闭</button>" +
            "       </div>" +
            "   </div>" +
            "</div>"
        );
        var $this = $(this);
        var img_index = $(".content-wrapper img[modal='zoomImg']").index($(this)); //获取点击的索引值
        var num = img_index;

        function showImg() {
            $(".mask-layer-imgbox").append("<p><img id='delta' src=\"\" alt=\"\"></p>");
            $(".mask-layer-imgbox img").prop("src", arrPic[num]); //给弹出框的Img赋值

            //图片居中显示
            var box_width = $(".auto-img-center").width(); //图片盒子宽度
            var box_height = $(".auto-img-center").height();//图片高度高度
            var initial_width = $(".auto-img-center img").width();//初始图片宽度
            var initial_height = $(".auto-img-center img").height();//初始图片高度
            if (initial_width > initial_height) {
                $(".auto-img-center img").css("width", box_width);
                var last_imgHeight = $(".auto-img-center img").height();
                $(".auto-img-center img").css("margin-top", -(last_imgHeight - box_height) / 2);
            } else {
                $(".auto-img-center img").css("height", box_height);
                var last_imgWidth = $(".auto-img-center img").width();
                $(".auto-img-center img").css("margin-left", -(last_imgWidth - box_width) / 2);
            }

            //图片拖拽
            var $div_img = $(".mask-layer-imgbox p");
            //绑定鼠标左键按住事件
            $div_img.bind("mousedown", function (event) {
                event.preventDefault && event.preventDefault(); //去掉图片拖动响应
                //获取需要拖动节点的坐标
                var offset_x = $(this)[0].offsetLeft;//x坐标
                var offset_y = $(this)[0].offsetTop;//y坐标
                //获取当前鼠标的坐标
                var mouse_x = event.pageX;
                var mouse_y = event.pageY;
                //绑定拖动事件
                //由于拖动时，可能鼠标会移出元素，所以应该使用全局（document）元素
                $(".mask-layer-imgbox").bind("mousemove", function (ev) {
                    // 计算鼠标移动了的位置
                    var _x = ev.pageX - mouse_x;
                    var _y = ev.pageY - mouse_y;
                    //设置移动后的元素坐标
                    var now_x = (offset_x + _x) + "px";
                    var now_y = (offset_y + _y) + "px";
                    //改变目标元素的位置
                    $div_img.css({
                        top: now_y,
                        left: now_x
                    });
                });
            });
            //当鼠标左键松开，接触事件绑定
            $(".mask-layer-imgbox").bind("mouseup", function () {
                $(this).unbind("mousemove");
            });

            //缩放
            var zoom_n = 1;
            $(".mask-out").click(function () {
                zoom_n -= 0.1;
                console.log(zoom_n)
                if (zoom_n <= 0.1) {
                    zoom_n = 0.1;
                    $(".mask-layer-imgbox img").css({
                        "transform": "scale(.1)",
                        "-moz-transform": "scale(.1)",
                        "-ms-transform": "scale(.1)",
                        "-o-transform": "scale(.1)",
                        "-webkit-transform": "scale(.1)"
                    });
                } else {
                    $(".mask-layer-imgbox img").css({
                        "transform": "scale(" + zoom_n + ")",
                        "-moz-transform": "scale(" + zoom_n + ")",
                        "-ms-transform": "scale(" + zoom_n + ")",
                        "-o-transform": "scale(" + zoom_n + ")",
                        "-webkit-transform": "scale(" + zoom_n + ")"
                    });
                }
            });
            $(".mask-in").click(function () {
                zoom_n += 0.1;
                $(".mask-layer-imgbox img").css({
                    "transform": "scale(" + zoom_n + ")",
                    "-moz-transform": "scale(" + zoom_n + ")",
                    "-ms-transform": "scale(" + zoom_n + ")",
                    "-o-transform": "scale(" + zoom_n + ")",
                    "-webkit-": "scale(" + zoom_n + ")"
                });
            });


            //旋转
            var spin_n = 0;
            $(".mask-clockwise").click(function () {
                spin_n += 90;
                $(".mask-layer-imgbox img").parent("p").css({
                    "transform": "rotate(" + spin_n + "deg)",
                    "-moz-transform": "rotate(" + spin_n + "deg)",
                    "-ms-transform": "rotate(" + spin_n + "deg)",
                    "-o-transform": "rotate(" + spin_n + "deg)",
                    "-webkit-transform": "rotate(" + spin_n + "deg)"
                });
            });
            $(".mask-counterclockwise").click(function () {
                spin_n -= 90;
                $(".mask-layer-imgbox img").parent("p").css({
                    "transform": "rotate(" + spin_n + "deg)",
                    "-moz-transform": "rotate(" + spin_n + "deg)",
                    "-ms-transform": "rotate(" + spin_n + "deg)",
                    "-o-transform": "rotate(" + spin_n + "deg)",
                    "-webkit-transform": "rotate(" + spin_n + "deg)"
                });
            });
            //关闭
            $(".mask-close").click(function () {
                $(".mask-layer").remove();
                $("body").css({overflow: ""})
            });
            $(".mask-layer-black").click(function () {
                $(".mask-layer").remove();
                $("body").css({overflow: ""})
            });
            //打印
            $(".mask-clockwise-print").click(function () {
                console.log("123")

            });
        }


        showImg();


    })
//     }
// )
})
;

function bbimg(e) {
    zoom_n += 0.1;
    $(".mask-layer-imgbox img").css({
        "transform": "scale(" + zoom_n + ")",
        "-moz-transform": "scale(" + zoom_n + ")",
        "-ms-transform": "scale(" + zoom_n + ")",
        "-o-transform": "scale(" + zoom_n + ")",
        "-webkit-": "scale(" + zoom_n + ")"
    });

    return false;
}

var zoom_n = 1;

function handle(delta) {
    var s = delta + ": ";
    if (delta < 0) {

        zoom_n += 0.1;
        $(".mask-layer-imgbox img").css({
            "transform": "scale(" + zoom_n + ")",
            "-moz-transform": "scale(" + zoom_n + ")",
            "-ms-transform": "scale(" + zoom_n + ")",
            "-o-transform": "scale(" + zoom_n + ")",
            "-webkit-": "scale(" + zoom_n + ")"
        })

    } else {
        zoom_n -= 0.1;
        if (zoom_n <= 0.1) {
            zoom_n = 0.1;
            $(".mask-layer-imgbox img").css({
                "transform": "scale(.1)",
                "-moz-transform": "scale(.1)",
                "-ms-transform": "scale(.1)",
                "-o-transform": "scale(.1)",
                "-webkit-transform": "scale(.1)"
            });
        } else {
            $(".mask-layer-imgbox img").css({
                "transform": "scale(" + zoom_n + ")",
                "-moz-transform": "scale(" + zoom_n + ")",
                "-ms-transform": "scale(" + zoom_n + ")",
                "-o-transform": "scale(" + zoom_n + ")",
                "-webkit-transform": "scale(" + zoom_n + ")"
            });
        }
    }
    // document.getElementById('delta').innerHTML = s;
}

function wheel(event) {
    var delta = 0;
    if (!event) event = window.event;
    if (event.wheelDelta) {
        delta = event.wheelDelta / 120;
        if (window.opera) delta = -delta;
    } else if (event.detail) {
        delta = -event.detail / 3;
    }
    if (delta)
        handle(delta);
}

if (window.addEventListener)
    window.addEventListener('DOMMouseScroll', wheel, false);
window.onmousewheel = document.onmousewheel = wheel;