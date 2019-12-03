<#include "../../common/layout_dl.ftl">
<@header>
</@header>
<@body>
    <div class="box-body">
        <input type="hidden" id="partymember_file" value="">
        <div class="form-group">
            <button onclick="exportPartyMemberExcelModel()" style="margin-left: 6px" class="btn btn-primary"><i class="fa fa-save"></i>
                党员信息模板下载
            </button>
        </div>
        <div class="form-group">
            <div id="dropz" class="dropzone" style="height: 250px"></div>
        </div>
        <div class="form-group">
            <button onclick="importPartyMember()" style="margin-left: 6px" class="btn btn-success"><i class="fa fa-save"></i>
                导入已上传Excel文件中的党员数据
            </button>
        </div>
    </div><!-- /.box-body -->
</@body>
<@footer>
  <link rel="stylesheet" href="/plugins/dropzone/dropzone.css">
  <script src="/plugins/dropzone/dropzone.js"></script>
  <script>
      $(function(){
          Dropzone.autoDiscover = false;
          $("#dropz").dropzone({
              url:"/dj/partymember/file/upload",//文件提交地址
              method:"post",
              paramName:"file",
              maxFiles:1,//一次性上传的文件数量上限
              maxFilesize: 10, //文件大小，单位：MB
              acceptedFiles: ".xls,.xlsx", //上传的类型
              addRemoveLinks:false,
              parallelUploads: 1,//一次上传的文件数量
              dictDefaultMessage:'点击上传党员信息excel文件',
              dictMaxFilesExceeded: "您最多只能上传1个文件！",
              dictResponseError: '文件上传失败!',
              dictInvalidFileType: "文件类型只能是.xls,.xlsx。",
              dictFallbackMessage:"浏览器不受支持",
              dictFileTooBig:"文件过大上传文件最大支持.",
              dictRemoveFile: "删除",
              dictCancelUpload: "取消",
              accept: function(file, done) {
                  done();
              },
              init:function(){
                  this.on("maxfilesexceeded", function(file){
                      alert("您最多只能上传1个文件！");
                  });
                  this.on("addedfile", function(file) {
                      if (this.files[1]!=null){
                          this.removeFile(this.files[0]);
                      }
                      document.querySelector('div .dz-default').style.display = 'none';
                  });
                  this.on("success",function(file,data){
                      if(data!=null&&data.urls!=null&&data.urls.length>0){
                         $("#partymember_file").val(data.urls[0]);
                      }
                  });
                  this.on("error",function (file,data) {
                      //上传失败触发的事件
                      console.log('fail');
                      var message = '';
                      if (file.accepted){
                          $.each(data,function (key,val) {
                              message = message + val[0] + ';';
                          })
                      }
                  });
              }
          });
      });

      //导入党员信息
      function importPartyMember() {
          var fileUrl=$("#partymember_file").val();
          if(fileUrl==null||fileUrl.length==0){
              $.alert({
                  title: '提示',
                  content: "还没有上传党员信息excel！",
                  buttons: {"好的": {btnClass: 'btn-blue'}}
              });
          }
          var importPartymemberFileUrl="/dj/partymember/importPartyMemberExcel";
          var partyMemberFileData={fileName:fileUrl};
          $.ajax(importPartymemberFileUrl, {
              dataType: 'json',
              type: 'get',
              data:partyMemberFileData,
              async: false,
              headers: {'Content-Type': 'application/json'},
              success: function (jsondata) {
                  console.log(jsondata);
                  if(jsondata!=null&&jsondata.code==500){
                      $.alert({
                          title: '提示',
                          content: jsondata.msg,
                          buttons: {"好的": {btnClass: 'btn-blue'}}
                      });
                  }else{
                      $.alert({
                          title: '提示',
                          content: "党员信息导入成功,转后台处理",
                          buttons: {"好的": {btnClass: 'btn-blue'}}
                      });
                      var updatePartymemberUrl="/dj/partymember/updatePartymember";
                      $.ajax(updatePartymemberUrl, {
                          dataType: 'json',
                          type: 'get',
                          async: true,//开启异步处理
                          headers: {'Content-Type': 'application/json'},
                          success: function (jsondata) {
                          }
                      });
                      parent.layer.closeAll('iframe');
                  }
              }
          });
      }

      //导出excel
      function exportPartyMemberExcelModel(){
          var exportPartymemberModelFileUrl="/dj/partymember/exportPartyMemberExcelModel";
          $.ajax(exportPartymemberModelFileUrl, {
              dataType: 'json',
              type: 'get',
              async: false,
              headers: {'Content-Type': 'application/json'},
              success: function (jsondata) {
                  console.log(jsondata);
                  if(jsondata!=null&&jsondata.code==500){
                      $.alert({
                          title: '提示',
                          content: jsondata.msg,
                          buttons: {"好的": {btnClass: 'btn-blue'}}
                      });
                  }else{
                      downloadFile("/download/downloadApp", jsondata.msg);
                  }
              }
          });
      }

      function downloadFile(url, name) {
          setTimeout(function () {
              var _a = document.createElement("a");
              var evt = document.createEvent('HTMLEvents');
              evt.initEvent('click', false, false);
              _a.href = url + "?paths=" + name;
              _a.download = name;
              _a.target = "_blank";
              _a.dispatchEvent(evt);
              document.body.appendChild(_a);
              _a.click();
              setTimeout(function () {
                  document.body.removeChild(_a);
              }, 1000);
          }, 100);
      }
  </script>
</@footer>