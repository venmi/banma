<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <jsp:include page="../common/header.jsp"/>
</head>
<body>
<!-- 右侧浮动区 -->
<jsp:include page="../common/floatSite.jsp"/>

<!-- 顶头菜单区 -->
<jsp:include page="../common/topmenu.jsp"/>

<!-- 顶部导航区 -->
<jsp:include page="../common/topnav.jsp"/>
<div class="container">
  <ol class="breadcrumb">
    <li>
      <a href="#">我的保单云</a>
    </li>
    <li>
      <a href="${base}/article/list/${article.categoryId}">${article.categoryName}</a>
    </li>
    <li class="active">话题详情</li>
  </ol>
</div>
<div class="container">
  <div class="news_detail">
    <h1>${article.name}</h1>
    <div class="info">
      <div class="time"><c:if test="${article.ct != null}"><fmt:formatDate pattern="yyyy-MM-dd" value="${article.ct}" /></c:if></div>
      <div class="author">${article.author}</div>
      <div class="category">${article.categoryName}</div>
    </div>
    <div class="cont">
      ${article.content}
    </div>
  </div>
</div>

<jsp:include page="../common/footer.jsp"/>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="../resources/js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../resources/js/bootstrap.min.js"></script>
<script src="../resources/js/common-min.js"></script>

</body>
</html>