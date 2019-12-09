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
    $('[name="header"]').val(document.referrer);
});

