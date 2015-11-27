<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yutao
  Date: 2015/8/24
  Time: 10:03
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

<div class="container">
    <div class="claims_processing_search">
        <ul class="tab_bar">
            <li class="active">
                <a href="<%=request.getContextPath()%>/handleclaims/apply/myclaims">进行中</a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/handleclaims/apply/finished">已结案</a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/handleclaims/apply/revokeDone">已撤销</a>
            </li>
            <div class="upload">
                <a href="document_download.html">
                    <i class="iconfont"></i>
                    单证下载
                </a>
            </div>
        </ul>
        <div class="claims_list">
            <div class="row">
                <c:forEach items="${myclaims}" var="data">


                    <div class="col-md-4">
                        <div class="claim_form">
                            <div class="num"><span class="status">${data.handlestatus}</span><a
                                    href="#">报案号:${data.applycode}</a></div>
                            <ul class="cont">
                                <li>出险人：${data.nameinsurer}</li>
                                <li>证件号：${data.idnum}</li>
                                <li>申报时间：${data.applydate}</li>
                                <li>申报总额：${data.applyprice}</li>
                            </ul>
                            <div class="operating">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <a href="<%=request.getContextPath()%>/handleclaims/apply/revoke/${data.id}"><i
                                                class="iconfont"></i>撤销</a>
                                    </div>
                                    <div class="col-xs-6">
                                        <a href="#"><i class="iconfont"></i>问题处理</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</div>

<!-- 底部 -->
<jsp:include page="common/footer.jsp"/>

</body>

<sript>

    $(function (){
        alert(1);
    )


</sript>

</html>