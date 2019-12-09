// JavaScript Document
  function xiugaininc(){
	  $(".name").fadeOut(0);
	    $(".name_hidden").fadeIn(0);
  }
 function name_hidden(){
	  $(".name_hidden").fadeOut(0);
	    $(".name").fadeIn(0);
	 
 }
 
 /*修改性别*/
function gender(){
   $(".gender").fadeOut(0);
   $(".gender_hidden").fadeIn(0);
 }

function gender_qx(){
   $(".gender_hidden").fadeOut(0);
   $(".gender").fadeIn(0);
 }

/*修改手机*/
function phone(){
  $(".phone").fadeOut(0);
  $(".phone_hidden").fadeIn(0);
}

function phone_qx(){
  $(".phone_hidden").fadeOut(0);
  $(".phone").fadeIn(0);
}


/*修改邮箱*/
function email(){
  $(".email").fadeOut(0);
  $(".email_hidden").fadeIn(0);
}

function email_qx(){
  $(".email_hidden").fadeOut(0);
  $(".email").fadeIn(0);
}

/*修改地址*/
function add(){
  $(".add").fadeOut(0);
  $(".add_hidden").fadeIn(0);
}

function add_qx(){
  $(".add_hidden").fadeOut(0);
  $(".add").fadeIn(0);
}


//首页分类
	$(document).ready(function(e) {
		var usertype = getTypeByCookie();
		if(usertype != "shop"){
			window.location.href=" index.html";
		}
		

	$(".class_icon").click(function(){
		$(".in_left dl").slideToggle(0);
	});


  /*修改姓名*/
//  $(".name a").click(function(){
//    $(".name").fadeOut(0);
//    $(".name_hidden").fadeIn(0);
//  });
  

//
//  $(".name_qx").click(function(){
//    $(".name_hidden").fadeOut(0);
//    $(".name").fadeIn(0);
//  });

  /*修改性别*/
//  $(".gender a").click(function(){
//    $(".gender").fadeOut(0);
//    $(".gender_hidden").fadeIn(0);
//  });
//
//  $(".gender_qx").click(function(){
//    $(".gender_hidden").fadeOut(0);
//    $(".gender").fadeIn(0);
//  });


//  /*修改手机*/
//  $(".phone a").click(function(){
//    $(".phone").fadeOut(0);
//    $(".phone_hidden").fadeIn(0);
//  });
//
//  $(".phone_qx").click(function(){
//    $(".phone_hidden").fadeOut(0);
//    $(".phone").fadeIn(0);
//  });


//  /*修改邮箱*/
//  $(".email a").click(function(){
//    $(".email").fadeOut(0);
//    $(".email_hidden").fadeIn(0);
//  });
//
//  $(".email_qx").click(function(){
//    $(".email_hidden").fadeOut(0);
//    $(".email").fadeIn(0);
//  });
  
//  /*修改地址*/
//  $(".add a").click(function(){
//    $(".add").fadeOut(0);
//    $(".add_hidden").fadeIn(0);
//  });
//
//  $(".add_qx").click(function(){
//    $(".add_hidden").fadeOut(0);
//    $(".add").fadeIn(0);
//  });
//  

  

//搜索下拉
    $('.drop-down .span').click(function(){
      $(this).next().slideToggle();
      })
      
    $('.chose .curt').click(function(){
      var val=$(this).text();
      $(this).parent().prev().prev().text(val)
      $(this).parent().hide()
      })

  

  //获取修改密码验证码
  var validCode=true;
  $(".phone_hidden button").click (function  () {
    var time=30;
    var code=$(this);
    if (validCode) {
      validCode=false;
      code.addClass("msgs1");
    var t=setInterval(function  () {
      time--;
      code.html(time+"秒");
      if (time==0) {
        clearInterval(t);
      code.html("重发");
        validCode=true;
      code.removeClass("msgs1");
      }
    },1000)
    }
  })



//加入购物车定位底部 
        var mt = 0;
        window.onload = function () {
            var mydiv = document.getElementById("infor_cart");
            if(mydiv!=null){
            var mt = mydiv.offsetTop;
            window.onscroll = function () {
                var t = document.documentElement.scrollTop || document.body.scrollTop;
                if (t > mt) {
                    mydiv.style.position = "fixed";
                    mydiv.style.bottom = "20px";
                }
                else {
                    mydiv.style.position = "static";
                }
            }
            }
        }
});
	
	
	function GOuser_home(){
		var userid = getUserIdByCookie();
		window.open("./member.html?id="+userid,"_blank") 
	}
	
	function xuanze(){
	    $('.go').click(function(){
		      $(this).next().slideToggle();
		      })
		      
		    $('.color_curt').click(function(){
		      var val=$(this).text();
		      $(this).parent().prev().prev().text(val)
		      $(this).parent().hide()
		      })
	}