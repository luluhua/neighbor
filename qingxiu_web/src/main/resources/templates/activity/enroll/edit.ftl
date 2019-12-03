<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post"
       <#if (entity.id)??>
                      action="/activity/tActivityEnroll/doEdit"
       <#else>
                      action="/activity/tActivityEnroll/doAdd"
       </#if>
>
                    <#if (entity.id)??><input type="hidden" name="id" value="${(entity.id)}"/></#if>
    <div class="box-body">
        <div class="form-group">
            <label for="code" class="col-sm-2 control-label">姓名<span
                    class="xing_red"> *</span></label>
            <div class="col-sm-10">
                <input type="text" name="name" class="form-control input-title-500"
                       placeholder="请输入姓名" lay-verify="required" value="${(entity.name)!}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="themeType" class="col-sm-2 control-label">年龄<span
                    class="xing_red"> *</span></label>
            <div class="col-sm-4">
                <input type="text" name="age"  class="form-control input-title-500"
                       placeholder="请输入年龄" lay-verify="required" value="${(entity.age)!}"/>
            </div>
        </div>
        <div class="form-group">
            <label for="code" class="col-sm-2 control-label">联系方式</label>
            <div class="col-sm-10">
                <input type="text" name="phone" value="${(entity.phone)!}" class="form-control input-title-500"
                       placeholder="请输入联系方式"/>
            </div>
        </div>
        <div class="form-group">
            <label for="code" class="col-sm-2 control-label">指导老师</label>
            <div class="col-sm-10">
                <input type="text" name="instructor" value="${(entity.instructor)!}" class="form-control input-title-500"
                       placeholder="请输入指导老师"/>
            </div>
        </div>
        <div class="form-group">
            <label for="code" class="col-sm-2 control-label">机构/学校</label>
            <div class="col-sm-10">
                <input type="text" name="affiliation" value="${(entity.affiliation)!}" class="form-control input-title-500"
                       placeholder="请输入机构/学校"/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">分组：<span class="xing_red">*</span></label>
            <div class="col-sm-10">
                <input type="radio" name="workGroup" value="A组（小学组）"
                       title="A组（小学组）"
                       <#if (entity.workGroup)??&&entity.workGroup=='A组（小学组）'>checked</#if>>
                <input type="radio" name="workGroup" value="B组（中学组）"
                       title="B组（中学组）" <#if (entity.workGroup)??&&entity.workGroup=='B组（中学组）'>checked</#if>>

            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">分类：<span class="xing_red">*</span></label>
            <div class="col-sm-10">
                <div style="position: relative;z-index: 999;">
                    <input id="orgName" class="org-select" onclick="showTree()" style="height: 33px;" value="${(entity.workClass)!}"
                           readOnly="true">
                    <!-- 模拟select点击框 以及option的text值显示-->
                    <i class="trg" style="position: absolute;"></i>
                    <!-- 模拟select右侧倒三角 -->
                    <input id="workClass" type="hidden" lay-verify="required" name="workClass" value="${(entity.workClass)!}"/>
                    <!-- 存储 模拟select的value值 -->

                    <!-- zTree树状图 相对定位在其下方 -->
                    <div class="ztree"
                         style="display:none; position: absolute;border:1px solid #4aa5ff;width:200px;background: #fff">
                        <ul id="treeDemo"></ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label for="code" class="col-sm-2 control-label">作品名称</label>
            <div class="col-sm-10">
                <input type="text" name="workName" value="${(entity.workName)!}" class="form-control input-title-500"
                       placeholder="请输入作品名称"/>
            </div>
        </div>
        <div class="form-group">
            <label for="code" class="col-sm-2 control-label">作品阐述</label>
            <div class="col-sm-10">
                <textarea class="form-control" rows="4" name="workDescription" placeholder="请输入作品阐述" value="${(entity.workDescription)!}">${(entity.workDescription)!}</textarea>
            </div>
        </div>
        <div class="form-group">
            <input type="hidden" id="work_path" name="workPath" class="form-control" value="${(entity.workPath)!}"/>
            <label for="systemLogo" class="col-sm-2 control-label">作品：<span
                    class="xing_red">*</span></label>
            <div class="col-sm-1" id="uysr">
                <a class="btn btn-primary dialog " href="javascript:;" data-title=" 附件管理"
                   data-url="/system/accessory/add?fileQuantity=9&vessel=work_path&classify=enrollpath&dict=enrollpath"
                   data-width="1200" data-height="700"><i class="fa fa-plus"></i> 添加附件</a>
            </div>
        </div>
        <div class="form-group">
            <label for="systemLogo" class="col-sm-2 control-label"></label>
            <div class="col-sm-10">
                <ul class="uiisar work_path_url">
                    <#if (entity.workPath)?? && entity.workPath!="" >
                        <#list entity.workPath?split(",") as p>
                            <#if p!="">
                                <li>
                                    <span class="layui-icon  layui-icon-close" name="workPath"
                                          test="${p}" onclick="remove(this)">&#x1006;</span>
                                    <@commonTags method="getFileSuffix" type="1" value="${p}">
                                        <#if getFileSuffix==0>
                                            <img onclick="advPreviewImg(this)"
                                                 class="imgdows"
                                                 src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${p}">
                                        <#else>
                                            <img onclick="advPreviewImg(this)"
                                                 class="imgdows"
                                                 src="../../../images/file_wj.png">
                                        </#if>
                                    </@commonTags>
                                </li>
                            </#if>
                        </#list>
                    </#if>
                </ul>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">&nbsp;</label>
            <div class="col-sm-10">
                <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i>
                    提 交
                </button>
            </div>
        </div>
    </div><!-- /.box-body -->
</form>
</@body>
<@footer>
  <script>
      $(document).ready(function () {

      });
      function remove(obj) {
          var p = $(obj).attr("test");
          obj.parentNode.parentNode.removeChild(obj.parentNode);
          var ps = $("#work_path").val();
          $("#work_path").val(ps.replace(p, ""));
      }
  </script>
<style>
    .uiisar li {
        width: 160
        px;
        padding: 10
        px;
        display: -webkit - inline - box;
    }
</style>
<script>
    var orgList = [{"name": "创意编程", "pId": 0, "id": 36}, {
        "name": "创意发明",
        "pId": 0,
        "id": 40
    }, {
        "name": "创意艺术",
        "pId": 0,
        "id": 53
    },
        {"name": "生活中使用的小发明", "pId": 40, "id": 1},
        {"name": "创意绘画", "pId": 53, "id": 2}, {"name": "创意手工艺", "pId": 53, "id": 3}, {
            "name": "创意服装",
            "pId": 53,
            "id": 4
        }, {"name": "3D打印", "pId": 53, "id": 5}, {"name": "汽车模型", "pId": 53, "id": 6}, {
            "name": "创意情景剧表演",
            "pId": 53,
            "id": 7
        },
        {"name": "互动游戏类", "pId": 36, "id": 8}, {"name": "实用程序工具类", "pId": 36, "id": 9}, {
            "name": "科普类",
            "pId": 36,
            "id": 10
        }, {"name": "机器人编程", "pId": 36, "id": 11}]
    var setting = {
        data: {
            simpleData: {
                enable: true
            }
        },
        //回调
        callback: {
            onClick: zTreeBeforeClick
        },
        view: {
            fontCss: {fontSize: "14px"}
        }
    };

    function zTreeBeforeClick(event, treeId, treeNode) {
        var fa = !treeNode.isParent;
        // if (fa) {
        zTreeOnClick(event, treeId, treeNode);
        // }
        return fa;//当是父节点 返回false 不让选取
    };

    //节点点击事件
    function zTreeOnClick(event, treeId, treeNode) {
        $('#orgName').val(treeNode.name);
        $('#workClass').val(treeNode.name)
        hideTree();
    };
    $(document).ready(function () {
        //初始组织树状图
        $.fn.zTree.init($("#treeDemo"), setting, orgList);
    });

    //下拉框显示 隐藏
    function showTree() {
        if ($('.ztree').css('display') == 'none') {
            $('.ztree').css('display', 'block');
        } else {
            $('.ztree').css('display', 'none');
        }
        $("body").bind("mousedown", onBodyDownByActionType);
    }

    function hideTree() {
        $('.ztree').css('display', 'none');
        $("body").unbind("mousedown", onBodyDownByActionType);
        return false;
    }

    //区域外点击事件
    function onBodyDownByActionType(event) {
        if (event.target.id.indexOf('treeDemo') == -1) {
            if (event.target.id != 'selectDevType') {
                hideTree();
            }
        }
    }
</script>
<script>
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
            if (obj.vessel == "editor_id") {
                if (index >= 0) {
                    $("#remoteUrl").val(url);
                } else {
                    layer.msg('此处只能插入图片!', {
                        time: 1000,
                        end: function () {
                        }
                    })
                }
            } else {
                if (index >= 0) {
                    html = '<li>' +
                            '<span class="layui-icon  layui-icon-close" name="' + obj.vessel + '" test="' + obj.url[i] + '">&#x1006;</span>' +
                            '<img onclick="advPreviewImg(this)" src="' + url + '"> ' +
                            '</li>'
                } else {
                    html = '<li>' +
                            '<span class="layui-icon  layui-icon-close" name="' + obj.vessel + '" test="' + obj.url[i] + '">&#x1006;</span>' +
                            '<img src="../../../images/file_wj.png"> ' +
                            '</li>'
                }
            }
            if (se == 1) {
                $("." + obj.vessel + "_url").html(html);
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

</script>
<style>
    .trg {
        width: 0;
        height: 0;
        border-left: 3px solid transparent;
        border-right: 3px solid transparent;
        border-top: 6px solid black;;
        position: absolute;
        left: 181px;
        top: 15px;

    }

    .org-select {
        cursor: default;
        z-index: -1;
        width: 200px;
    }

    .uiisar li {
        width: 160px;
        padding: 10px;
        display: -webkit-inline-box;

    }

    .uiisar li img {
        width: 96%;
    }

    .uiisar li span {
        width: 16px;
        height: 16px;
        border-radius: 8px;
        display: block;
        position: relative;
        font-size: 14px;
        color: #fff;
        background-color: red;
        left: 100%;
        top: -5px;
        text-align: center;
    }
</style>
</@footer>