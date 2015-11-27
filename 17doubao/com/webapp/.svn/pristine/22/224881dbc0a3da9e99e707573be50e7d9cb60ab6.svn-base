<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yutao
  Date: 2015/8/31
  Time: 8:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="common/header.jsp"/>
</head>
<body>
<!-- 右侧浮动区 -->
<jsp:include page="common/floatSite.jsp"/>

<!-- 顶头菜单区 -->
<jsp:include page="common/topmenu.jsp"/>

<!-- 顶部导航区 -->
<jsp:include page="common/mypolicynav.jsp"/>

<!-- 面包屑 -->
<div class="container">
    <ol class="breadcrumb">
        <li>
            <a href="<%=request.getContextPath()%>/my/shareperson">共享人管理</a>
        </li>
        <li class="active">共享人详情</li>
    </ol>
</div>


<div class="container">
    <div class="share_member_detail">

        <div class="title">共享人详情</div>
        <div class="row">
            <div class="col-md-2">
                <div class="member">
                    <div class="tag">共享人信息</div>
                    <p>${sharePersonInfo.pname}</p>

                    <p>
                        <c:choose>
                            <c:when test="${relation==1}">
                                亲人
                            </c:when>
                            <c:when test="${relation==2}">
                                同学
                            </c:when>
                            <c:when test="${relation==3}">
                                朋友
                            </c:when>
                            <c:when test="${relation==4}">
                                其他
                            </c:when>
                        </c:choose>
                    </p>

                    <p>${sharePersonInfo.mobile}</p>
                </div>
            </div>
            <div class="col-md-10">
                <div class="share_policy">
                    <div class="tag">
                        <span class="share_more">
                          <%--<a href="#">分享更多保单 +</a>--%>
                        </span>
                        共享保单
                    </div>
                    <c:forEach items="${policyList}" var="policy">
                        <p>
                            <span class="delete">
                                <%--<a href="">删除</a>--%>
                            </span>
                            <c:if test="${policy.eid==''}">
                                <a href="<%=request.getContextPath()%>/my/policydetail/${policy.code}/${uid}/1">${policy.name}</a>
                            </c:if>
                            <c:if test="${policy.eid!=''}">
                                <a href="<%=request.getContextPath()%>/my/policydetail/${policy.code}/${uid}/2">${policy.name}</a>
                            </c:if>
                        </p>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 底部 -->
<jsp:include page="common/footer.jsp"/>

</body>
</html>