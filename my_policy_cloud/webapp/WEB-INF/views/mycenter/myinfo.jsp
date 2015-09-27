<%--
  Created by IntelliJ IDEA.
  User: yutao
  Date: 2015/8/22
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="title">个人资料</div>
<p><span>昵称：</span>${myinfo.nickname}</p>

<p><span>姓名：</span>${myinfo.pname}</p>

<p><span>性别：</span>${myinfo.sex}</p>

<p><span>居住地：</span>${myinfo.homeaddress}</p>

<p><span>手机：</span>${myinfo.mobile}<%--<a href="">修改手机号码</a>--%></p>

<p><span>身份证：</span>${myinfo.idcard}</p>

<p id="email"><span>邮箱：</span>${myinfo.email}<%-- <input type="button" id="alteremail" value="更换邮箱"/>--%></p>


<script language="javascript">
    $(function () {
        //修改昵称
        $("#alternickname").click(function () {
            var name = $("#alternickname");
            var btn = name.val();
            if (btn == '修改昵称') {
                var v = name.html();
                name.empty().append("<input type='text' value='" + v + "'/>");
                $("#alternickname").val('确认');
            } else if (btn == '确认') {
                var v = $("#nicknamespan").find("input").val();
                $.post(window.base + "/center/alternickname", {"nickname": v}, function (msg) {
                    if (msg.success) {
                        $("#nicknamespan").empty().append(v);
                        $("#alternickname").val('修改昵称');
                    } else {
                        alert('修改失败,请稍后重试!');
                    }
                })
            }
        });
    })

</script>



