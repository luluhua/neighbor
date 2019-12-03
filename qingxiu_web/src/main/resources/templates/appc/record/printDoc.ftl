<#include "../../common/layout_dl.ftl">
<#--<#include "../../common/layout.ftl">-->
<@header>


    <!-- 打印的样式-->
     <style media="print">
         .tablectx a{
             display: none;
         }
     </style>
    <style>
        .tablectx{
            border: none;
        }
        .tablectx td{
            line-height: 200%;
            padding-left: 10px;
        }
        .tablectx .table{
            border: none;
            border-top: 1px solid #333; border-left: 1px solid #333;
        }
        .tablectx .table td{
            border: none;
            border-bottom: 1px solid #333; border-right: 1px solid #333;

        }

        .tablectx img{
            width: 100px;
        }
    </style>
</@header>
<@body>

    <div class="whole">
        <section class="content">
             <div align="center" >
                 <#if (html_str)??>
                     <div id="dy_buttum">
                         <button type="button" class="btn btn-success" onclick="printForm();return fasle;">
                             <i class="fa fa-save"></i>
                             打印
                         </button>
                         <#--<button type="button" class="btn btn-success" id="downlaodWord" >-->
                             <#--<i class="fa fa-save"></i>-->
                             <#--下载-->
                         <#--</button>-->
                         <button type="button" class="btn btn-close" onclick="x_admin_close();return fasle;">
                             <i class="fa fa-save"></i>
                             关闭
                         </button>

                     </div>
                     <div id="table-ctx" class="tablectx">
                         ${(html_str)!''}
                     </div>
                 </#if>
             </div>
        </section>
    </div>
</@body>
<@footer>

   <script type="application/javascript">
       function printForm(){
           document.getElementById("dy_buttum").style.display="none";//隐藏
           if (!!window.ActiveXObject || "ActiveXObject" in window) { //是否ie
               remove_ie_header_and_footer();
           }
           window.print();

           x_admin_close();
           return false;
       }


       function remove_ie_header_and_footer() {
           var hkey_path;
           hkey_path = "HKEY_CURRENT_USER\\Software\\Microsoft\\Internet Explorer\\PageSetup\\";
           try {
               var RegWsh = new ActiveXObject("WScript.Shell");
               RegWsh.RegWrite(hkey_path + "header", "");
               RegWsh.RegWrite(hkey_path + "footer", "");
           } catch (e) {
           }
       }

      </script>
<#--<script src="/plugins/jQuery/jQuery-2.1.4.min.js"></script>-->
<#--<script src="/plugins/wordexport/FileSaver.min.js"></script>-->
<#--<script src="/plugins/wordexport/jquery.wordexport.js"></script>-->
<#--<script>-->
    <#--jQuery(document).ready(function($) {-->
        <#--$("#downlaodWord").click(function(event) {-->
            <#--$("#table-ctx").wordExport("文件");-->
        <#--});-->
    <#--})-->
<#--</script>-->

</@footer>