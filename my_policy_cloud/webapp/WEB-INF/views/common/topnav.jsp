<%--
  Created by IntelliJ IDEA.
  User: yutao
  Date: 2015/8/22
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getRequestURI();
%>
<nav class="navbar navbar-default">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="logo">
                <div class="pic"><img src="${base}/resources/images/logo.png" alt=""></div>
                <div class="slogan">最实用的保险服务平台</div>
            </div>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav" id="topnavli">
                <%
                if(path.contains("index")){
                %>
                <li class="active">
                <%
                }else{
                %>
                <li>
                <%
                }
                %>
                <a href="<%=request.getContextPath()%>/">首页 <span class="sr-only">(current)</span></a></li>


                <%
                if(path.contains("active")){
                %>
                <li class="active">
                <%
                }else{
                %>
                <li>
                <%
                }
                %>
                <a href="${topActivitie}" target="_blank">精彩活动</a></li>


                <%
                if(path.contains("policy")){
                %>
                <li class="active">
                <%
                }else{
                %>
                <li>
                <%
                }
                %>
                <a href="<%=request.getContextPath()%>/my/policy/10">我的保单云</a></li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>