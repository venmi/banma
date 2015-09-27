<%--
  Created by IntelliJ IDEA.
  User: yutao
  Date: 2015/8/31
  Time: 14:30
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

<!-- 头部nav区 -->
<jsp:include page="common/mypolicynav.jsp"/>

<div class="container">
    <div class="document_download">
        <div class="title">单证下载</div>
        <div class="center">
            <div class="row">
                <div class="col-md-12">
                    <div class="btn_cen">
                        <div class="row">
                            <div class="col-md-6">
                                <h5>高端健康险配单证下载</h5>
                                <ul class="list">
                                    <li>
                                        <i class="iconfont"></i>
                                        <a href="">医疗直付理赔申请表</a>

                                        <div class="time">更新时间：2014-12-17</div>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <h5>健康险理赔单证下载</h5>
                                <ul class="list">
                                    <li>
                                        <i class="iconfont"></i>
                                        <a href="">医疗直付理赔申请表</a>

                                        <div class="time">更新时间：2014-12-17</div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<!-- 底部 -->
<jsp:include page="common/footer.jsp"/>
</body>
</html>

