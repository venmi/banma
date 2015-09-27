$(function () {
    $('.disable a').removeAttr('href'); //去掉a标签中的href属性
    $('.disable a').removeAttr('onclick'); //去掉a标签中的onclick事件

    //wechat
    $('.wechat_qrcode_btn a').hover(function () {
        /* Stuff to do when the mouse enters the element */
        $('.wechat_qrcode').show('slow/500/fast');
    }, function () {
        /* Stuff to do when the mouse leaves the element */
        $('.wechat_qrcode').hide('slow/500/fast');
    });

    //edit_photo
    $('.user_center .side .pic a').hover(function () {
        /* Stuff to do when the mouse enters the element */
        $('.user_center .side .pic .edit_photo').show();
    }, function () {
        /* Stuff to do when the mouse leaves the element */
        $('.user_center .side .pic .edit_photo').hide();
    });
});
Date.prototype.Format = function (date, fmt) { //author: meizz
    fmt = fmt || 'yyyy-MM-dd hh:mm:ss';
    var o = {
        "M+": date.getMonth() + 1,
        "d+": date.getDate(),
        "h+": date.getHours(),
        "m+": date.getMinutes(),
        "s+": date.getSeconds(),
        "q+": Math.floor((date.getMonth() + 3) / 3),
        "S": date.getMilliseconds()
    };
    if (/(y+)/.test(fmt))
        fmt = fmt.replace(RegExp.$1, (date.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
};

function ajaxCommon(url, data, success,error) {
    $.ajax({
        url: url,
        type: 'post',
        data: JSON.stringify(data),
        contentType: "application/json",
        dataType: 'json',
        success: function (responseJson) {
            if (responseJson.success) {
                success(responseJson);
            } else {
                error(responseJson);
            }
        },
        error: function () {
            alert("请求超时错误");
        }
    });
}