<%@ page import="com.bm.insurance.cloud.orm.entity.PersonalUserAccount" %>
<%@ page import="com.bm.insurance.personal.cloud.util.SessionUtil" %>
<%@ page import="com.bm.insurance.cloud.util.Constant" %>
<%--
  Created by IntelliJ IDEA.
  User: yutao
  Date: 2015/8/27
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<%
    PersonalUserAccount personalUserAccount = (PersonalUserAccount) SessionUtil.getSessionInfo(Constant.PERSONAL_USER_KEY);
%>

<!-- 面包屑 -->
<div class="container">
    <ol class="breadcrumb">
        <li>
            <a href="<%=request.getContextPath()%>/my/policy/10">我的保单</a>
        </li>
        <li class="active">上传的保单</li>
    </ol>
</div>

<div class="container">
    <div class="upload_policy">
        <div class="title">
            <h2>${pname}&nbsp;上传的保单</h2>

            <p>保单云生成保单电子档案，建立保险账户，专家解读随时随地了解家人保障情况！</p>
        </div>
        <div class="row">
            <div class="col-md-3">
                    <c:if test="${share!=true}">
                        <div class="share_man">
                            <ul>
                                <c:forEach var="sharePerson" items="${sharePersons}">
                                    <li>${sharePerson}</li>
                                </c:forEach>
                            </ul>
                            <div class="button"><a href="<%=request.getContextPath()%>/my/policyshareuser/${pid}/${tbType}">编辑共享人 <i
                                    class="iconfont"></i></a></div>
                        </div>
                    </c:if>
            </div>
            <div class="col-md-9">
                <div class="content" style="border-left: 1px solid #ddd;">

                    <form action="">

                        <div class="upload_file">
                            <div class="tag">保单首页</div>
                            <div class="file_img_cen" id="syimgs">
                                <c:forEach var="sy" items="${syMap}">
                                    <c:forEach var="value" items="${sy.value}">
                                        <div class="file_img" id="${value.id}">
                                            <a href="${value.url}" target="_blank">
                                                <img src="${value.url}"/>
                                            </a>
                                        </div>
                                    </c:forEach>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="upload_file">
                            <div class="tag">投保信息</div>
                            <div class="file_img_cen" id="nrimgs">
                                <c:forEach var="nr" items="${nrMap}">
                                    <c:forEach var="value" items="${nr.value}">
                                        <div class="file_img" id="${value.id}">
                                            <a href="${value.url}" target="_blank">
                                                <img src="${value.url}"/>
                                            </a>
                                        </div>
                                    </c:forEach>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="upload_file">
                            <div class="tag">信息变更页</div>
                            <div class="file_img_cen" id="bgimgs">
                                <c:forEach var="bg" items="${bgMap}">
                                    <c:forEach var="value" items="${bg.value}">
                                        <div class="file_img" id="${value.id}">
                                            <a href="${value.url}" target="_blank">
                                                <img src="${value.url}"/>
                                            </a>
                                        </div>
                                    </c:forEach>
                                </c:forEach>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 保单的评论 -->
<div class="container" id="commentsDiv">
    <div class="comments">
        <div class="title">
            我要评论
        </div>
        <div class="textarea_box">
            <form id="commentContentForm">
                <input type="hidden" name="pid" id="pid" value="${pid}">
                <input type="hidden" name="uid" id="uid" value="<%=personalUserAccount.getId()%>">
                <textarea class="form-control" id="content" name="content"></textarea>
            </form>
        </div>
        <div class="my_control">
            <div class="row">
                <div class="col-md-9">
                    <div class="user">
                        <div class="photo">
                            <a href="#"><img src="<%=personalUserAccount.getIcon()%>" alt=""></a>
                        </div>
                        <div class="name"><%=personalUserAccount.getNickname()%>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="button" id="saveComment" onclick="saveComment()">
                        <a href="javascript:void(0)">评论</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="tag">最新评论</div>
        <ul class="list" id="comment">
        </ul>
    </div>
</div>

<!-- 底部 -->
<jsp:include page="common/footer.jsp"/>
<script>
    $.get("<%=request.getContextPath()%>/comment/${pid}", {}, function (comments) {
        $("#comment").empty();
        if (comments) {
            for (var i = 0; i < comments.length; i++) {
                var comment = comments[i];
                var html = "";
                html += "<li>";
                html += "<div class='info'>";
                html += "<div class='name'>" + comment.nickname + "</div>";
                html += "<div class='time'>" + new Date().Format(new Date(comment.ct)) + "</div>";
                html += "</div>";
                html += '<div class="cont">';
                html += comment.content;
                html += "</div>";
                html += "</li>";
                $("#comment").append(html);
            }
        }
    });

    function saveComment() {
        $.post("<%=request.getContextPath()%>/comment", {
            "uid": "<%=personalUserAccount.getId()%>",
            "pid": "${pid}",
            "content": filterXSS($("#content").val())
        }, function (response) {
            if (response.success) {
                alert("评论成功");
            } else {
                alert("评论失败");
            }
        })
    }
</script>
</body>
</html>