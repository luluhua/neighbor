<#include "../../../common/layout_dl.ftl">
<@header>
  <link rel="stylesheet" href="/plugins/bootstrap-fileinput/css/fileinput.min.css">
</@header>
  <@body>
    <form role="form"  class="form-horizontal layui-form layui-form-pane" method="post" action="/tSysOrg/dept/doEdit">
      <input type="hidden" name="id" value="${(dept.id)!}" />
      <div class="box-body">
        <div class="form-group">
          <label for="deptName" class="col-sm-2 control-label">父级机构</label>
          <div class="col-sm-10">
          <select name="pid" class="form-control select2 input-select-200"  lay-verify="required" lay-ignore>
            <option value="0"> --请选择父级机构--</option>
            <#list list as m>
              <option value="${(m.id)!}" ${(m.id==dept.pid)?string('selected="selected"','')}> ${(m.name)!}</option>
            </#list>
          </select>
          </div>
        </div>
        <div class="form-group">
          <label for="deptName" class="col-sm-2 control-label">机构代码<span class="xing_red"> *</span></label>
          <div class="col-sm-10">
          <input type="text" id="code" name="code" class="form-control input-select-200" lay-verify="required"
                 value="${(dept.code)!}"
                 placeholder="请输入机构代码">
          </div>
        </div>
        <div class="form-group">
          <label for="deptName" class="col-sm-2 control-label">部门名称<span class="xing_red"> *</span></label>
          <div class="col-sm-10">
          <input type="text" id="name" name="name" class="form-control input-select-200" lay-verify="required"
                 value="${(dept.name)!}"
                 placeholder="请输入部门名称">
          </div>
        </div>
        <div class="form-group">
          <label for="deptName" class="col-sm-2 control-label">部门简称<span class="xing_red"> *</span></label>
          <div class="col-sm-10">
          <input type="text" id="nameShort" name="nameShort" class="form-control input-select-200" lay-verify="required"
                 value="${(dept.nameShort)!}"
                 placeholder="请输入部门简称">
          </div>
        </div>
        <div class="form-group">
          <label for="deptName" class="col-sm-2 control-label">部门图标<span class="xing_red"> *</span></label>
          <div class="col-sm-10">
          <input type="hidden" value="${(dept.logoUrl)!}" id="logoUrl" name="logoUrl">
          <div class="form-group">
            <input name="file" type="file" class="file-loading" id="systemLogo">
          </div>
          </div>
        </div>
        <div class="form-group">
          <label for="deptName" class="col-sm-2 control-label">联系电话<span class="xing_red"> *</span></label>
          <div class="col-sm-10">
          <input type="text" id="telPhone" name="telPhone" class="form-control input-select-200" lay-verify="required|mobile"
                 value="${(dept.telPhone)!}"
                 placeholder="请输入联系电话">
          </div>
        </div>

        <div class="form-group">
          <label for="deptName" class="col-sm-2 control-label">排序<span class="xing_red"> *</span></label>
          <div class="col-sm-10">
          <input type="text" id="sortIndex" name="sortIndex" class="form-control input-select-200" lay-verify="required"
                 value="${(dept.sortIndex)!}"
                 placeholder="请输入排序编号">
          </div>
        </div>
        <div class="form-group">
          <label for="deptName" class="col-sm-2 control-label">联系地址<span class="xing_red"> *</span></label>
          <div class="col-sm-10">
          <input type="text" id="address" name="address" class="form-control" lay-verify="required"
                 value="${(dept.address)!}"
                 placeholder="请输入联系地址">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label">部门描述</label>
          <div class="col-sm-10">
          <textarea class="form-control" name="remark" rows="3" placeholder="请输入描述，最多300个字符 ..." >
            ${(dept.remark)!}
          </textarea>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label">&nbsp;</label>
          <div class="col-sm-10">
            <button type="submit" class="btn btn-success" lay-submit lay-filter="submit"><i class="fa fa-save"></i>  提 交</button>
          </div>
        </div>
      </div>
    </form>
  </@body>
<@footer>
  <script src="/plugins/bootstrap-fileinput/js/fileinput.min.js"></script>
  <script src="/plugins/bootstrap-fileinput/js/locales/zh.js"></script>
  <script>
    //初始化fileinput控件（第一次初始化）
    function initFileInput(ctrlName, uploadUrl) {
      var control = $('#' + ctrlName);

      control.fileinput({

        initialPreview: [
          '<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(dept.logoUrl)!''}'
        ],
        initialPreviewAsData: true,
        initialPreviewConfig: [
          {caption: "<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(dept.logoUrl)!''}", size: 930321, width: "30px", key: 'deptIcon', showDelete: false}
        ],
        deleteUrl: "/file/delete",

        language: 'zh', //设置语言
        uploadUrl: uploadUrl, //上传的地址
        allowedFileExtensions : ['jpg', 'png'],//接收的文件后缀
        showUpload: false, //是否显示上传按钮
        showCaption: false,//是否显示标题
        browseClass: "btn btn-primary",
        uploadExtraData: function(previewId, index) {   //额外参数的关键点
          var obj = {};
          obj.groupId = groupId();
          obj.saveTypeId = saveTypeId();
          return obj;
        }
      });
    }

    initFileInput("systemLogo", "/file/upload");

    //上传成功回调函数
    $('#systemLogo').on("fileuploaded", function(event, data, previewId, index) {
      var result = data.response;
      console.log(result.status);
      console.log(result.urls);
      $('#logoUrl').val(result.urls[0]);
    });
    //获得额外参数的方法
    groupId = function() {
      return 1;//0头像 1图标 2办事材料 3 其他
    };
    //获得额外参数的方法
    saveTypeId = function() {
      return 1;//0添加附件表 1不添加只返回图片相对路径地址
    };
  </script>
</@footer>