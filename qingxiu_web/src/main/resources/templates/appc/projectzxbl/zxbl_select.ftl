<#include "../../common/layout.ftl">
<@header>
 <link href="/app/css/zxbl.css" rel="stylesheet"/>
</@header>
<@body>
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <small>手上青秀 > 在线办理</small>
        </h1>
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Your Page Content Here -->
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-body table-responsive no-padding">


                        <div class="grbs_right_center_con xzsp">
                            <!-- 提交按钮 -->
                            <div class="subButtom marginTop">
                                <input name="button1" onclick="ljbl();" type="button" id="submitBtn" value="立即办理">
                            </div>
                        </div>
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div>
        </div>
    </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</@body>
<@footer>
<script>

    function ljbl() {
        window.location.href="/appc/tGovProjectAudit/toOnlineProcessing";
    }
</script>
</@footer>