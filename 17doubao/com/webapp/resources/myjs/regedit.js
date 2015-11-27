$(function () {
    $("#regBtn").click(function () {
        var ajaxOptions = {
            url: window.base + "/api/userReg",
            type: 'post',
            dataType: 'json',
            timeout: 100000,
            cache: false,
            success: function (responseJson) {
                if (responseJson.success) {
                    location.href = window.base + "/index";
                } else {
                    alert(responseJson.msg)
                }
            }
        };
        $("#regForm").ajaxSubmit(ajaxOptions);
    });

});