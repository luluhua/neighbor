var autoReplace = true;  //自动替换
var maxFileCount =10;  //最大文件数
var _initialPreview = [];
var _initialPreviewConfig = [];
var overwriteInitial = true;
var baseUrl = '';
var deleteUrl = 'file/delete';

//初始化fileinput控件
function initFileInput(ctrlName, uploadUrl, previewUrl, saveType) {
    _initialPreviewConfig = [];
    var control = $('#' + ctrlName);
    _initialPreview = [];
    //预览配置
    if (previewUrl != '' && previewUrl != 'undefined') {
        if (saveType == 1) {
                var _p = previewUrl.split(',');
            for (var i = 0; i < _p.length; i++) {
                if (_p[i] == '' || _p[i] == 'undefined') {
                    continue;
                }
                // var point = _p[i].lastIndexOf(".");
                // var type = _p[i].substr(point);
                // if(type==".jpg"||type==".gif"||type==".JPG"||type==".GIF"||type==".png"||type==".PNG"){
                var _previewUrl = baseUrl + _p[i];
                var _c = {
                    caption: _p[i],
                    size: 930321,
                    width: "120px",
                    key: _p[i],
                    url: deleteUrl
                };
                _initialPreview.push(_previewUrl);
                _initialPreviewConfig.push(_c);
                // }

            }
            console.log(_initialPreviewConfig);
        }
    }
    control.fileinput({
        initialPreview: _initialPreview,
        initialPreviewAsData: true,
        initialPreviewConfig: _initialPreviewConfig,
        autoReplace: autoReplace,
        maxFileCount: maxFileCount,
        overwriteInitial: overwriteInitial,
        language: 'zh', //设置语言
        uploadUrl: uploadUrl, //上传的地址
        allowedFileExtensions: ['jpg', 'png', 'gif', 'doc', 'xlsx', 'docx', 'xls','PDF','pdf'],//接收的文件后缀
        showUpload: true, //是否显示上传按钮
        showCaption: false,//是否显示标题
        browseClass: "btn btn-primary",
        uploadExtraData: function (previewId, index) {   //额外参数的关键点
            var obj = {};
            obj.groupId = groupId();
            obj.saveTypeId = saveTypeId();
            obj.serviceId = serviceId();
            return obj;
        }
    });
}