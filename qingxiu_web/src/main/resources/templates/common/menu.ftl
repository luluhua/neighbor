<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(me.avatarUrl)!}"
                     class="img-circle">
            </div>
            <div class="pull-left info">
                <p>${(me.username)!'游客'}</p>
                <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
            </div>
        </div>
        <!-- search form -->
    <#--<form action="#" method="get" class="sidebar-form">-->
    <#--<div class="input-group">-->
    <#--<input type="text" name="q" class="form-control" placeholder="Search...">-->
    <#--<span class="input-group-btn">-->
    <#--<button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>-->
    <#--</span>-->
    <#--</div>-->
    <#--</form>-->
        <!-- /.search form -->

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
            <!-- Optionally, you can add icons to the links -->
            <li class="header">手上青秀</li>
     <#if treeMenus??>
         <#list treeMenus as vo>
		     <li class="treeview <#if res?? && vo.sysMenu.id==res> active </#if> ">
                 <a href="#"><i class="fa ${(vo.sysMenu.icon)!}"></i>
                     <span>${(vo.sysMenu.menuName)!}</span>
                     <i class="fa fa-angle-left pull-right"></i>
                 </a>
                 <ul class="treeview-menu">
		         <#list vo.children as ch>
                     <#if (ch.sysMenu)??>
                     <li class="<#if cur1?? && ch.sysMenu.id==cur1>active</#if>">
                         <a href="${(ch.sysMenu.url)!}<#if "${(ch.sysMenu.url)}"?index_of("?")<0>?<#else>&</#if>p=${(vo.sysMenu.id)!}&p1=${(ch.sysMenu.pid)!}&t=${(ch.sysMenu.id)!}"
                            style="<#if cur?? && ch.sysMenu.id==cur> color: white </#if>"><i
                                 class="fa ${(ch.sysMenu.icon)!}"></i> ${(ch.sysMenu.menuName)!}
                             <#if (ch.children[0].sysMenu)??>
                                  <i class="fa fa-angle-left pull-right"></i>
                             </#if>
                         </a>
                                    <#if (ch.children[0].sysMenu)??>
                                     <ul class="treeview-menu">
                                      <#list ch.children as c>
                                          <li>
                                              <a href="${(c.sysMenu.url)!}<#if "${(c.sysMenu.url)}"?index_of("?")<0>?<#else>&</#if>p=${(vo.sysMenu.id)!}&p1=${(c.sysMenu.pid)!}&t=${(c.sysMenu.id)!}"
                                                 style="<#if cur?? && c.sysMenu.id==cur> color: white </#if>"> <i
                                                      class="fa ${(c.sysMenu.icon)!}"></i> ${(c.sysMenu.menuName)!}
                                              </a>
                                          </li>
                                      </#list>
                                     </ul>
                                    </#if>

                     </li>
                     </#if>
                 </#list>
                 </ul>
             </li>
         </#list>
     </#if>

            <li class="header">个人中心</li>
            <li class="treeview">
                <a href="/system/me/info"><i class="fa fa-user"></i>
                    <span>个人信息</span>
                </a>
            </li>
            <li class="treeview">
                <a href="/system/me/pwd"><i class="fa fa-key"></i>
                    <span>修改密码</span>
                </a>
            </li>
        </ul><!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</aside>