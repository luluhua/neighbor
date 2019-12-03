<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
<form class="form-horizontal layui-form layui-form-pane" method="post" action="/jczl/tJczlGrid/doEdit">
    <input type="hidden" name="id" value="${(entity.id)!}"/>
    <div class="box-body">
        <div class="form-group">
            <label for="gName" class="col-sm-2 control-label">网格名称</label>
            <div class="col-sm-10">
                <input type="text" id="gName" name="gName" value="${(entity.gName)!}"
                       class="form-control input-select-200"
                       placeholder="请输入网格名称" lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="gCode" class="col-sm-2 control-label">网格编号</label>
            <div class="col-sm-10">
                <input type="number" id="gCode" name="gCode" value="${(entity.gCode)!}"
                       class="form-control input-select-200"
                       placeholder="请输入网格编号" lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="gAddress" class="col-sm-2 control-label">网格地址</label>
            <div class="col-sm-10">
                <input type="text" id="gAddress" name="gAddress" value="${(entity.gAddress)!}"
                       class="form-control input-title-500"
                       placeholder="请输入网格地址" lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="gRemark" class="col-sm-2 control-label">备注</label>
            <div class="col-sm-10">
                <textarea class="textar-remark" id="gRemark" name="gRemark"
                          placeholder="请输入备注">${(entity.gRemark)!}</textarea>
            <#--<input type="text" id="gRemark" name="gRemark" value="${(entity.gRemark)!}" class="form-control"-->
            <#--placeholder="请输入备注" lay-verify="required"/>-->
            </div>
        </div>
        <div class="form-group">
            <label for="gStatus" class="col-sm-2 control-label">是否启用</label>
            <div class="col-sm-10">
                <@dictTag method="getDictListByType" type="is_enabled" >
                    <#list getDictListByType as m>
                         <label>
                             <input name="gStatus" type="radio" class="minimal"
                                    <#if "${(m.value)!}"=="${(entity.gStatus)!}">checked</#if> value="${(m.value)!}"
                                    lay-ignore> ${(m.label)!}
                         </label>
                    </#list>
                </@dictTag>
            </div>
        </div>
        <div class="form-group">
            <label for="gManagePerson" class="col-sm-2 control-label">网格管理人</label>
            <div class="col-sm-10">
                <input type="number" id="gManagePerson" name="gManagePerson" value="${(entity.gManagePerson)!}"
                       class="form-control input-select-200" placeholder="请输入网格管理人" lay-verify="required"/>
            </div>
        </div>
        <div class="form-group">
            <label for="gStatus" class="col-sm-2 control-label">网格坐标配置</label>
            <input id="AreaPoints" name="gCoordinate" type="hidden" value="${(entity.gCoordinate)!}"/>
            <input id="btnStart" type="button" value="绘制新图形" class="btn3 btn_large02" onclick="drawManager.start()"/>
            <input id="btnComplete" type="button" value="完成" class="btn3 btn_large02" onclick="drawManager.complete()"
                   style=""/>
            <span id="mapHint" style="display:none;">点击左键添加顶点, 点击右键结束绘制。</span>
            <div class="col-sm-10" id="allmap" style="width:80%; height:500px; margin-top: 10px">

            </div>
        </div>
    <@shiro.hasPermission name="editTJczlGrid">
        <div class="form-group">
            <label class="col-sm-2 control-label">&nbsp;</label>
            <div class="col-sm-10">
                <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i>
                    提 交
                </button>
            </div>
        </div>
    </@shiro.hasPermission>
    </div><!-- /.box-body -->

</form>
</@body>
<@footer>
</@footer>
<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map("allmap", {enableMapClick: false});

    map.centerAndZoom(new BMap.Point(108.377146, 22.820317), 17);
    map.enableScrollWheelZoom();

    var status_none = 0;
    var status_editing = 1;
    map.addEventListener("click", function (e) {
        if (drawManager.status == status_editing) {
            drawManager.addPoint(e.point.lng, e.point.lat);
        }
    });
    map.addEventListener("mousemove", function (e) {
        if (drawManager.status == status_editing) {
            var dotPath = drawManager.dotLine.getPath();
            if (dotPath.length == 2) {
                drawManager.dotLine.setPositionAt(1, e.point);
            }
        }
    });
    map.addEventListener("rightclick", function (e) {
        if (drawManager.status == status_editing) {
            drawManager.complete();
        }
    });
    var gEditPoints = [];
    var gEditPolygon = null;
    var gEditPolygonStyle = {strokeColor: "red", strokeWeight: 2, strokeOpacity: 0.5};
    var drawManager = {
        status: status_none,
        verMarker: [], // 顶点标识
        verIcon: new BMap.Icon("/Res/vertex.gif", new BMap.Size(7, 7)),
        circleOptions: {
            strokeColor: "blue", strokeWeight: 1, strokeOpacity: 0.5, enableClicking: true, enableDragging: true
        },
        dotLine: null,
        _markerUpdateOnDrag: function (e) {
            var marker = e.target;
            var pt = marker.getPosition();
            var idx = marker.index;
            drawManager.updatePoint(idx, pt);
            if (idx == gEditPoints.length - 1) {
                if (drawManager.dotLine.getPath().length > 0) {
                    drawManager.dotLine.setPositionAt(0, pt);
                }
            }
        },
        markerDragging: function (e) {
            drawManager._markerUpdateOnDrag(e);
        },
        markerDragend: function (e) {
            drawManager._markerUpdateOnDrag(e);
        },
        markerRightclick: function (e) {
            var marker = e.target;
            var idx = marker.index;
            //console.log('markerRightclick:: ' + idx + '/' + gEditPoints.length);

            if (gEditPoints.length <= 3) {
                alert('多边形顶点不能少于三个');
                return;
            }

            if (idx < 0 || idx >= gEditPoints.length) {
                return;
            }

            //console.log('markerRightclick:: remove' + marker.index + '/' + gEditPoints.length);

            var pp = gEditPoints.splice(idx, 1);

            //console.log('markerRightclick:: removed' + marker.index + '/' + gEditPoints.length + '//' + pp.length);

            gEditPolygon.setPath(gEditPoints);

        },
        onPolylineUpdated: function (e) {
            if (drawManager.status == status_editing) {
                return;
            }
            var polygon = e.target;
            var points = polygon.getPath();
            var idx = 0;

            for (var i = 0; i < points.length; i++) {
                idx = i;
                if (idx < drawManager.verMarker.length) {
                    var marker = drawManager.verMarker[i];
                    marker.setPosition(points[i]);
                } else {
                    drawManager.addMarkerForVertex(points[i], i);
                }
            }
            var startIndex = idx + 1;
            for (var i = startIndex; i < drawManager.verMarker.length; i++) {
                map.removeOverlay(drawManager.verMarker[i]);
            }
            if (startIndex < drawManager.verMarker.length) {
                drawManager.verMarker.splice(startIndex, drawManager.verMarker.length - startIndex);
            }
            //console.log('onPolylineUpdated:: ' + gEditPoints.length);
            gEditPoints = points;
            //doSaveToEdit(gEditPoints);
        },

        addMarkerForVertex: function (pt, index) {
            var marker = new BMap.Marker(pt, {icon: drawManager.verIcon});
            marker.index = index;
            drawManager.verMarker.push(marker);
            map.addOverlay(marker);
            marker.enableDragging();
            marker.addEventListener('rightclick', drawManager.markerRightclick);
            marker.addEventListener('dragging', drawManager.markerDragging);
            marker.addEventListener('dragend', drawManager.markerDragend);
            return marker;
        },

        addPoint: function (lng, lat) {
            var pt = new BMap.Point(lng, lat);
            gEditPoints.push(pt);

            //console.log(pt.lng + "," + pt.lat);

            drawManager.addMarkerForVertex(pt, gEditPoints.length - 1);

            var dotPath = drawManager.dotLine.getPath();
            if (dotPath.length == 0) {
                dotPath.push(pt);
                dotPath.push(pt);
                drawManager.dotLine.setPath(dotPath);
            }
            drawManager.dotLine.setPositionAt(0, pt);
            if (gEditPoints.length > 1) {
                gEditPolygon.setPath(gEditPoints);
            }

        },
        updatePoint: function (idx, pt) {
            if (idx < 0 || idx >= gEditPoints.length) {
                return;
            }
            gEditPoints[idx].lng = pt.lng;
            gEditPoints[idx].lat = pt.lat;
            gEditPolygon.setPositionAt(idx, pt);
            doSaveToEdit();
        },
        start: function () {
            drawManager.status = status_editing;
            if (null == gEditPolygon) {
                //gEditPoints.push(new BMap.Point(108.371765, 22.823565));
                //gEditPoints.push(new BMap.Point(108.373184, 22.823365));
                //gEditPoints.push(new BMap.Point(108.373957, 22.822632));
                gEditPolygon = new BMap.Polygon(gEditPoints, gEditPolygonStyle);
                gEditPolygon.addEventListener('lineupdate', drawManager.onPolylineUpdated);
                map.addOverlay(gEditPolygon);
            }
            if (null == drawManager.dotLine) {
                drawManager.dotLine = new BMap.Polyline([],
                        {strokeColor: "red", strokeWeight: 2, strokeOpacity: 0.5, strokeStyle: 'dashed'});
                map.addOverlay(drawManager.dotLine);
            }

            gEditPoints = [];
            gEditPolygon.setPath(gEditPoints);
            gEditPolygon.disableEditing();

            drawManager.dotLine.setPath([]);
            map.setDefaultCursor("crosshair");

            $('#btnComplete').show();
            $('#mapHint').show();
        },
        complete: function () {
            drawManager.status = status_none;
            map.setDefaultCursor("url('openhand.cur')");
            drawManager.dotLine.setPath([]);
            gEditPolygon.enableEditing();
            $('#btnComplete').hide();
            $('#mapHint').hide();
            doSaveToEdit();
        }
    };

    var doSaveToEdit = function () {

        if (gEditPoints.length <= 3) {
            $('#AreaPoints').val('');
            return;
        }

        //console.log('gEditPoints.length=' + gEditPoints.length);

        var presult = [];
        for (var i = 0; i < gEditPoints.length; i++) {
            presult.push(gEditPoints[i].lng + ',' + gEditPoints[i].lat);
        }
        var re = presult.join(';');
        $('#AreaPoints').val("");
        $('#AreaPoints').val(re);
        delete presult;
        presult = null;
        return true;
    };

    var doInitStartup = function () {
        var bdary = new BMap.Boundary();
        map.clearOverlays();        //清除地图覆盖物

        var ptliststr = $.trim($('#AreaPoints').val());
        if (!ptliststr) {

            return;
        }

        var ptlist = ptliststr.split(';');
        if (!ptlist || ptlist.length <= 3) {

            return;
        }
        for (var i = 0; i < ptlist.length; i++) {

            var ptstr = ptlist[i];
            var ptArray = ptstr.split(',');
            // lng, lat
            var pt = new BMap.Point(ptArray[0] * 1, ptArray[1] * 1);

            gEditPoints.push(pt);
        }

        gEditPolygon = new BMap.Polygon(gEditPoints, gEditPolygonStyle);
        gEditPolygon.addEventListener('lineupdate', drawManager.onPolylineUpdated);
        // gEditPolygon.enableEditing();
        map.addOverlay(gEditPolygon);
        map.setViewport(gEditPoints);
    };

    setTimeout(function () {

        doInitStartup();
    }, 200);


</script>