/**
 * 截取字符串公共js
 * 
 * @return
 */

function GetQueryString() {	 
	    var sHref = window.location.href;
	    var str=sHref.indexOf("?", "");
	    var str1=sHref.substring(str+1, sHref.length); 
	    var userInfos = new Array();
	    var userValue=new Array();
		if (str1 != null) {
			userInfos = str1.split("&");
		}
	    for(var i = 0; i < userInfos.length; i++ ){ 		   
			 var　str = userInfos[i].split("=");
			 userValue.push(str[1]);
	    }	
		 return userValue;
 }
   function gettitle() { 
		var userInfos = GetQueryString();
		return decodeURI(userInfos[0]);
	  }	    
   function getauthor() { 
	var userInfos = GetQueryString();
	return userInfos[1];
  }
   function getdatdata(){
 	var userInfos = GetQueryString();
	return userInfos[2];    	 
   }