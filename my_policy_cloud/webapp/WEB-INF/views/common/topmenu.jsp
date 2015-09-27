<%@ page import="com.bm.insurance.personal.cloud.util.SessionUtil" %>
<%@ page import="com.bm.insurance.cloud.util.Constant" %>
<%@ page import="com.bm.insurance.cloud.orm.entity.PersonalUserAccount" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yutao
  Date: 2015/8/22
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="top">
    <div class="container">

        <c:if test="${isIndex != true}">
            <div class="back_to_home pull-left">
                <a href="<%=request.getContextPath()%>/"><i class="iconfont"></i>保单云首页</a>
            </div>
        </c:if>

        <div class="fast_menu pull-right">

                <%
                    PersonalUserAccount personalUserAccount = (PersonalUserAccount)SessionUtil.getSessionInfo(Constant.PERSONAL_USER_KEY);
                    if(null==personalUserAccount){
                %>
            <div class="login_register pull-left" style="background-image: none">
                <div class="login"><a href="<%=request.getContextPath()%>/login">登陆</a></div>
                <div class="register"><a href="<%=request.getContextPath()%>/regedit">注册</a></div>
                <%
                    }else{
                %>
                <div class="login_register pull-left">欢迎您 <a href="<%=request.getContextPath()%>/center"><%=personalUserAccount.getNickname()%></a> <span><a href="<%=request.getContextPath()%>/logout"><i class="iconfont"></i>退出登录</a></span></div>
                    <div class="integral_policy pull-left collapse navbar-collapse">
                        <i class="iconfont"></i><a href="javascript:void(0)"><em>积分</em><b>0</b></a>
                        <i class="iconfont"></i><a href="<%=request.getContextPath()%>/my/policy/10"><em>保单</em><b><%=personalUserAccount.getPolicyNumber()%></b></a>
                    </div>
                    <div class="messages pull-left"><a href="messages.html">消息<span>3</span></a></div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>