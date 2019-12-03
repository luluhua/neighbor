<!DOCTYPE html>
<html>
<head>
    <link rel="shortcut icon" href="/base/images/iPhone1024@2x.png">
    <style>
        .btnd{
            background-color:#00a65a;
            border-radius: 0 !important;
            -webkit-box-shadow: none !important;
            -moz-box-shadow: none !important;
            box-shadow: none !important;
            border-width: 1px !important
            display: inline-block;
            padding: 6px 12px;
            font-size: 14px;
            font-weight: normal;
            line-height: 1.42857143;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            -ms-touch-action: manipulation;
            touch-action: manipulation;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            background-image: none;
            border: 1px solid transparent;
            border-radius: 4px;
            color: #ffffff;
            margin: 10px auto;
        }
        .configspan_li{
            display: block;
            float: left;
            overflow: hidden;
            margin: 3px 0;
            margin-bottom:10px;
            margin-left: 10px;
        }
        .tag-editor-tag{
            padding-left: 5px;
            color: #46799b;
            background: #e0eaf1;
            white-space: nowrap;
            overflow: hidden;
            cursor: pointer;
            border-radius: 2px 0 0 2px;
            float: left;
            padding: 5px;
        }

        .tag-editor-delete{
            background: #e0eaf1;
            cursor: pointer;
            border-radius: 0 2px 2px 0;
            padding-left: 3px;
            padding-right: 4px;
            float: left;
            padding: 5px;
        }
        .configdiv{
            margin: 10px;
            font-size: 14px;
            float: left;
            padding: 0 4px;width: 80%;
        }
        .configlistdiv{width: 100%;}
    </style>
    <script src="/plugins/jQuery/jQuery-2.1.4.min.js"></script>
    <script src="/plugins/tinymce/tinymce.min.js"></script>
    <script>
        tinymce.init({
            selector:'textarea',
            language:'zh_CN',
            menubar: "custom",
            toolbar: [
                'undo redo',
                'alignleft | aligncenter | alignright | alignjustify | alignnone | pastetext | underline | bold | subscript | superscript | italic',
                'bullist | numlist',
                'hr',
                'table',
                'forecolor | backcolor',
                'print',//打印
                'preview',//预览
                'code',//code
                    'fontsizeselect'
            ],
            plugins:'table | code | paste | print | preview | lists |hr |textcolor',
            height: 600, max_width: 1000,
            init_instance_callback: function () {
                tinymce.execCommand('mceTogglePlainTextPaste');
            }
        });
        tinymce.execCommand('pastetext');

    </script>
</head>
<body>
 <#if (tGovProjConfigList)?? && (tGovProjConfigList?size > 0)>
<div class="configdiv">
        <div class="configlistdiv">
            <li class="configspan_li">
               <div style="float: left;line-height: 30px;">表单名称：</div><div class="tag-editor-tag" data-val="${(entity.formName)!}">${(entity.formName)!}</div>
            </li>
            <div style="clear: both;"></div>
            <li class="configspan_li">
                <div style="float: left;line-height: 30px;">系統字段：(<span style="color: red;">点击下面可选字段,自动插入页面光标位置</span>)</div>
            </li>
            <div style="clear: both;"></div>
            <li class="configspan_li">
                <div class="tag-editor-tag" data-val="{$-用户签名-$}">{$-用户签名-$}</div>
            </li>
            <div style="clear: both;"></div>
            <li class="configspan_li">
                <div style="float: left;line-height: 30px;">表单字段：(<span style="color: red;">点击下面可选字段,自动插入页面光标位置</span>)</div>
            </li>
            <div style="clear: both;"></div>
             <#list tGovProjConfigList as config>
                 <#if (config.configName)??>
                     <#if config.configName!=''>
                <li class="configspan_li">
                    <div class="tag-editor-tag" data-val="${(config.configName)!}">${(config.configName)!}</div>
                </li>
                     </#if>
                 </#if>
             </#list>
            <div style="clear: both;"></div>
            <li class="configspan_li">
                <div style="float: left;line-height: 30px;">表单可选(占位符)字段：(<span style="color: red;">点击下面可选字段,自动插入页面光标位置</span>)</div>
            </li>
            <div style="clear: both;"></div>
       <#list tGovProjConfigList as config>
        <#if (config.configName)??>
            <#if config.configName!=''>
                <li class="configspan_li">
                    <div class="tag-editor-tag" data-val="{$${(config.configName)!}$}">{$${(config.configName)!}$}</div>
                </li>
            </#if>
        </#if>
       </#list>
            <div style="clear: both;"></div>
            <li class="configspan_li">
                <div style="float: left;line-height: 30px;">印章可选(占位符)字段：(<span style="color: red;">点击下面可选字段,自动插入页面光标位置</span>)</div>
            </li>
            <div style="clear: both;"></div>
       <#list tSignatureList as sign>
           <#if (sign.signatureName)??>
               <#if sign.signatureName!=''>
                <li class="configspan_li">
                    <div class="tag-editor-tag" data-val="{$${(sign.signatureName)!}$}">{$${(sign.signatureName)!}$}</div>
                </li>
               </#if>
           </#if>
       </#list>
        </div>

</div>
<div style="clear: both;"></div>
<form class="form-horizontal layui-form layui-form-pane" method="post" id="form1"
      action="/appc/tGovProjForm/doEditHtml" >
    <input type="hidden" name="id" value="${(entity.id)!}"/>
    <input type="hidden" name="formName" value="${(entity.formName)!}"/>
    <input type="hidden" name="projectId" value="${(entity.projectId)!}"/>
    <input type="hidden" name="formHtml" value=""  id="formHtml"/>
    <!--表格 -->
    <textarea >${(entity.formHtml)!}</textarea>
    <button type="button" class="btn btn-success btnd"
            onclick="onSubmit();" ><i class="fa fa-save"></i>
        保 存
    </button>
</form>
    <#else >
    <div class="configdiv">
        <div style="color: red;" >当前表单未配置可填写或选择字段,请先配置相关字段</div>
        <button type="button" class="btn btn-success btnd"
            onclick="javascript:history.back(-1);" ><i class="fa fa-save"></i>
        返 回
    </button>
    </div>
 </#if>

<script>
    function onSubmit() {
        var content=tinymce.activeEditor.getContent();
        $("#formHtml").val(content);


        var url=$("#form1").attr("action");
        $.ajax({
            type:"POST",
            url: url,
            // contentType: "application/json", //如果提交的是json数据类型，则必须有此参数,表示提交的数据类型
            data:$('#form1').serialize(),
            success:function(data) {
                if (data.code == 200) {
                    alert("保存成功");
                    window.opener = null;
                    window.open('', '_self');
                    window.close();
                } else {
                    alert(data.msg);
                }
            }
        });
    }
    $(".tag-editor-tag").click(function () {
        var _val=$(this).attr("data-val");
        tinymce.execCommand('mceInsertContent', false, _val);
    })

</script>
</body>
</html>