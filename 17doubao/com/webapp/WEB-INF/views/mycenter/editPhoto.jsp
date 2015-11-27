<%@ page import="com.bm.insurance.cloud.util.Constant" %>
<%@ page import="com.bm.insurance.personal.cloud.util.SessionUtil" %>
<%@ page import="com.bm.insurance.cloud.orm.entity.PersonalUserAccount" %>
<%--
  Created by IntelliJ IDEA.
  User: yutao
  Date: 2015/8/22
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="content edit_photo">
    <div class="title">修改个人头像</div>
    <div class="upload_cen">
        <div class="row">
            <div class="col-md-9">
                <div class="upload_border">
                    <input type="file" name="bin" id="doc" multiple>
                    <button type="">选择头像</button>
                    <p>支持JPG，jpeg，gif，png，bmp格式的图片</p>
                    <button type="button" id="saveHeaderImgBtn">确定</button>
                </div>
            </div>
            <div class="col-md-3">
                <div id="localImag">
                    <img id="preview" src="" width="150" height="150" style="display: block; width: 150px; height: 180px;"></div>
            </div>
        </div>
    </div>
</div>
<%
    PersonalUserAccount personalUserAccount = (PersonalUserAccount) SessionUtil.getSessionInfo(Constant.PERSONAL_USER_KEY);
%>
<script>
    $(function () {
        //修改个人头像
        $('#doc').fileupload({
            autoUpload: true,//是否自动上传
            url: "<%=request.getContextPath()%>/upload/up/<%=Constant.UP_USER_TYPE_PERSONAL%>/<%=Constant.UP_FILE_TYPE_IMG%>/<%=personalUserAccount.getId()%>",
            dataType: 'json',
            done: function (e, data) {//设置文件上传完毕事件的回调函数
                var result = data.result;
                if (result.success) {
                    var imgResponse = result.data;
                    $("#preview").attr("src", "<%=request.getContextPath()%>/upload/down/" + imgResponse.userType + '/' + imgResponse.fileType + '/' + imgResponse.date + '/' + imgResponse.id);
                }
            }
        });

        $("#saveHeaderImgBtn").click(function () {
            var imgPath = $("#preview").attr("src");
            if(imgPath) {
                $.post("<%=request.getContextPath()%>/center/saveHeader",{img:imgPath},function(response){
                    if(response.success){
                        window.location.href = window.base + "/center";
                    }else{
                        alert(response.msg);
                    }
                })
            }else{
                alert("请上传头像图片");
            }
        });
    })

</script>