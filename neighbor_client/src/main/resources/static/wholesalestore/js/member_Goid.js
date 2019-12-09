/**
 * 修改样式/选项卡
 */
$(document).ready(function(e) {
	$(".all_tab p").click(function(){
		 $(this).addClass("tab_p").siblings().removeClass("tab_p"); //切换选中的按钮高亮状态		 
		 });
	});
