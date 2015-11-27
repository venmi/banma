<%--
  Created by IntelliJ IDEA.
  User: yutao
  Date: 2015/8/22
  Time: 13:29
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
                <div class="text">我的保单云</div>
            </div>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <%
                if(path.contains("policy")||path.contains("uploadpolicy")){
                %>
                <li class="active">
                <%
                }else{
                %>
                <li>
                <%
                }
                %>
                <a href="<%=request.getContextPath()%>/my/policy/10">我的保单 <span class="sr-only">(current)</span></a></li>


                <%
                if(path.contains("claims")){
                %>
                <li class="active">
                <%
                }else{
                %>
                <li>
                <%
                }
                %>
                <a href="<%=request.getContextPath()%>/handleclaims/apply/myclaims">理赔查询</a></li>


                <%
                if(path.contains("shareperson")||path.contains("addshareperson")||path.contains("sharedetail")){
                %>
                <li class="active">
                <%
                }else{
                %>
                <li>
                <%
                }
                %>
                <a href="<%=request.getContextPath()%>/my/shareperson">共享人管理</a></li>

                <%
                if(path.contains("center")){
                %>
                <li class="active">
                <%
                }else{
                %>
                <li>
                <%
                }
                %>
                <a href="<%=request.getContextPath()%>/center">个人中心</a></li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
