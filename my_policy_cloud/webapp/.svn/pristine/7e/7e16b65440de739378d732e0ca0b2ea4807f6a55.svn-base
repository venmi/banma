<%--
  Created by IntelliJ IDEA.
  User: yutao
  Date: 2015/8/22
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="activity">
    <div class="container">
        <h4><a href="#">精选活动</a></h4>

        <div class="row">
            <c:forEach var="item" items="${topActivities}" varStatus="value" begin="0" end="0">
                <div class="col-xs-12">
                    <c:choose>
                        <c:when test="${item.link != null && item.link != ''}">
                            <a href="${item.link}" target="_blank"><img src="${item.thumbnail}" alt="${item.name}"/></a>
                        </c:when>
                        <c:otherwise>
                            <a href="${base}/article/detail/${item.id}" target="_blank"><img src="${item.thumbnail}" alt="${item.name}"/></a>
                        </c:otherwise>
                    </c:choose>

                </div>
            </c:forEach>

        </div>
    </div>
</div>