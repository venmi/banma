<%@ page import="com.bm.insurance.cloud.util.Constant" %>
<%@ page import="com.bm.insurance.personal.cloud.util.SessionUtil" %>
<%@ page import="com.bm.insurance.cloud.orm.entity.PersonalUser" %>
<%@ page import="com.bm.insurance.cloud.orm.entity.PersonalUserAccount" %>
<%--
  Created by IntelliJ IDEA.
  User: yutao
  Date: 2015/8/22
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="common/header.jsp"/>
    <link href="<%=request.getContextPath()%>/resources/js/upload/css/jquery.fileupload.css" type="text/css" rel="stylesheet"/>
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
    String icon = personalUserAccount.getIcon();
    if(icon==null) {
        icon = "/resources/images/photo.png";
    }
%>
<!-- 我的保单content -->
<div class="container">
    <div class="row">
        <div class="user_center">
            <div class="col-md-3">
                <div class="side">
                    <div class="pic">
                        <a href="javascript:void(0)" id="upHeader"><img id="userHeader" src="<%=icon%>">
                            <div class="edit_photo">
                                <i class="iconfont"></i>
                            </div>
                        </a>
                    </div>
                    <div class="name">
                        ${self.nickname}
                    </div>
                    <div class="integral_policynum">
                        <div class="integral">
                            <a href="#">
                                ${jifen} <br>
                                <span>积分</span>
                            </a>
                        </div>
                        <div class="policynum"><a href="<%=request.getContextPath()%>/my/policy/10">
                            ${contractCount} <br>
                            <span>保单数量</span>
                        </a></div>
                    </div>
                    <ul class="menu" id="centerMenu">
                        <li class="acitve" id="myinfo"><a href="javascript:void(0)"><i class="iconfont"></i>个人资料</a>
                        </li>
                        <li id="mymsg"><a href="javascript:void(0)"><i class="iconfont"></i>消息中心</a></li>
                        <%--    <li id="changemyinfo"><a href="javascript:void(0)"><i class="iconfont"></i>修改资料</a></li>--%>
                        <li id="changemypwd"><a href="javascript:void(0)"><i class="iconfont"></i>修改密码</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-9">
                <div id="myContent" class="content user_home">
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
<script src="<%=request.getContextPath()%>/resources/myjs/mycenter.js"></script>
</body>
</html>
