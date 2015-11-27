<%--
  Created by IntelliJ IDEA.
  User: yutao
  Date: 2015/8/22
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="content modify_password">
    <div class="title">修改密码</div>
    <div class="row">
        <div class="col-md-6">
            <form class="cmxform" id="signupForm" method="get" action="" novalidate="novalidate">
                <fieldset>
                    <p>
                        <label for="oldpwd">原密码</label>
                        <input type="password" class="form-control mobile_phone pull-left" id="oldpwd" name="oldpwd" placeholder="请输入原密码"></p>

                    <p>
                        <label for="newpwdagin">新密码</label>
                        <input type="password" class="form-control mobile_phone pull-left" id="newpwdagin" name="newpwdagin" placeholder="请输入新密码"></p>

                    <p>
                        <label for="confirm_password">再确认</label>
                        <input type="password" class="form-control mobile_phone pull-left" id="confirm_password" name="confirm_password" placeholder="再次输入新密码"></p>

                    <p>
                        <input class="submit btn btn-warning" type="button" id="alterpwd" value="确认修改"></p>
                </fieldset>
            </form>
        </div>
        <div class="col-md-6"></div>
    </div>
</div>


<script language="javascript">

    $(function () {
        $("#alterpwd").click(function () {
            $.post(window.base + "/center/alterpwd",{
                "oldpwd": $("#oldpwd").val(),
                "newpwd": $("#newpwd").val(),
                "newpwdagin": $("#newpwdagin").val()
                },function (msg) {
                    if (msg.success) {
                        alert(msg.msg)
                    }
                })
            }
        )
    })


</script>