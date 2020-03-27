<#include "../../common/layout_dl.ftl">
<@header>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/css.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx}/wholesalestore/css/style.css"/>
</@header>
<@js>
</@js>
<@body>

<!--联系我们-->

    <#include "../base/contact.ftl">
<!--顶部-->
    <#include "../base/topHtml.ftl">

<!--头部-->
    <#include "../base/head.ftl">

<nav>
</nav>
<!--产品-->
<div class="product">

    <div class="pr_infor">
        <a class="collect-icon no_col" data-placement="bottom"
           data-tiggle="noTooltip"
           data-submit-url="${ctx}/goodsCollect/operation?id=${(goods.id)!}"><span></span>收藏</a>
        <dl>
            <dt>
                <img id="proimg" data-magnify="gallery" data-group="1"
                     data-src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(goods.images)!'--'}"
                     src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${(goods.images)!'--'}">
            </dt>
            <#if (goods.files)?? && goods.files!="">
                <#list goods.files?split(",") as fi>
                     <dd class="fuy">
                         <img data-group="1"
                              data-src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${fi}"
                              src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${fi}">
                     </dd>
                </#list>
            </#if>
        </dl>

        <div class="infor_fr">
            <h1>${(goods.name)!}</h1>
            <h2>${(goods.specification)!}</h2>
            <div class="com_div">
                <p>数量：</p>
                <div class="color_box">
                    <div class="colorA" id="fortinct">${(goods.quantity)!}</div>
                </div>
            </div>
            <div class="clear"></div>
            <div class="com_div">
                <p><#if goods.priceType==0>单价<#else >总价</#if>：</p>
                <span>￥${(goods.price)!}/天</span>
            </div>
            <div class="clear"></div>

            <!--选择尺寸-->
            <div class="com_div">
                <p>规格：</p>
                <div class="color_box">
                    <div class="colorA" id="forsize">${(goods.specification)!}</div>
                </div>
            </div>
            <div class="com_div">
                <p>联系人：</p>
                <div class="color_box">
                    <div class="colorA" id="forsize">${(users.nickname)!'未实名'}</div>
                </div>
            </div>
            <div class="clear"></div>
            <div class="infor_cart" id="infor_cart">
                <a href="javascript:void(0)">联系TA</a>
                <a href="javascript:void(0)" class="color">租用</a>


            </div>
        </div>
    </div>

    <div class="productA">
        <div class="datails">
            <div class="datailsA">
                <ul>
                    <li><p>所在地址：</p>
                        <span id="brand">
                            ${(goods.location)!"未填写"}
                        </span>
                    </li>
                    <li><p>状态：</p><span id="size">闲置</span></li>

                    <li><p>评分：</p><span id="models">${(score)!"0"}分</span></li>

                    <li><p>成交次数：</p><span id="tinct">2</span></li>


                </ul>
              <#if (goods.files)?? && goods.files!="">
                  <#list goods.files?split(",") as fi>
                    <div class="datails_img">
                        <img data-magnify="gallery" data-group="2"
                             data-src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${fi}"
                             src="<@commonTags method="tagHtpImgURL" type="1" value="1">${(tagHtpImgURL)!}</@commonTags>${fi}">
                    </div>
                  </#list>
              </#if>
            </div>

            <h5 id="comments_h5" class="datails_h5">产品评价</h5>
            <iframe id="iframe2" name="iframe2"
                    src="${ctx}/grade//list/1?goodsId=${(goods.id)!}"
                    style="width:100%;" onload="this.height=iframe2.document.body.scrollHeight"
                    frameborder="0" scrolling="no"></iframe>

        </div>
        <!-- 右侧广告 -->
        <div class="right_recomm">

        <#--<h4>产品推荐</h4>-->
        <#--<span id="recommendpro">-->

        <#--<a href="">-->
        <#--<img src="images/pr_01.jpg">-->

        <#--<h3 class="h3A">CycleDesign-CDBG0057</h3>-->

        <#--<h3 class="h3B">自行车包自行车骑行包便携水袋包双肩背包</h3>-->

        <#--<p>￥<span>310</span></p>-->
        <#--</a>-->

        <#--<a href="">-->
        <#--<img src="images/pr_01.jpg">-->

        <#--<h3 class="h3A">CycleDesign-CDBG0057</h3>-->

        <#--<h3 class="h3B">自行车包自行车骑行包便携水袋包双肩背包</h3>-->

        <#--<p>￥<span>310</span></p>-->
        <#--</a>-->

        <#--<a href="">-->
        <#--<img src="images/pr_01.jpg">-->

        <#--<h3 class="h3A">CycleDesign-CDBG0057</h3>-->

        <#--<h3 class="h3B">自行车包自行车骑行包便携水袋包双肩背包</h3>-->

        <#--<p>￥<span>310</span></p>-->
        <#--</a>-->

        <#--<a href="" class="a_border">-->
        <#--<img src="images/pr_01.jpg">-->

        <#--<h3 class="h3A">CycleDesign-CDBG0057</h3>-->

        <#--<h3 class="h3B">自行车包自行车骑行包便携水袋包双肩背包</h3>-->

        <#--<p>￥<span>310</span></p>-->
        <#--</a>-->

        <#--</span>-->
        </div>
    </div>
    <!--end-->
</div>
<!--底部-->
    <#include "../base/footerHtml.ftl">
<!--end-->
</@body>
<@footer>

<script>
    $("*[data-tiggle='noTooltip']").click(function () {
        var dataUrl = $(this).attr("data-submit-url");
        $.post(dataUrl, {}, function (data) {
            if (data.code == 200) {
                if (data.state == 1) {
                    $(".collect-icon").addClass("no_col").siblings().removeClass("is_col");
                    layer.msg(data.msg, {
                        time: 1000,
                        end: function () {
                        }
                    })
                    return true;
                }
                if (data.state == 2) {
                    $(".collect-icon").addClass("is_col").siblings().removeClass("no_col");
                    layer.msg(data.msg, {
                        time: 1000,
                        end: function () {
                        }
                    })
                    return true;
                }
            } else {
                layer.msg("未登录", {
                    time: 1000,
                    end: function () {
                    }
                })
            }
        });
    });

</script>

</@footer>