$(function () {
    $("#saveBtn").click(function () {
        var ajaxOptions = {
            url: window.base + "/my/shareperson",
            type: 'post',
            dataType: 'json',
            timeout: 100000,
            cache: false,
            success: function (responseJson) {
                if (responseJson.success) {
                    location.href = window.base + "/my/shareperson";
                } else {
                    alert(responseJson.msg)
                }
            }
        };
        $("#savePersonForm").ajaxSubmit(ajaxOptions);
    });

    $("#cancelBtn").click(function () {
        location.href =  window.base +"/my/shareperson"
    })
});
