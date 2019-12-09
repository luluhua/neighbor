<#include "../common/layout.ftl">
<@header>
</@header>
<@body>
<div class="content-wrapper">
  <!-- Main content -->
  <section class="content">
    <div class="error-page">
       <div>
        <h2 class="headline text-yellow">  <i class="fa fa-warning text-yellow"></i>温馨提示</h2>
            <p> ${(errorMsg)!''}</p>
           <br/>
           <a href="/index" class="btn btn-primary">返回首页</a>或刷新页面重试！
      </div><!-- /.error-content -->
    </div><!-- /.error-page -->
  </section><!-- /.content -->
</div><!-- /.content-wrapper -->
</@body>
<@footer>
</@footer>

