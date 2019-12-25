<div class="head">
    <a href="${ctx}/index" class="logo">
        <img src="${ctx}/wholesalestore/images/logo.png">
    </a>

    <!--搜索-->
    <div class="search">
        <input type="text" id="SearchGoods" onkeypress="if (event.keyCode == 13) searchSkip();" placeholder="Search"
               class="text"/>
        <input type="button" value="搜索" class="button" onclick="searchSkip()" title="搜索">
    </div>


    <!--加入购物车-->
    <div class="cart">
        <a href="${ctx}/resource/form">我有资源</a>
    </div>
    <!--end-->
</div>