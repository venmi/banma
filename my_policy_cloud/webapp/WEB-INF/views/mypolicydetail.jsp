<%@ page import="com.bm.insurance.personal.cloud.util.SessionUtil" %>
<%@ page import="com.bm.insurance.cloud.util.Constant" %>
<%@ page import="com.bm.insurance.cloud.orm.entity.PersonalUserAccount" %>
<%--
  Created by IntelliJ IDEA.
  User: yutao
  Date: 2015/8/25
  Time: 19:28
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
<%PersonalUserAccount personalUserAccount = (PersonalUserAccount) SessionUtil.getSessionInfo(Constant.PERSONAL_USER_KEY); %>
<div class="container">
    <div class="policy_detail">
        <ol class="breadcrumb">
            <li><a href="<%=request.getContextPath()%>/my/policy/10">我的保单</a></li>
            <li class="active">保单详情</li>
        </ol>
        <div class="content">
            <div class="title">
                <div class="claims"><a href="<%=request.getContextPath()%>/my/handleclaims">我要理赔</a></div>
                太保安联员工福利计划
                <span>
                    <c:if test="${tbType==1}">
                        个人险
                    </c:if>
                    <c:if test="${tbType==2}">
                        企业团险
                    </c:if>
                </span>
            </div>
            <div class="button"><a href="#">我要理赔</a></div>
            <c:if test="${share!=true}">
                <div class="share_man">
                    <ul>
                        <c:forEach var="sharePerson" items="${sharePersons}">
                            <li>${sharePerson}</li>
                        </c:forEach>
                        <li><a href="<%=request.getContextPath()%>/my/policyshareuser/${pid}/${tbType}">编辑共享人 <i class="iconfont"></i></a></li>
                    </ul>
                </div>
            </c:if>

            <div class="row">
                <div class="col-md-6">
                    <span>保单号</span>${code}
                </div>
            </div>
            <div class="tag">投保人信息</div>
            <div class="row">
                <c:if test="${tbType==2}">
                    <div class="col-md-6"><span>公司</span>${tb.ename}</div>
                </c:if>
                <c:if test="${tbType==1}">
                    <div class="col-md-6"><span>个人</span>${tb.pname}</div>
                </c:if>
            </div>

            <div class="tag">被保人信息</div>
            <div class="row">
                <div class="col-md-6"><span>姓名</span>${userAccount.name}</div>
                <div class="col-md-6"><span>性别</span>${userInfo.sexName}</div>
            </div>
            <div class="row">
                <div class="col-md-6"><span>年龄</span>${userInfo.age}</div>
                <div class="col-md-6"><span>证件类型</span>${userAccount.cardTypeResp}</div>
            </div>
            <div class="row">
                <div class="col-md-12"><span>证件号</span>${userAccount.idcard}</div>
            </div>
            <div class="tag">连带被保人信息</div>

            <c:forEach var="joinInsuredPersonInfo" items="${joinInsuredPersonInfoList}">
                <div class="row">
                    <div class="col-md-6"><span>姓名</span>${joinInsuredPersonInfo.name}</div>
                    <div class="col-md-6"><span>性别</span>
                        <c:if test="${joinInsuredPersonInfo.sex==1}">男</c:if>
                        <c:if test="${joinInsuredPersonInfo.sex==2}">女</c:if>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6"><span>年龄</span>${joinInsuredPersonInfo.age}</div>
                    <div class="col-md-6"><span>证件类型</span>
                        <c:if test="${joinInsuredPersonInfo.idcardtype==1}">身份证</c:if>
                        <c:if test="${joinInsuredPersonInfo.idcardtype!=1}">其他</c:if>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6"><span>证件号</span>${joinInsuredPersonInfo.idcard}</div>
                    <div class="col-md-6"><span>与被保人关系</span>
                        <c:if test="${joinInsuredPersonInfo.relationship==1}">亲人</c:if>
                        <c:if test="${joinInsuredPersonInfo.relationship==2}">同学</c:if>
                        <c:if test="${joinInsuredPersonInfo.relationship==3}">朋友</c:if>
                        <c:if test="${joinInsuredPersonInfo.relationship==4}">其他</c:if>
                    </div>
                </div>
            </c:forEach>


            <c:if test="${tbType==2}">
                <div class="tag">员工计划</div>
                <c:forEach items="${bilityInfos}" var="bilityInfo">
                    <ul class="plan">
                        <li>
                            <div class="name"><a href="#">${bilityInfo.plainname}</a></div>
                            <div class="responsibility_sum">保障责任：${bilityInfo.bilityinfos} <em>保额：${bilityInfo.coverage}</em></div>
                            <div class="remark">
                                    ${bilityInfo.cmnt}
                            </div>
                        </li>
                    </ul>
                </c:forEach>
            </c:if>
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
                            <a href="javascript:void(0)"><img src="<%=personalUserAccount.getIcon()%>" alt=""></a>
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
        $.post("<%=request.getContextPath()%>/comment", {"uid": "<%=personalUserAccount.getId()%>", "pid": "${pid}", "content": filterXSS($("#content").val())}, function (response) {
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

