var username=document.cookie.split(";")[0].split("=")[1];
//JS操作cookies方法!
//写cookies
function setCookie(name,value)
{
var Days = 30;
var exp = new Date();
exp.setTime(exp.getTime() + Days*24*60*60*1000);
document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}
var producttype1;

function pitchon(i){
	producttype1 = i;
	window.location.href="./product.html?type="+producttype1;
}
