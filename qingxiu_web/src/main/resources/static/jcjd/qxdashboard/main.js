var winSize = {
    width: $(window).width(),
    height: $(window).height(),
    update: function () {
        winSize.width = $(window).width();
        winSize.height = $(window).height();
    }
};
var sceneConfig = {
    orgWidth: 1920,
    orgHeight: 1080,
    width: 1920,
    height: 1080,
    pos: {x: 0, y: 0},
    scale: 1,
    scaleY: 1,
    aspectFit: gScreenAspectFit,
    update: function () {
        winSize.update();

        sceneConfig.scale = winSize.width / sceneConfig.orgWidth;
        sceneConfig.scaleY = winSize.height / sceneConfig.orgHeight;
        var msy = sceneConfig.aspectFit ? sceneConfig.scale : sceneConfig.scaleY;

        sceneConfig.width = Math.round(sceneConfig.orgWidth * sceneConfig.scale);
        sceneConfig.height = Math.round(sceneConfig.orgHeight * msy);

        $('.scene').css({
            'top': Math.max((winSize.height - sceneConfig.height) / 2, 0),
            'height': sceneConfig.height
        });

        if (sceneConfig.aspectFit) {
            $('.scene-page').css({
                'transform': 'scale(' + sceneConfig.scale + ')'
            });
        } else {
            $('.scene-page').css({
                'transform': 'scale(' + sceneConfig.scale + ',' + msy + ')'
            });
        }

    }
};
$(window).resize(function () {
    sceneConfig.update();
});
sceneConfig.update();
$(function () {
    sceneConfig.update();
    // $('.counter').countUp();
})

function SceneChart() {
    var charList = {};
    this.getChart = function (containerId) {
        var chart = charList[containerId];
        if (!chart) {
            var o = document.getElementById(containerId);
            if (o) {
                chart = echarts.init(o);
                charList[containerId] = chart;
            }
        }
        return chart;
    };
    this.setChart = function (containerId, options) {
        var chart = this.getChart(containerId);
        if (chart) {
            chart.setOption(options);
        }
    };
    this.clear = function () {
        for (var key in charList) {
            charList[key] = null;
        }
    };
}

var gSceneChart = new SceneChart();
$(window).unload(function () {
    gSceneChart.clear();
});


