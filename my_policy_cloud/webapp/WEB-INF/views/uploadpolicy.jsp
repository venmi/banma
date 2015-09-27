<%@ page import="com.bm.insurance.cloud.util.Constant" %>
<%@ page import="com.bm.insurance.personal.cloud.util.SessionUtil" %>
<%@ page import="com.bm.insurance.cloud.orm.entity.PersonalUserAccount" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: yutao
  Date: 2015/8/27
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="common/header.jsp"/>
</head>
<body>
<!-- 右侧浮动区 -->
<jsp:include page="common/floatSite.jsp"/>

<!-- 顶头菜单区 -->
<jsp:include page="common/topmenu.jsp"/>

<!-- 头部nav区 -->
<jsp:include page="common/mypolicynav.jsp"/>

<!-- 面包屑 -->
<div class="container">
    <ol class="breadcrumb">
        <li>
            <a href="<%=request.getContextPath()%>/my/policy/10">我的保单</a>
        </li>
        <li class="active">上传保单</li>
    </ol>
</div>

<div class="container">
    <div class="upload_policy">
        <div class="title">
            <h2>上传保单</h2>

            <p>保单云生成保单电子档案，建立保险账户，专家解读随时随地了解家人保障情况！</p>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="remind">
                    请仔细查看各项内容，准确的信息有助于我们更好的服务。
                </div>
            </div>
            <div class="col-md-9">
                <div class="content" style="border-left: 1px solid #ddd;">
                    <div id="progress" class="progress">
                        <div class="progress-bar progress-bar-success"></div>
                    </div>

                    <form action="">

                        <div class="upload_file">
                            <div class="tag">上传保单首页</div>
                            <input type="file" id="sybd" name="bin" multiple>

                            <div class="file_img_cen" id="syimgs">
                            </div>
                        </div>

                        <div class="upload_file">
                            <div class="tag">上传投保信息</div>
                            <input type="file" id="nrbd" name="bin" multiple>

                            <div class="file_img_cen" id="nrimgs">
                            </div>
                        </div>

                        <div class="upload_file">
                            <div class="tag">上传信息变更页</div>
                            <input type="file" id="bgbd" name="bin" multiple>

                            <div class="file_img_cen" id="bgimgs">
                            </div>
                        </div>

                        <div class="preservation">
                            <div class="row">
                                <div class="col-xs-8">
                                    <a type="button" id="saveBtn">保存并上传保单</a>
                                </div>
                                <div class="col-xs-4">
                                    <a class="btn_gray" type="button" href="<%=request.getContextPath()%>/my/policy/10">取消</a>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 底部 -->
<jsp:include page="common/footer.jsp"/>

<script src="<%=request.getContextPath()%>/resources/js/upload/js/jquery.ui.widget.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/upload/js/jquery.iframe-transport.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/upload/js/jquery.fileupload.js"></script>
<script>
    <%
        PersonalUserAccount personalUserAccount = (PersonalUserAccount)SessionUtil.getSessionInfo(Constant.PERSONAL_USER_KEY);
    %>

    function deleteImg(id){
        $("#" + id).remove();
    }

    $(function () {

        $("#progress").hide();

        $('#sybd').fileupload({
            autoUpload: true,//是否自动上传
            url: "<%=request.getContextPath()%>/upload/up/<%=Constant.UP_USER_TYPE_PERSONAL%>/<%=Constant.UP_FILE_TYPE_IMG%>/<%=Constant.DJ_TYPE_SY%><%=Constant.SPLIT_CHAR3%><%=personalUserAccount.getId()%>",
            dataType: 'json',
            done: function (e, data) {//设置文件上传完毕事件的回调函数
                var result = data.result;
                if (result.success) {
                    var imgResponse = result.data;

                    var html = '<div class="file_img" id="'+imgResponse.id +'">' +
                            '<div class="delete"><a href="javascript:deleteImg(\''+imgResponse.id +'\')">删除</a></div>' +
                            '<a href="<%=request.getContextPath()%>/upload/down/' + imgResponse.userType + '/' + imgResponse.fileType + '/' + imgResponse.childFileType + '/' + imgResponse.date + '/' + imgResponse.id + '" target="_blank">' +
                            '<img src="<%=request.getContextPath()%>/upload/down/' + imgResponse.userType + '/' + imgResponse.fileType + '/' + imgResponse.childFileType + '/' + imgResponse.date + '/' + imgResponse.id + '"></a></div>';
                    $("#syimgs").empty().append(html);
                }
            },
            add: function (e, data) {
                $("#progress").show();
                data.process().done(function () {
                    data.submit();
                });
            },
            progressall: function (e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#progress .progress-bar').css(
                        'width',
                        progress + '%'
                );
                $("#progress").fadeOut("slow");
            }
        });

        $('#nrbd').fileupload({
            autoUpload: true,//是否自动上传
            url: "<%=request.getContextPath()%>/upload/up/<%=Constant.UP_USER_TYPE_PERSONAL%>/<%=Constant.UP_FILE_TYPE_IMG%>/<%=Constant.DJ_TYPE_NR%><%=Constant.SPLIT_CHAR3%><%=personalUserAccount.getId()%>",
            dataType: 'json',
            done: function (e, data) {//设置文件上传完毕事件的回调函数
                var result = data.result;
                if (result.success) {
                    var imgResponse = result.data;
                    var html = '<div class="file_img" id="'+imgResponse.id +'">' +
                            '<div class="delete"><a href="javascript:deleteImg(\''+imgResponse.id +'\')">删除</a></div>' +
                            '<a href="<%=request.getContextPath()%>/upload/down/' + imgResponse.userType + '/' + imgResponse.fileType + '/' + imgResponse.childFileType + '/' + imgResponse.date + '/' + imgResponse.id + '" target="_blank">' +
                            '<img src="<%=request.getContextPath()%>/upload/down/' + imgResponse.userType + '/' + imgResponse.fileType + '/' + imgResponse.childFileType + '/' + imgResponse.date + '/' + imgResponse.id + '"></a></div>';
                    $("#nrimgs").append(html);
                }
            },
            add: function (e, data) {
                $("#progress").show();
                data.process().done(function () {
                    data.submit();
                });
            },
            progressall: function (e, data) {
                $("#progress").show();
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#progress .progress-bar').css(
                        'width',
                        progress + '%'
                );
                $("#progress").fadeOut("slow");
            }
        });

        $('#bgbd').fileupload({
            autoUpload: true,//是否自动上传
            url: "<%=request.getContextPath()%>/upload/up/<%=Constant.UP_USER_TYPE_PERSONAL%>/<%=Constant.UP_FILE_TYPE_IMG%>/<%=Constant.DJ_TYPE_BG%><%=Constant.SPLIT_CHAR3%><%=personalUserAccount.getId()%>",
            dataType: 'json',
            done: function (e, data) {//设置文件上传完毕事件的回调函数
                var result = data.result;
                if (result.success) {
                    var imgResponse = result.data;
                    var html = '<div class="file_img" id="'+imgResponse.id +'">' +
                            '<div class="delete"><a href="javascript:deleteImg(\''+imgResponse.id +'\')">删除</a></div>' +
                            '<a href="<%=request.getContextPath()%>/upload/down/' + imgResponse.userType + '/' + imgResponse.fileType + '/' + imgResponse.childFileType + '/' + imgResponse.date + '/' + imgResponse.id + '" target="_blank">' +
                            '<img src="<%=request.getContextPath()%>/upload/down/' + imgResponse.userType + '/' + imgResponse.fileType + '/' + imgResponse.childFileType + '/' + imgResponse.date + '/' + imgResponse.id + '"></a></div>';
                    $("#bgimgs").append(html);
                }
            },
            add: function (e, data) {
                $("#progress").show();
                data.process().done(function () {
                    data.submit();
                });
            },
            progressall: function (e, data) {
                $("#progress").show();
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#progress .progress-bar').css(
                        'width',
                        progress + '%'
                );
                $("#progress").fadeOut("slow");
            }
        });


        $("#saveBtn").click(function () {
            var subObj = {};
            var syids = [];
            $("#syimgs img").each(function () {
                syids.push($(this).attr("src"));
            });

            var nrids = [];
            $("#nrimgs img").each(function () {
                nrids.push($(this).attr("src"));
            });

            var bgids = [];
            $("#bgimgs img").each(function () {
                bgids.push($(this).attr("src"));
            });

            if (syids.length == 0 || nrids.length == 0 || bgids.length == 0) {
                alert("您的保单拍照未上传，确认完毕后，请再次点击上传按钮。");
                return;
            }

            subObj.syids = syids;
            subObj.nrids = nrids;
            subObj.bgids = bgids;
            ajaxCommon("<%=request.getContextPath()%>/uploadPolicy", subObj, function (response) {
                if (response.success) {
                    window.location.href = "/my/policy/10";
                }
            }, function (response) {
                alert(response.msg)
            })
        });


    });
</script>
</body>
</html>