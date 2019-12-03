<#include "../../common/layout.ftl">
<@header>
<link rel="stylesheet" href="/plugins/video-7.5.5/css/video-js.min.css">
<script src="/plugins/video-7.5.5/video.min.js"></script>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>活动管理 > <a href="/activity/tActivityEnroll/list/1">报名管理</a></small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <form action="/activity/tActivityEnroll/list/1" method="post"
                          class="form-inline">
                        <div class="box-header">
                            <div class="input-group">
                                <#--<input type="text" name="dtCreate" value="${(query.dtCreate)!}" autocomplete="off"-->
                                       <#--class="form-control date"-->
                                       <#--id="daterange" placeholder="报名日期查询" style="width: 228px;">-->
                                <input type="text" name="createTimeStart" value="${createTimeStart!}" autocomplete="off"
                                       class="form-control" readonly
                                       id="createTimeStart" placeholder="报名日期开始" style="width: 120px;">
                            </div>
                            <div class="input-group">
                                <input type="text" name="createTimeEnd" value="${createTimeEnd!}" autocomplete="off"
                                       class="form-control" readonly
                                       id="createTimeEnd" placeholder="报名日期结束" style="width: 120px;">
                            </div>
                            <div class="input-group">
                                <input type="text" name="workName" value="${(query.workName)!}" class="form-control"
                                       placeholder="作品名称">
                            </div>
                            <div class="input-group">
                                <input type="text" name="name" value="${(query.name)!}" class="form-control"
                                       placeholder="作者姓名">
                            </div>
                            <div class="input-group">
                                <select id="approveStatus" class="form-control input-select-200" name="approveStatus">
                                    <option value="">--请选择审批情况--</option>
                                    <option value="0" <#if query.approveStatus??&&query.approveStatus==0>selected</#if>>不通过</option>
                                    <option value="1" <#if query.approveStatus??&&query.approveStatus==1>selected</#if>>通过</option>
                                </select>
                            </div>
                            <div class="input-group">
                                <div style="position: relative;z-index: 999;">
                                    <input id="orgName" style="height: 33px;width: 200px;" class="org-select"
                                           placeholder="-- 分类查询 --" readOnly="true"
                                           onclick="showTree()" value="${(query.workClass)!}">
                                    <!-- 模拟select点击框 以及option的text值显示-->
                                    <i class="trg" style="position: absolute;"></i>
                                    <!-- 模拟select右侧倒三角 -->
                                    <input id="workClass" type="hidden" name="workClass" value="${(query.workClass)!}"/>
                                    <!-- 存储 模拟select的value值 -->

                                    <!-- zTree树状图 相对定位在其下方 -->
                                    <div class="ztree"
                                         style="display:none; position: absolute;border:1px solid #4aa5ff;width:200px;background: #fff">
                                        <ul id="treeDemo"></ul>
                                    </div>
                                </div>
                            </div>
                            <div class="input-group">
                                <select id="affiliation" class="form-control input-select-200" name="affiliation">
                                    <option value="">--请选择机构/学校--</option>
                                    <#list affiliation as affi>
                                        <#if affi.affiliation?length gt 0>
                                            <option value="${(affi.affiliation)!}"
                                            <#if query.affiliation??&&affi.affiliation==query.affiliation>selected</#if> >
                                                ${(affi.affiliation)!}
                                            </option>
                                        </#if>
                                    </#list>
                                </select>
                            </div>
                            <div class="input-group">
                                <select id="group" class="form-control input-select-200" name="group">
                                    <option value="">--请选择--</option>
                                    <option value="A组（小学组）" <#if query.group??&&query.group=='小学组'>selected</#if>>小学组
                                    </option>
                                    <option value="B组（中学组）" <#if query.group??&&query.group=='初中组'>selected</#if>>初中组
                                    </option>
                                </select>
                                <div class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button>
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="input-group-btn">
                                    <a class="btn btn-primary btn-xs"
                                       href="/appc/tActActivityVote/list/1">查看投票排行</a>
                                </div>
                            </div>


                            <div class="input-group pull-right">
                                <button type="button" class="btn btn-primary btn-flat" onclick="exportTo('报名管理数据');">
                                    <i class="fa fa-file-excel-o"></i> 导出
                                </button>
                            </div>
                            <div class="input-group  pull-right" style="padding-right: 10px">
                                <div class="input-group">
                                    <a class="btn btn-primary dialog" href="javascript:;" data-title="作品添加"
                                       data-url="/activity/tActivityEnroll/add"
                                       data-width="1200" data-height="800"><i class="fa fa-plus"></i> 添加</a>
                                </div>
                            </div>
                        </div><!-- /.box-header -->
                    </form>
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tr>
                                <th>分组</th>
                                <th>作品名称</th>
                                <th>作品分类</th>
                                <th>作者姓名</th>
                                <th>所属学校（或机构）</th>
                                <th>指导老师</th>
                                <th>报名时间</th>
                                <th>审核上架</th>
                                <th>黑名单</th>
                                <th>视频/图片</th>
                                <th width="220px">操作</th>
                            </tr>
                <#list pageData.getRecords() as entity>
        <tr>
            <td>${(entity.workGroup)!'--'}</td>
            <td><a src="/activity/tActivityEnroll/detail/${(entity.id)}">${(entity.workName)!'--'}</a></td>
            <td>${(entity.workClass)!'--'}</td>
            <td>${(entity.name)!'--'}</td>
            <td>${(entity.affiliation)!'--'}</td>
            <td>${(entity.instructor)!'--'}</td>
            <td>${(entity.dtCreate?string('yyyy-MM-dd HH:mm:ss'))!'--'}</td>
            <td>
                    <#if entity.approveStatus?? && entity.approveStatus==1>
                        通过
                    <#elseif entity.approveStatus?? && entity.approveStatus==0>
                        不通过
                    <#else >
                        --
                    </#if>
            </td>
            <td>
                <#if entity.isBlacklist?? && entity.isBlacklist==1>
                    是
                <#elseif entity.isBlacklist?? && entity.isBlacklist==0>
                    否
                <#else >
                    --
                </#if>
            </td>
            <td>
                <a class="btn btn-xs" onclick="playVedio('${(entity.workPath)!}')">
                    <i class="fa fa-play"></i>
                </a>
            </td>
            <td>
                <@shiro.hasPermission name="editTActivityEnroll">
                    <#if entity.approveStatus==1>
                    <#else >
                        <a class="btn btn-primary btn-xs dialog" href="javascript:;" data-title="作品编辑"
                           data-url="/activity/tActivityEnroll/edit/${(entity.id)!}"
                           data-width="1200" data-height="800">编辑</a>
                    </#if>
                <a class="btn btn-primary btn-xs" href="/activity/tActivityEnroll/approve/${(entity.id)!}">审核上架</a>
                </@shiro.hasPermission>
                <@shiro.hasPermission name="deleteTActivityEnroll">
                    <#if entity.isBlacklist?? && entity.isBlacklist==1>
                    <a class="btn btn-danger btn-xs"
                       data-tiggle="ajax"
                       data-submit-url="/activity/tActivityEnroll/black?id=${(entity.id)!}"
                       data-confirm="您确定要将该条记录解除黑名单吗?">解除黑名单</a>
                    <#else>
                    <a class="btn btn-danger btn-xs"
                       data-tiggle="ajax"
                       data-submit-url="/activity/tActivityEnroll/black?id=${(entity.id)!}"
                       data-confirm="您确定要将该条记录拉入黑名单吗?">拉入黑名单</a>
                    </#if>
                 <a class="btn btn-danger btn-xs"
                    data-tiggle="ajax"
                    data-submit-url="/activity/tActivityEnroll/delete?id=${(entity.id?c)!}"
                    data-confirm="您确定要删除该条记录吗?">删除</a>
                </@shiro.hasPermission>
            </td>
        </tr>
                </#list>
                        </table>
                    </div><!-- /.box-body -->
                    <div class="box-footer row">
                        <div class="col-md-6">
            <#include "../../common/paginateBar.ftl" />
	  		  <@paginate pageData=pageData actionUrl="/activity/tActivityEnroll/list/" urlParas="?search=${search!}&group=${(query.group)!}&workClass=${(query.workClass)!}&affiliation=${(query.affiliation)!}&createTimeStart=${createTimeStart!}&createTimeEnd=${createTimeEnd!}"  />
                        </div>
                        <div class="col-md-6 pull-left">
            <#include "../../common/paginate.ftl" />
            <@paginate currentPage=pageData.getCurrent() totalPage=pageData.getPages() actionUrl="/activity/tActivityEnroll/list/" urlParas="?search=${search!}&pageSize=${pageSize!}&group=${(query.group)!}&workClass=${(query.workClass)!}&affiliation=${(query.affiliation)!}&createTimeStart=${createTimeStart!}&createTimeEnd=${createTimeEnd!}"  />
                        </div>
                    </div>
                </div><!-- /.box -->
            </div>
        </div>
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</@body>
<@footer>
<script>
    videojs.options.flash.swf = "video-js.swf";
    var root_url = '<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>';

    function playVedio(src) {
        if (src.indexOf(',') > -1) {
            var photosUrl = src.split(',');
            var datas = [];
            for (var i = 0; i < photosUrl.length; i++) {
                var data = {
                    "alt": i,
                    "pid": 666, //图片id
                    "src": root_url + photosUrl[i], //原图地址
                    "thumb": root_url + photosUrl[i] //缩略图地址
                };
                datas.push(data);
            }
            var json = {
                "title": "", //相册标题
                "id": 123, //相册id
                "start": 0, //初始显示的图片序号，默认0
                "data": datas
            };
            layer.photos({
                photos: json
                , anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机
            });
        } else {
            var div = '<video id="my-video" class="vjs-default-skin vjs-big-play-centered"\n' +
                    '                   style="width:100%;height:98%"  ' +
                    '                   controls preload="auto" \n' +
                    '                   poster="http://video-js.zencoder.com/oceans-clip.png"\n' +
                    '                   data-setup=\'{"example_option":true}\'>\n' +
                    '                <source src="' + root_url + src + '"\n' +
                    '                        type=\'video/mp4\'/>\n' +
                    '                <source src="\'+root_url + src +\'"\n' +
                    '                        type=\'video/mov\'/>\n' +
                    '            </video>';
            layer.open({
                type: 1,
                title: false,
                shade: 0.8,
                area: ['750px', '550px'],
                skin: 'layui-layer-nobg', //没有背景色
                closeBtn: 0,
                shadeClose: true,
                content: div
            });
        }

    }

    //下方为原有查询条件，先做保留
    // function getBoforeDate(before) {
    //     var now = new Date();
    //     now.setDate(now.getDate() - before);
    //     return now;
    // }
    //
    // function getBoforeMonth(beforeMonth, day) {
    //     var now = new Date();
    //     now.setDate(day);
    //     now.setMonth(now.getMonth() - beforeMonth);
    //     return now;
    // }
    //
    // $(function () {
    //     var now = new Date();
    //     $('.date').daterangepicker({
    //         "showWeekNumbers": true,
    //         "showISOWeekNumbers": true,
    //         "ranges": {
    //             "今天": [
    //                 now,
    //                 now
    //             ],
    //             "昨天": [
    //                 getBoforeDate(1),
    //                 getBoforeDate(1)
    //             ],
    //             "最近7天": [
    //                 getBoforeDate(7),
    //                 now
    //             ],
    //             "最近30天": [
    //                 getBoforeDate(30),
    //                 now
    //             ],
    //             "本月": [
    //                 getBoforeMonth(0, 1),
    //                 getBoforeMonth(0, 31)
    //             ],
    //             "上个月": [
    //                 getBoforeMonth(1, 1),
    //                 getBoforeMonth(1, 31)
    //             ],
    //             "最近三个月": [
    //                 getBoforeMonth(2, 1),
    //                 getBoforeMonth(0, 31)
    //             ]
    //         },
    //         "locale": {
    //             "format": "YYYY/MM/DD",
    //             "separator": "-",
    //             "applyLabel": "应用",
    //             "cancelLabel": "取消",
    //             "fromLabel": "From",
    //             "toLabel": "To",
    //             "customRangeLabel": "自定义",
    //             "weekLabel": "W",
    //             "daysOfWeek": [
    //                 "日",
    //                 "一",
    //                 "二",
    //                 "三",
    //                 "四",
    //                 "五",
    //                 "六"
    //             ],
    //             "monthNames": [
    //                 "一月",
    //                 "二月",
    //                 "三月",
    //                 "四月",
    //                 "五月",
    //                 "六月",
    //                 "七月",
    //                 "八月",
    //                 "九月",
    //                 "十月",
    //                 "十一月",
    //                 "十二月"
    //             ],
    //             "firstDay": 1
    //         },
    //         "alwaysShowCalendars": true,
    //         "autoUpdateInput": false,
    //         "opens": "right",
    //         "buttonClasses": "btn btn-sm"
    //     }, function (start, end, label) {
    //         console.log(
    //                 "New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
    //     });
    //
    //     $('.date').on('apply.daterangepicker', function (ev, picker) {
    //         $(this).val(picker.startDate.format('YYYY/MM/DD') + ' - ' + picker.endDate.format('YYYY/MM/DD'));
    //     });
    //
    //     $('.date').on('cancel.daterangepicker', function (ev, picker) {
    //         $(this).val('');
    //     });
    //
    // });
    //上方为原有查询条件，先做保留
    //下方修复：295 优化后台管理端，更换时间控件
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        laydate.render({
            elem: '#createTimeStart'
        });
        laydate.render({
            elem: '#createTimeEnd'
        });
    });
    //上方修复：295 优化后台管理端，更换时间控件

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
</style>
</@footer>