if (typeof (activity) == 'undefined') {
    window.activity = {
        location: function () {
            window.location.href = document.referrer;
        },
        getHeader: function () {

            return document.referrer;
        },

    }
}
$(document).ready(function () {
    var url = document.location.toString();
    var arrUrl = url.split("//");

    var start = arrUrl[1].indexOf("/");
    var relUrl = arrUrl[1].substring(start);//stop省略，截取从start开始到结尾的所有字符

    if (relUrl.indexOf("?") != -1) {
        relUrl = relUrl.split("?")[0];
    }
    $('[name="header"]').val(relUrl);
});
