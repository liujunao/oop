<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/11/2
  Time: 19:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>编辑活动内容</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.2.1.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        $(function () {
            $.post(
                "/mass",
                function (data) {
                    var list = "";
                    $.each($.parseJSON(data), function (num, content) {
                        list += "<option value='" + content.ma_id + "'>" + content.ma_name + "</option>";
                        $("#a_ac_massId").html(list);
                    })
                }
            )
        })
    </script>
</head>
<body>

<div>
    <nav class="navbar navbar-collapse" role="navigation" style="background-color: #C0C0C0;">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">
                    <div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <img src="${pageContext.request.contextPath}/statics/img/shelian.jpg" height="65" width="60"
                             style="margin-bottom: 30px;">
                        <span style="font-size: 30px;color: #0000FF;font-weight: 900;">  -AU</span>
                        <span style="font-size: 30px;">
                                <span style="color: #33CC33; font-size: 26px;font-weight: 900">
                                    <b>&nbsp;等待你的加入</b>
                                </span>
                        </span>
                    </div>
                </a>
            </div>
            <ul class="nav navbar-nav navbar-center">
                <li>
                    <div style="height: 62px;float: right;margin-top: 25px;">
                        <span style="font-size: 30px;color: red;font-weight: 900;">管理员界面</span>
                    </div>
                </li>
                <li>
                    <div style="height: 87px;width: 87px;">
                        <center>
                            <a href="${pageContext.request.contextPath}/toManager" style="height: 41px;"
                               data-toggle="tooltip" data-placement="bottom"
                               title="返回管理员界面">
                                <span class="glyphicon glyphicon-log-out"
                                      style="color: black; font-size: 32px;margin-top: 25px;"></span>
                            </a>
                        </center>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
</div>

<center>
    <div style="width: 600px;height: 800px;background-color: #DDDDDD;">
        <center>
            <table>
                <tr>
                    <td>
                        <c:if test="${type == 'edit'}">
                            <div style="color: blue;font-weight: 700;font-size: 30px">修改活动内容</div>
                        </c:if>
                        <c:if test="${type == 'add'}">
                            <div style="color: blue;font-weight: 700;font-size: 30px">添加活动</div>
                        </c:if>
                    </td>
                </tr>
            </table>
        </center>
        <hr>
        <center>
            <c:if test="${type == 'edit'}">
                <form action="${pageContext.request.contextPath}/editAc" method="post"
                      class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="m_ac_name" class="col-sm-3 control-label">活动名称：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ac_name" id="m_ac_name" value="${mapAc.ac_name }"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m_ac_time" class="col-sm-3 control-label">活动时间：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ac_time" id="m_ac_time" value="${mapAc.ac_time}"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m_ac_address" class="col-sm-3 control-label">活动地点：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ac_address" id="m_ac_address" value="${mapAc.ac_address}"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m_ac_mainMass" class="col-sm-3 control-label">主办社团：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ac_mainMass" id="m_ac_mainMass" value="${mapAc.ac_mainMass}"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m_ac_class" class="col-sm-3 control-label">活动类型：</label>
                        <div class="col-sm-8">
                            <select name="ac_class">
                                <option value="1" <c:if test="${mapAc.ac_class == 1}">selected</c:if>>歌唱类</option>
                                <option value="2" <c:if test="${mapAc.ac_class == 2}">selected</c:if>>跳舞类</option>
                                <option value="3" <c:if test="${mapAc.ac_class == 3}">selected</c:if>>相声类</option>
                                <option value="4" <c:if test="${mapAc.ac_class == 4}">selected</c:if>>讲座类</option>
                                <option value="5" <c:if test="${mapAc.ac_class == 5}">selected</c:if>>书法类</option>
                                <option value="6" <c:if test="${mapAc.ac_class == 6}">selected</c:if>>其他</option>
                            </select>
                            <input type="text" name="ac_class" id="m_ac_class" value=""
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m_ma_man_grade" class="col-sm-3 control-label">活动规模：</label>
                        <div class="col-sm-8">
                            <input type="email" name="ma_man_grade" id="m_ma_man_grade" value="${mapAc.ma_man_grade}"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m_ac_text" class="col-sm-3 control-label">活动简介：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ac_text" id="m_ac_text" value="${mapAc.ac_text}"
                                   class="form-control" style="height: 30px;"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-8">
                            <input type="hidden" name="ac_id" class="form-control" value="${mapAc.ac_id }"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-11">
                            <input type="submit" value="修改" class="btn btn-primary"
                                   style="width:240px;height:30px;background-color: blue;color: white"/>
                        </div>
                    </div>
                </form>
            </c:if>

            <c:if test="${type == 'add'}">
                <form action="${pageContext.request.contextPath}/addAc" method="post"
                      class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="a_ac_name" class="col-sm-3 control-label">活动名称：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ac_name" id="a_ac_name"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="a_ac_time" class="col-sm-3 control-label">活动时间：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ac_time" id="a_ac_time"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="a_ac_address" class="col-sm-3 control-label">活动地点：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ac_address" id="a_ac_address"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="a_ac_mainMass" class="col-sm-3 control-label">主办社团：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ac_mainMass" id="a_ac_mainMass"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="a_ac_massId" class="col-sm-3 control-label">领衔社团：</label>
                        <div class="col-sm-8">
                            <select name="ac_massId" id="a_ac_massId">

                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m_ac_class" class="col-sm-3 control-label">活动类型：</label>
                        <div class="col-sm-8">
                            <select name="ac_class">
                                <option value="1">歌唱类</option>
                                <option value="2">跳舞类</option>
                                <option value="3">相声类</option>
                                <option value="4">讲座类</option>
                                <option value="5">书法类</option>
                                <option value="6">其他</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="a_ma_man_grade" class="col-sm-3 control-label">活动规模：</label>
                        <div class="col-sm-8">
                            <input type="email" name="ma_man_grade" id="a_ma_man_grade"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="a_ac_text" class="col-sm-3 control-label">活动简介：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ac_text" id="a_ac_text"
                                   class="form-control" style="height: 30px;"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-11">
                            <input type="submit" value="添加" class="btn btn-primary"
                                   style="width:240px;height:30px;background-color: blue;color: white"/>
                        </div>
                    </div>
                </form>
            </c:if>
        </center>
    </div>
</center>
</body>
</html>
