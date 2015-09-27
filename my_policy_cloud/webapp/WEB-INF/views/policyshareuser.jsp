<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yutao
  Date: 2015/9/2
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <ol class="breadcrumb">
        <li>
            <a href="<%=request.getContextPath()%>/my/policy/10">我的保单</a>
        </li>
        <li class="active">编辑共享人</li>
    </ol>
</div>

<div class="container">
    <div class="policy_detail">

        <div class="content">
            <div class="title">
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
            <div class="edit_share_man">
                <div class="row">
                    <c:forEach items="${myFriends}" var="friend">
                        <div class="col-md-4">
                            <c:if test="${friend.check==true}">
                                <div class="share_box remove"><a href="javascript:void(0)" onclick="handleFriend('${friend.uid}','2','${pid}')">- 移除</a>
                                    <div class="name">${friend.name}</div>
                                </div>
                            </c:if>
                            <c:if test="${friend.check==false}">
                                <div class="share_box add"><a href="javascript:void(0)" onclick="handleFriend('${friend.uid}','1','${pid}')">+ 添加</a>
                                    <div class="name">${friend.name}</div>
                                </div>
                            </c:if>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 底部 -->
<jsp:include page="common/footer.jsp"/>
<script>
    function handleFriend(uid,type,pid){
        ajaxCommon("<%=request.getContextPath()%>/handleFriend",{"uid":uid,"tp":type,"pid":pid},function(response){
            if(response.success){
                window.location.href = "<%=request.getContextPath()%>/policyshareuser/${pid}/${tbType}";
            }
        },function(response){
            alert(response.msg);
        })
    }

</script>
</body>
</html>