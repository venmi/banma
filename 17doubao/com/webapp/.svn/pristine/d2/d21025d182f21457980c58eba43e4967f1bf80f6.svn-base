$(function () {
    // alert('111')
    var a = document.getElementById('show');
    var b = document.getElementById('hide');
    b.style.display = 'none'
    a.onclick = function () {
        if (b.style.display != 'block') {
            b.style.display = 'block';
        } else {
            b.style.display = 'none'
            $("#sqsx2").show();
            cleanDlData();
        }


    }

    $("#submit").click(
        function () {
            var ajaxOptions = {
                url: "/handleclaims/apply/submit",
                type: 'post',
                dataType: 'json',
                timeout: 100000,
                cache: false,
                success: function (responseJson) {
                    if (responseJson.success) {
                        alert('good');
                    }
                }
            };
            $("#userapply").ajaxSubmit(ajaxOptions);
        }
    );

    Date.prototype.Format = function(fmt)
    { //author: meizz
        var o = {
            "M+" : this.getMonth()+1,                 //月份
            "d+" : this.getDate(),                    //日
            "h+" : this.getHours(),                   //小时
            "m+" : this.getMinutes(),                 //分
            "s+" : this.getSeconds(),                 //秒
            "q+" : Math.floor((this.getMonth()+3)/3), //季度
            "S"  : this.getMilliseconds()             //毫秒
        };
        if(/(y+)/.test(fmt))
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
        for(var k in o)
            if(new RegExp("("+ k +")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        return fmt;
    }
});
function cleanDlData() {
    $("#sqsx1 div").remove();
    var inputs = $("#dlInfo").find("input");
    inputs.val("");

    $("#nameinsurer1").val(-1);
}

function selectDL(obj) {
    //查询被保险人基本信息
    var inputs = $("#sqsx2").find("input[type=checkbox]:checked");
    inputs.checked=false;
    $("#nameinsurer").val( $("#nameinsurer1").find("option:selected").text());
    var joid = $(obj).children('option:selected').val();
    if (joid == -1) {
        return;
    }
    var url = window.base + "/handleclaims/apply/selectitemDL/" + $("#hid_eid").val() + "/" + joid + "/" + $("#hid_pid").val() + "/" + $("#hid_ecid").val();
    $.get(url, {}, function (result) {
        if (result.success) {
            var obj = eval(result.data);
            var msg = "";
            $(obj).each(function (index) {
                var val = obj[index];
                if (index == 0) {
                    setBaseInfo(val.idcard, val.age, val.career, val.mobile, val.relationship, val.sex,val.birth)
                }
                var count = index + 1;
                if (count == 0 || count % 4 == 1) {
                    msg += "<div class='row'>";
                }
                msg += "<div class='col-md-3'><label>";
                msg += "<input type='checkbox' id=" + val.rid + " value=" + val.rid + " name=\"reporttype\">"
                    + val.responsibilityname + "</label></div>"

                if (count % 4 == 0 || count === obj.length) {
                    msg += "</div>";
                }

            });
            //alert(msg);
            $("#sqsx1").html = "";// 清空数据
            $("#sqsx1").html(msg); // 添加Html内容，不能用Text 或 Val

            $("#sqsx2").hide();
        }
    });

}


//function select
function setBaseInfo(idcard, age, career, mobile, relationship, sex,birth) {
    $("#idnum").val(idcard);
    $("#age").val(age);
    $("#sex").val(sex);
    var birth_date= new Date(birth).Format("yyyy-MM-dd hh:mm:ss")
    $("#birth").val(birth_date);
    if (career == null) {
        $("#career").val("no data");
    } else {
        $("#career").val(career);
    }
    $("#mobile").val(mobile);
    $("#relationship").val(relationship);
}

function remRow(obj) {
    var vNum = $("#TbData tr").filter(".CaseRow").size();//表格有多少个数据行;
    if (vNum == 1) {
        alert('请至少留一行');
        return;
    }
    // var vbtnDel=$(obj);//得到点击的按钮对象
    //alert();
    //var vTr=vbtnDel.parent("td").parent("tr");//得到父tr对象;
    //alert($(this).parents("tr").attr("id"));
    var vtr = $(obj).parent().parent().parent().parent();
    if (vtr.attr("id") == "one_tr") {
        alert('第一行不能删除!'); //第一行是克隆的基础，不能删除
        return;
    } else {
        vtr.remove();
    }
}
function AddRow() {
    var vTb = $("#TbData");//得到表格ID=TbData的jquery对象
    //所有的数据行有一个.CaseRow的Class,得到数据行的大小
    var size = $("#TbData tr").filter(".CaseRow").size();
    var vNum = size + 1;//表格有多少个数据行
    var vTr = $("#TbData #one_tr"); //得到表格中的第一行数据 v
    var vTrClone = vTr.clone(true);//创建第一行的副本对象vTrClone
    cleanAttr(vTrClone, size);
    vTrClone[0].id = "trDataRow" + vNum;//設置 第一個Id為當前獲取索引；防止重複添加多個ID為trDataRow1的數據行；一次添加一個；

    var curdate = vTrClone.find("div #form_date");//.find("#ss_date");
    var id_d = "ss_date" + vNum;
    curdate.attr("id", "formdate" + vNum);
//                    curdate.find("#ss_date").attr("id",id_d);
    curdate.html(getDateInput(id_d, size));
    vTrClone.appendTo(vTb);//把副本单元格对象添加到表格下方
}

function cleanAttr(vTrClone, index) {
    var inputs = vTrClone.find("input");
    var rexts = vTrClone.find("textarea");
    //alert(vTrClone.find("div #form_date").attr("onclick"));
    for (var i = 0; i < inputs.length; i++) {
        var input = $(inputs[i]);
        var name = input.attr("name").replace("0", index);
        input.attr("name", name);
    }

    for (var i = 0; i < rexts.length; i++) {
        var rext = $(rexts[i]);
        var name = rext.attr("name").replace("0", index);
        rext.attr("name", name);
    }

    inputs.val("");
    rexts.val("");
}
function getDateInput(id, index) {
    var span = "<span class='input-group-addon' id='basic-addon1'>\u5c31\u8bca/\u65f6\u95f4\u65e5\u671f</span>"
    var inputstr = "<input class='form-control' name='accidentDataInfos[" + index + "].datavisit'  onfocus='setCurDate(this)' size='16' id='" + id + "' type='text' value='' readonly />";
    var span1 = "<span class='input-group-addon'>"
        + "<span class='glyphicon  glyphicon-remove'></span>"
        + " </span>" + "<span class='input-group-addon'>" + "<span class='glyphicon glyphicon-calendar'></span>"
        + "</span>";
    return span + inputstr;
}


function setCurDate(obj) {
    $(obj).datepicker({
        format: 'mm-dd-yyyy',
        language: "zh-CN",
        weekStart: 1,
        autoclose: true
    })
}