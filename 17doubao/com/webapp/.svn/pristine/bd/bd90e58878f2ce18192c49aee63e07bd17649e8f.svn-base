<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  <div class="news_list">
    <div class="row">
      <div class="col-md-12">
        <h4>
          <a href="${base}/article/list/${category.id}">${category.categoryname}</a>
        </h4>
        <ul class="text_list">

          <c:forEach var="item" items="${articles}" varStatus="value" begin="0" end="6">
            <li>
              <a href="${base}/article/detail/${item.id}">${item.name}</a>
              <%--<i class="iconfont hot">&#xe612;</i>--%>
              <span class="time"><c:if test="${item.ct != null}"><fmt:formatDate pattern="yyyy-MM-dd" value="${item.ct}" /></c:if></span>
            </li>
          </c:forEach>


        </ul>
      </div>
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