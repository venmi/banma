<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<!-- 我的保单content -->
<div class="container">
    <div class="my_policy">
        <div class="upload_btn">
            <a href="<%=request.getContextPath()%>/my/uploadpolicy"><i class="iconfont"></i>上传保单</a>
        </div>
        <ul class="tab_bar" id="policyNav">
            <li <c:if test="${status == 10}">class="active" </c:if>><a href="<%=request.getContextPath()%>/my/policy/10">全部(${allPolicySize})</a>
            </li>
            <li <c:if test="${status == 1}">class="active" </c:if>><a href="<%=request.getContextPath()%>/my/policy/1">有效(${validNum})</a>
            </li>
            <li <c:if test="${status == 2}">class="active" </c:if>><a href="<%=request.getContextPath()%>/my/policy/2">失效(${invalidNum})</a>
            </li>
            <li <c:if test="${status == 3}">class="active" </c:if>><a href="<%=request.getContextPath()%>/my/policy/3">过期(${timeOutNum})</a>
            </li>
            <li <c:if test="${status == 4}">class="active" </c:if>><a href="<%=request.getContextPath()%>/my/policy/4"><span>待缴费(${outMoneyNum})</span></a>
            </li>
            <li <c:if test="${status == 5}">class="active" </c:if>><a href="<%=request.getContextPath()%>/my/policy/5">上传保单(${uploadNum})</a>
            </li>
            <li <c:if test="${status == 6}">class="active" </c:if>><a href="<%=request.getContextPath()%>/my/policy/6">共享保单(${shareNum})</a>
            </li>
            <div class="upload">
                <a href="<%=request.getContextPath()%>/my/uploadpolicy"><i class="iconfont"></i>上传保单</a>
            </div>
        </ul>
        <div class="content">
            <div class="row">
                <c:forEach var="policy" items="${policyList}">
                    <div class="col-md-3">
                        <c:choose>
                            <c:when test="${policy.st == '5'}">
                                <div class="plicy doing">
                                    <div class="pic">
                                        <c:if test="${policy.uid==myUid}">
                                            <a href="<%=request.getContextPath()%>/my/editpolicy/${policy.pid}#commentsDiv"><img src="${policy.upimage}" alt="点击查看详情"></a>
                                        </c:if>
                                        <c:if test="${policy.uid!=myUid}">
                                            <a href="<%=request.getContextPath()%>/my/imgpolicy/${policy.pid}#commentsDiv"><img src="${policy.upimage}" alt="点击查看详情"></a>
                                        </c:if>
                                    </div>
                                    <div class="share_man">
                                        <a href="<%=request.getContextPath()%>/my/shareperson">查看更多共享人 <i class="iconfont"></i></a>
                                    </div>
                                    <div class="comment_delete">
                                        <div class="row">
                                            <c:if test="${policy.uid==myUid}">
                                                <div class="col-xs-6 comment">
                                                    <a href="<%=request.getContextPath()%>/my/imgpolicy/${policy.pid}#commentsDiv"><i
                                                            class="glyphicon glyphicon-list-alt"></i>我要评论</a>
                                                </div>
                                                <div class="col-xs-6 delete">
                                                    <a href="javascript:void(0)" onclick="deletePolicy(${policy.pid})"><i class="glyphicon glyphicon-remove-sign"></i>删除保单</a>
                                                </div>
                                            </c:if>
                                            <c:if test="${policy.uid!=myUid}">
                                                <div class="col-xs-12 comment">
                                                    <a href="<%=request.getContextPath()%>/my/imgpolicy/${policy.pid}#commentsDiv"><i
                                                            class="glyphicon glyphicon-list-alt"></i>我要评论</a>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="plicy normal">
                                    <div class="head">

                                        <c:if test="${policy.eid!=null}">
                                            <c:if test="${policy.share==true}">
                                                <div class="name share_enterprise"><a
                                                        href="<%=request.getContextPath()%>/my/policydetail/${policy.pid}/2/1">${policy.name}</a>
                                                </div>
                                            </c:if>
                                            <c:if test="${policy.share==false}">
                                                <div class="name enterprise"><a
                                                        href="<%=request.getContextPath()%>/my/policydetail/${policy.pid}/2/2">${policy.name}</a>
                                                </div>
                                            </c:if>
                                        </c:if>

                                        <c:if test="${policy.eid==null}">
                                            <c:if test="${policy.share==true}">
                                                <div class="name share">
                                                    <a href="<%=request.getContextPath()%>/my/policydetail/${policy.pid}/1/1">${policy.name}</a>
                                                </div>
                                            </c:if>
                                            <c:if test="${policy.share==false}">
                                                <div>
                                                    <a href="<%=request.getContextPath()%>/my/policydetail/${policy.pid}/1/2">${policy.name}</a>
                                                </div>
                                            </c:if>
                                        </c:if>

                                        <div class="num">保单号：${policy.code}</div>
                                        <div class="insured">被保险人：${policy.pname}</div>
                                    </div>
                                    <div class="cont">
                                        <ul class="info">
                                            <li>保险公司：${policy.productListDto.cmp}</li>
                                            <li>保险类型：${policy.productListDto.ptype}</li>
                                            <li>保险期限：${policy.effectivedate}至${policy.expirydate}</li>
                                            <li>缴费方式：${policy.productListDto.paytype}</li>
                                        </ul>
                                        <div class="price"><span>${policy.money}</span>元/次</div>
                                        <c:if test="${policy.share==false}">
                                            <c:if test="${policy.eid!=null}">
                                                <div class="button"><a
                                                        href="<%=request.getContextPath()%>/my/handleclaims/${policy.enterpriseid}/${policy.pid}/${policy.uid}/${policy.eid}/2">我要理赔</a>
                                                </div>
                                            </c:if>
                                            <c:if test="${policy.eid==null}">
                                                <div class="button"><a
                                                        href="<%=request.getContextPath()%>/my/handleclaims/${policy.enterpriseid}/${policy.pid}/${policy.uid}/${policy.eid}}/1">我要理赔</a>
                                                </div>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${policy.share==true}">
                                            <div class="button btn_disabled"><a href="javascript:void(0)">我要理赔</a></div>
                                        </c:if>
                                    </div>
                                    <div class="share_man">
                                        <a href="<%=request.getContextPath()%>/my/shareperson">查看更多共享人 <i class="iconfont"></i></a>
                                    </div>
                                    <div class="comment_delete">
                                        <div class="row">
                                            <div class="col-xs-12 comment">
                                                <c:if test="${policy.eid!=null}">
                                                    <c:if test="${policy.share==true}">
                                                        <a href="<%=request.getContextPath()%>/my/policydetail/${policy.pid}/2/1#commentsDiv"><i class="glyphicon glyphicon-list-alt"></i>我要评论</a>
                                                    </c:if>
                                                    <c:if test="${policy.share==false}">
                                                        <a href="<%=request.getContextPath()%>/my/policydetail/${policy.pid}/2/2#commentsDiv"><i class="glyphicon glyphicon-list-alt"></i>我要评论</a>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${policy.eid==null}">
                                                    <c:if test="${policy.share==true}">
                                                        <a href="<%=request.getContextPath()%>/my/policydetail/${policy.pid}/1/1#commentsDiv"><i class="glyphicon glyphicon-list-alt"></i>我要评论</a>
                                                    </c:if>
                                                    <c:if test="${policy.share==false}">
                                                        <a href="<%=request.getContextPath()%>/my/policydetail/${policy.pid}/1/2#commentsDiv"><i class="glyphicon glyphicon-list-alt"></i>我要评论</a>
                                                    </c:if>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<!-- 底部 -->
<jsp:include page="common/footer.jsp"/>
<script>
    function deletePolicy(pid) {
        if (confirm("确定要删除当前的保单吗?")) {
            $.post("<%=request.getContextPath()%>/uploadPolicy/deletePolicy/" + pid, {}, function (response) {
                if (response.success) {
                    window.location.href = "<%=request.getContextPath()%>/my/policy/10";
                } else {
                    alert("删除保单失败!")
                }
            })
        }
    }
</script>
</body>
</html>
