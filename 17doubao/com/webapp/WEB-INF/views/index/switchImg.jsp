<%--
  Created by IntelliJ IDEA.
  User: yutao
  Date: 2015/8/22
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="myCarousel" class="carousel slide banner" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="item active">
            <img src="${base}/resources/images/banner.png" style="width:100%" data-src=" " alt="First slide">

            <div class="carousel-caption">
                <div class="slogan">最实用的保险服务平台</div>
            </div>
        </div>
        <div class="item">
            <img src="${base}/resources/images/banner1.png" style="width:100%" data-src="" alt="Second slide">

            <div class="carousel-caption">
                <div class="slogan"></div>
            </div>
        </div>
        <div class="item">
            <img src="${base}/resources/images/banner2.png" style="width:100%" data-src="" alt="Third slide">

            <div class="carousel-caption">
                <div class="slogan"></div>
            </div>
        </div>
    </div>
</div>