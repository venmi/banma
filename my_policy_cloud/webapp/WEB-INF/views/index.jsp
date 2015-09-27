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
<jsp:include page="common/topnav.jsp"/>
<!-- 大图轮播区 -->
<jsp:include page="index/switchImg.jsp"/>
<!-- 保单查询区 -->
<jsp:include page="index/policymenu.jsp"/>
<!-- 产品区 -->
<jsp:include page="index/product.jsp"/>
<!-- 活动区 -->
<jsp:include page="index/active.jsp"/>
<!-- 热点话题区 -->
<jsp:include page="index/new.jsp"/>
<!-- 友链区 -->
<jsp:include page="index/firendLinks.jsp"/>
<!-- 底部 -->
<jsp:include page="common/footer.jsp"/>
</body>
</html>
