<%--
  Created by IntelliJ IDEA.
  User: yutao
  Date: 2015/8/22
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="common/header.jsp"/>
</head>
<!-- 右侧浮动区 -->
<jsp:include page="common/floatSite.jsp"/>
<!-- 顶头菜单区 -->
<jsp:include page="common/topmenu.jsp"/>
<!-- 顶部导航区 -->
<jsp:include page="common/topnav.jsp"/>

<div class="container">
    <div class="regist_box">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <div class="title">
                    <a href="perfect_data.html">免费注册</a>
                </div>
                <form id="regForm">
                    <input type="text" class="form-control mobile_phone" name="username" placeholder="用户名">
                    <input type="password" class="form-control password" name="password" placeholder="密码">
                    <label class="clause">
                        <input type="checkbox" checked="checked" name="" value="" id="checked">我同意<a href="javascripts:;">《保单云条款》</a>
                    </label>
                    <button type="button" class="btn" id="regBtn"  value="" onclick="show()">免费注册</button>
                    <div class="fast">
                        <div class="prompt">已有账号？<a href="login.html">立即登录</a></div>
                    </div>
                </form>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
</div>

<jsp:include page="common/footer.jsp"/>
<script src="<%=request.getContextPath()%>/resources/myjs/regedit.js"></script>
<body>

</body>
</html>
