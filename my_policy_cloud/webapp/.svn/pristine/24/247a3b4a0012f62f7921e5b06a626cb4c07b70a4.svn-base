<%--
  Created by IntelliJ IDEA.
  User: yutao
  Date: 2015/8/26
  Time: 19:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="com.bm.insurance.cloud.util.Constant" %>
<%@ page import="com.bm.insurance.personal.cloud.util.SessionUtil" %>
<%@ page import="com.bm.insurance.cloud.orm.entity.PersonalUserAccount" %>
<html>
<head>
    <jsp:include page="common/header.jsp"/>
    <link href="<%=request.getContextPath()%>/resources/js/plugin/css/bootstrap-datepicker.css" type="text/css"
          rel="stylesheet"/>
</head>
<body>
<!-- 右侧浮动区 -->
<jsp:include page="common/floatSite.jsp"/>

<!-- 顶头菜单区 -->
<jsp:include page="common/topmenu.jsp"/>

<!-- 头部nav区 -->
<jsp:include page="common/mypolicynav.jsp"/>
<form id="userapply">
    <div class="container">
        <input type="hidden" name="eid" id="hid_eid" value="${eid}">
        <input type="hidden" name="uid" id="hid_uid" value="${uid}">
        <input type="hidden" name="pid" id="hid_pid" value="${pid}">
        <input type="hidden" name="ecid" id="hid_ecid" value="${ecid}">

        <div class="settlement_of_claims">
            <div class="title">请认真填写理赔申请表</div>
            <div class="tag">基本信息</div>
            <div class="row">
                <div class="col-md-4">
                    <div class="input-group">
                        <span class="input-group-addon">投保企业</span>
                        <input type="text" class="form-control" placeholder="" aria-describedby="basic-addon1"
                               value="${user.ename}"></div>
                </div>
                <div class="col-md-4">
                    <div class="input-group">
                        <span class="input-group-addon" id="">申报人</span>
                        <input type="text" class="form-control" placeholder="" aria-describedby="basic-addon1"
                               name="userName"
                               value="${user.pname}"></div>
                </div>
                <div class="col-md-4">
                    <div class="input-group">
                        <span class="input-group-addon">证件号</span>
                        <input type="text" class="form-control" placeholder="" aria-describedby="basic-addon1"
                               name="userIdNum"
                               value="${user.idCard}"></div>
                </div>
            </div>
            <c:if test="${petype==2}">
                <div class="row">
                    <div class="my_information">
                        <div class="col-md-12">
                            <label>
                                <input type="checkbox" id="show" name="isself" value="1">出险人不是报案人本人</label>
                        </div>
                        <div id="hide" style="display: none;">
                            <div class="col-md-12">
                                <div class="other_people" id="dlInfo">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="danger_title">
                                                <span>出险人名称</span>
                                                <select onchange="selectDL(this)" id="nameinsurer1">
                                                    <option value="-1" selected="selected">--请选择--</option>
                                                    <c:forEach var="claimsJoininsureBean"
                                                               items="${claimsJoininsureBeans}" varStatus="status">
                                                        <option value="${claimsJoininsureBean.id}">${claimsJoininsureBean.name}</option>
                                                    </c:forEach>
                                                </select>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <span class="input-group-addon" id="basic-">证件号</span>
                                                <input type="text" class="form-control" placeholder=""
                                                       aria-describedby="basic-addon1" name="idnum" id="idnum"> <input
                                                    type="hidden" name="nameinsurer" id="nameinsurer"/></div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <span class="input-group-addon">性别</span>
                                                <select type="text" placeholder="" id="sex"
                                                        aria-describedby="basic-addon1" class="form-control"
                                                        name="sex">
                                                    <option value="1"> 男</option>
                                                    <option value="2"> 女</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <span class="input-group-addon">年龄</span>
                                                <input type="text" class="form-control"
                                                       aria-describedby="basic-addon1" name="age" id="age">
                                                <input type="hidden" class="form-control"  aria-describedby="basic-addon1" name="birth" id="birth"></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <span class="input-group-addon">职业</span>
                                                <input type="text" class="form-control" placeholder="" name="career"
                                                       id="career"
                                                       aria-describedby="basic-addon1"></div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <span class="input-group-addon">联系电话</span>
                                                <input type="text" class="form-control" placeholder=""
                                                       aria-describedby="basic-addon1" name="mobile" id="mobile"></div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="input-group">
                                                <span class="input-group-addon">与报案人关系</span>
                                                <input type="text" class="form-control" placeholder=""
                                                       aria-describedby="basic-addon1" name="relationship"
                                                       id="relationship">
                                                    <%-- <select type="text" placeholder=""
                                                            aria-describedby="basic-addon1" class="form-control"
                                                            name="relationship"
                                                            id="relationship">
                                                    </select> --%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:if>
            <div class="row">
                <div class="matters">
                    <div class="col-md-12">
                        <div class="tag">申请事项</div>
                        <div id="sqsx1"></div>
                        <div id="sqsx2">
                            <c:forEach var="rbInfoVO" items="${rbInfoVOs}" varStatus="status">
                                <c:if test="${status.count==1|| status.count%4==1}">
                                    <div class="row">
                                </c:if>
                                <div class="col-md-3">
                                    <label>
                                        <input type="checkbox" id="${rbInfoVO.id}" value="${rbInfoVO.id}"
                                               name="reporttype">${rbInfoVO.name}</label>
                                </div>
                                <c:if test="${status.count%4==0 || (rbInfoVOs)!= null && fn:length(rbInfoVOs)==status.count }">
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tag">出险类型：</div>
            <div class="row">
                <div class="type">
                    <div class="col-md-4">
                        <label>
                            <input type="checkbox" value="1" name="dangertype">意外</label>
                    </div>
                    <div class="col-md-4">
                        <label>
                            <input type="checkbox" value="2" name="dangertype">疾病</label>
                    </div>
                    <div class="col-md-4">
                        <label>
                            <input type="checkbox" value="3" name="dangertype">其他</label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="input-group">
                        <span class="input-group-addon">申报总数</span>
                        <input type="text" class="form-control" placeholder="" aria-describedby="basic-addon1"
                               name="applyprice"></div>
                </div>
            </div>
            <div class="tag">就诊医院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a value="" id="addexperience" onclick="AddRow()">增加</a>
            </div>
            <div class="row">
                <table border=0 id="TbData">
                    <tr id="one_tr" class="CaseRow">
                        <td style="width: 22%">
                            <div class="col-md-12">
                                <div class="input-group">
                                    <div class="input-group date form_date " data-date="" id="form_date"
                                            >
                                        <span class="input-group-addon" id="basic-addon1">就诊/时间日期</span>
                                        <input class="form-control" size="16" id="ss_date"
                                               name="accidentDataInfos[0].datavisit" type="text" value=""
                                               onfocus="setCurDate(this)" readonly/>
                                        <%-- <span class="input-group-addon">
                                             <span class="glyphicon  glyphicon-remove"></span>
                                         </span>
                                         <span class="input-group-addon">
                                             <span class="glyphicon glyphicon-calendar"></span>
                                         </span>--%>
                                    </div>
                                    <%--<input type="hidden" name="accidentDataInfos[0].datavisit" id="datavisit"/>--%>
                                </div>
                            </div>
                        </td>
                        <td style="width: 25%">
                            <div class="col-md-12">
                                <div class="input-group pull-right">
                                    <span class="input-group-addon">就诊医院</span>
                                    <input type="text" class="form-control" placeholder="" id="ddd"
                                           aria-describedby="basic-addon1"
                                           name="accidentDataInfos[0].hospital">
                                </div>
                            </div>
                        </td>
                        <td style="width: 20%">
                            <div class="col-md-10">
                                <div class="input-group">
                                    <span class="input-group-addon">申报金额</span>
                                    <input type="text" class="form-control" placeholder=""
                                           aria-describedby="basic-addon1"
                                           name="accidentDataInfos[0].amountdeclared"></div>
                            </div>
                        </td>
                        <td>
                            <div class="col-md-10">
                                <h5>疾病/事故经过<a onclick="remRow(this)">移除</a></h5><textarea class="form-control"
                                                                                          name="accidentDataInfos[0].reasonsvisit"></textarea>
                            </div>
                        <td>
                    </tr>
                </table>
            </div>
            <script type="text/javascript">


            </script>
            <%--<div class="row">

            </div>--%>

            <div class="row">
                <div class="accident">
                    <div class="col-md-12">

                        <%-- <label>
                             <input type="checkbox">投保有其他保险公司险种，或就本次事故向其他保险公司或单位索赔（如有，请注明公司名称、保单号及获赔金额）</label>
                         --%>
                        <label>
                            关联卡信息</label>

                        <div class="card" style="padding:35px">
                            <div class="col-md-4" style="padding-top: 5px">
                                <span>理赔转账银行：</span>
                                <input type="text" name="bankname" value="${bank.openaccount}">
                            </div>
                            <div class="col-md-4">
                                <span>领款账户：</span>
                                <input type="text" name="payaccount" value="${bank.bankcardnum}">
                            </div>
                            <div class="col-md-4">
                                <span>开户名：</span>
                                <input type="text" name="openaccountname" value="${bank.openaccountname}">
                            </div>
                        </div>
                        <h5>备注</h5>
                        <textarea class="form-control" name="comment"></textarea>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="tag">单据上传</div>
                    <input type="file" id="sybd" name="bin" multiple>

                    <div class="file_img_cen" id="syimgs">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="row">
                        <div class="col-xs-4">
                            <div class="button">
                                <a id="submit" value="确认报案" calss="hover">确认报案</a>
                            </div>
                        </div>
                        <div class="col-xs-4">
                            <div class="button">
                                <a class="cancel" href="#">取消</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
</body>
<html>
<!-- 底部 -->
<jsp:include page="common/footer.jsp"/>


<script type="text/javascript"
        src="<%=request.getContextPath()%>/resources/js/plugin/js/bootstrap-datepicker.js"></script>
<script type="text/javascript"
        src="<%=request.getContextPath()%>/resources/js/plugin/js/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="<%=request.getContextPath()%>/resources/myjs/handleclaims.js"></script>