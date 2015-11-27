<%@ page import="com.bm.insurance.cloud.util.Constant" %>
<%--
  Created by IntelliJ IDEA.
  User: yutao
  Date: 2015/8/28
  Time: 15:41
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

<!-- 面包屑 -->
<div class="container">
    <ol class="breadcrumb">
        <li>
            <a href="<%=request.getContextPath()%>/my/shareperson">共享人管理</a>
        </li>
        <li class="active">新建共享人</li>
    </ol>
</div>


<div class="container">
    <div class="add_share_member">
        <div class="title">新建共享人</div>
        <div class="content">
            <form id="savePersonForm">
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-6">
                        <div class="input-group">
                            <span class="input-group-addon">共享人手机</span>
                            <input type="text" name="mobile" class="form-control" placeholder="共享人手机" aria-describedby="basic-addon1">
                            <span class="input-group-addon">共享人备注</span>
                            <input type="text" name="pdesc" class="form-control" placeholder="共享人备注" aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                </div>
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-6">
                        <div class="relationship">
                            <div class="tag">与共享人关系</div>
                            <p><input name="relation" value="<%=Constant.USER_RELATIONSHIP_QR%>" type="radio">亲人</p>

                            <p><input name="relation" value="<%=Constant.USER_RELATIONSHIP_TX%>" type="radio">同学</p>

                            <p><input name="relation" value="<%=Constant.USER_RELATIONSHIP_PY%>" type="radio">朋友</p>

                            <p><input name="relation" value="<%=Constant.USER_RELATIONSHIP_OTHER%>" type="radio">其他</p>

                            <p></p>
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                </div>
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-6">
                        <div class="button">
                            <div class="row">
                                <div class="col-xs-6"><a href="javascript:void(0)" id="saveBtn">确定</a></div>
                                <div class="col-xs-6"><a class="cancel" href="javascript:void(0)" id="cancelBtn">取消</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 底部 -->
<jsp:include page="common/footer.jsp"/>
<script src="<%=request.getContextPath()%>/resources/myjs/addshareperson.js"></script>
</body>
</html>
