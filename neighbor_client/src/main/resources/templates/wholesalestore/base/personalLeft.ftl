<div class="left">
    <p>个人中心</p>
    <ul class="menu_ul">
        <li><a href="${ctx}/resource/info?p=info" <#if res?? && "info"==res> class="menu_a" </#if> >个人资料</a></li>

        <li><a href="${ctx}/resource/ex?p=ex" <#if res?? && "ex"==res> class="menu_a" </#if> >我的资源</a></li>

        <li><a href="javascript:void">我的收藏</a></li>

        <li><a href="${ctx}/message/list/1?p=ge" <#if res?? && "ge"==res> class="menu_a" </#if>>我的消息</a></li>

        <li><a href="javascript:void">修改密码</a></li>

        <li><a href="javascript:void">认证信息</a></li>

    </ul>
</div>