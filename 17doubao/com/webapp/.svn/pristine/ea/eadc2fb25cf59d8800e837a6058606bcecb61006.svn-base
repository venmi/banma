<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="news">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h4><a href="${base}/article/list/15"><span>+</span>热点话题</a></h4>
                <ul class="text_list">
                    <c:forEach var="item" items="${topActivities}" varStatus="value" begin="0" end="6">
                    <li><a href="${base}/article/detail/${item.id}">${item.name}</a><%--<i class="iconfont hot"></i>--%></li>
                    </c:forEach>
                </ul>
            </div>
            <div class="col-md-6">
                <h4><a href="${base}/article/list/20"><span>+</span>媒体报道</a></h4>
                <ul class="pic_list">
                    <c:forEach var="item" items="${topMediaArticles}" varStatus="value" begin="0" end="2">
                        <li>
                            <div class="pic">
                                <img src="${item.thumbnail}" alt="${item.name}">
                            </div>
                            <h5>
                                <a href="${base}/article/detail/${item.id}">${item.name}</a>
                            </h5>
                            <div class="content">
                                <a href="${base}/article/detail/${item.id}">${item.content}</a>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>