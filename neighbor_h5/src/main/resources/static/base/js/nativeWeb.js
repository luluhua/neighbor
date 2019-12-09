if (typeof (nativeWeb) == 'undefined') {
    window.nativeWeb = {
        toast: function (msg) {
            if (window['webkit']) {
                window.webkit.messageHandlers.toast.postMessage(msg);
            } else {
                mui.toast(msg, {duration: '3500ms', type: 'div'})
            }
        },
        finish: function () {
            if (window['webkit']) {
                window.webkit.messageHandlers.finish.postMessage(null);
            }
        },
        isAuthenticated: function () {
            if (window['webkit']) {
                try {
                    window.webkit.messageHandlers.isAuthenticated.postMessage(null);
                } catch (e) {
                    mui.toast('升级中', {duration: '3500ms', type: 'div'})
                }
            }
        },
        showLoading: function (msg) {
            if (window['webkit']) {
                try {
                    window.webkit.messageHandlers.showLoading.postMessage(msg);
                } catch (e) {
                    mui.toast('升级中', {duration: '3500ms', type: 'div'})
                }
            } else {
                mui.toast(msg, {duration: '3500ms', type: 'div'})
            }
        },
        closeLoading: function () {
            if (window['webkit']) {
                try {
                    window.webkit.messageHandlers.closeLoading.postMessage();
                } catch (e) {
                    mui.toast('升级中', {duration: '3500ms', type: 'div'})
                }
            }
        },
        gotoLogin: function () {
            if (window['webkit']) {
                try {
                    window.webkit.messageHandlers.gotoLogin.postMessage(null);
                } catch (e) {
                    mui.toast('升级中', {duration: '3500ms', type: 'div'})
                }
            } else {
                mui.toast('未登录', {duration: '3500ms', type: 'div'})
            }
        },
        getEncodedFile: function (fileKey) {
            //打開app文件獲取base64
        },
        isWriteExternalStorage: function () {

        },
        gotoRealNameAuthentication: function () {
            //跳转实名认证
            if (window['webkit']) {
                try {
                    window.webkit.messageHandlers.gotoRealNameAuthentication.postMessage(null);
                } catch (e) {
                    mui.toast('升级中', {duration: '3500ms', type: 'div'})
                }
            } else {
                mui.toast('升级中', {duration: '3500ms', type: 'div'})
            }
        },
        getCoordinate: function () {
            //获取坐标
            if (window['webkit']) {
                try {
                    window.webkit.messageHandlers.getCoordinate.postMessage(null);
                } catch (e) {
                    mui.toast('升级中', {duration: '3500ms', type: 'div'})
                }
            } else {
                mui.toast('升级中', {duration: '3500ms', type: 'div'})
            }
        },
        getToken: function () {
            //获取客户端token
            if (window['webkit']) {
                try {
                    window.webkit.messageHandlers.getToken.postMessage(null);
                } catch (e) {
                    mui.toast('升级中', {duration: '3500ms', type: 'div'})
                }
            } else {
                mui.toast('升级中', {duration: '3500ms', type: 'div'})
            }
        },
        getPhotoUpload: function () {
            if (window['webkit']) {
                try {
                    window.webkit.messageHandlers.getPhotoUpload.postMessage(null);
                } catch (e) {
                    mui.toast('升级中', {duration: '3500ms', type: 'div'})
                }
            } else {
                mui.toast('升级中', {duration: '3500ms', type: 'div'})
            }
        },
        dowmLoadApp: function (downUrl) {
            if (window['webkit']) {
                try {
                    // window.webkit.messageHandlers.gotoLogin.postMessage(null);
                    window.webkit.messageHandlers.dowmLoadApp.postMessage(downUrl);
                } catch (e) {
                    mui.toast('升级中', {duration: '3500ms', type: 'div'})
                }
            }
        },
        gotoAppDownUrlOrAppJumpUrl: function (downUrl, jumpUrl) {
            if (window['webkit']) {
                try {
                    window.webkit.messageHandlers.gotoAppDownUrlOrAppJumpUrl.postMessage("?downUrl=" + downUrl + "&jumpUrl=" + jumpUrl);
                } catch (e) {
                    mui.toast('升级中', {duration: '3500ms', type: 'div'})
                }
            }
        },
        gotoMap: function (lat, lng, address) {
            if (window['webkit']) {
                try {
                    window.webkit.messageHandlers.gotoMap.postMessage("?lat=" + lat + "&lng=" + lng + "&address=" + address);
                } catch (e) {
                    mui.toast('升级中', {duration: '3500ms', type: 'div'})
                }
            }
        },
        setWebViewCanGoBack: function (canGoBack) {
            if (window['webkit']) {
                try {
                    window.webkit.messageHandlers.setWebViewCanGoBack.postMessage("?canGoBack=" + canGoBack);
                } catch (e) {
                    mui.toast('升级中', {duration: '3500ms', type: 'div'})
                }
            }
        },
        saveImage: function (imgurl) {
            if (window['webkit']) {
                try {
                    window.webkit.messageHandlers.saveImage.postMessage(imgurl);
                } catch (e) {
                    mui.toast('升级中', {duration: '3500ms', type: 'div'})
                }
            }
        },
        scanQRCode: function (str) {
            if (window['webkit']) {
                try {
                    window.webkit.messageHandlers.scanQRCode.postMessage(str);
                } catch (e) {
                    mui.toast(e);
                    // mui.toast('升级中', {duration: '3500ms', type: 'div'})
                }
            }
        },
        getVersion:function () {
            if (window['webkit']) {
                try {
                    window.webkit.messageHandlers.getVersion.postMessage();
                } catch (e) {

                }
            }
        }
    }
}

/**
 * 二维码识别回调函数
 * @param code 错误码
 * @param msg 错误消息
 * @param data 识别内容
 */
function onScanQRCode(code,msg,data){
    if (code == 0) {
        // mui.toast("code:"+code+"-msg:"+msg+"-data:"+data, {duration: '3500ms', type: 'div'});
        // 扫码功能
        console.log('识别到的QRCode内容是：' + data);
        // mui.toast(data, {duration: '3500ms', type: 'div'});
    } else {
        mui.toast(msg, {duration: '3500ms', type: 'div'});
    }
}
