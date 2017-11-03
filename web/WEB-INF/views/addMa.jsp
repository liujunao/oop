<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/11/2
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>添加页面</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.2.1.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        var msg = "<%=request.getAttribute("msg")%>";
        function mine() {
            if (msg != "null" && msg != null) {
                alert(msg);
            }
        }
        window.onload = mine;
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
            <ul class="nav navbar-nav navbar-right">
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
                            <div style="color: blue;font-weight: 700;font-size: 30px">修改社团信息</div>
                        </c:if>
                        <c:if test="${type == 'add'}">
                            <div style="color: blue;font-weight: 700;font-size: 30px">添加社团</div>
                        </c:if>
                    </td>
                </tr>
            </table>
        </center>
        <hr>
        <center>
            <c:if test="${type == 'add'}">
                <form action="${pageContext.request.contextPath}/addMa" method="post" class="form-horizontal"
                      role="form">
                    <div class="form-group">
                        <label for="m_ma_name" class="col-sm-3 control-label">社团名称：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_name" id="m_ma_name"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m_ma_time" class="col-sm-3 control-label">成立时间：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_time" id="m_ma_time"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m_ma_member" class="col-sm-3 control-label">社团成员：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_member" id="m_ma_member" class="form-control"
                                   style="height: 30px;"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m_ma_man_name" class="col-sm-3 control-label">负责人姓名：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_man_name" id="m_ma_man_name"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m_ma_man_department" class="col-sm-3 control-label">负责任院系：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_man_department" id="m_ma_man_department" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m_ma_man_grade" class="col-sm-3 control-label">负责人班级：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_man_grade" id="m_ma_man_grade" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m_ma_man_phone" class="col-sm-3 control-label">负责人电话：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_man_phone" id="m_ma_man_phone" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m_ma_man_email" class="col-sm-3 control-label">负责人邮箱：</label>
                        <div class="col-sm-8">
                            <input type="email" name="ma_man_email" id="m_ma_man_email" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m_ma_man_qq" class="col-sm-3 control-label">负责人QQ：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_man_qq" id="m_ma_man_qq" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m_ma_man_weChat" class="col-sm-3 control-label">负责人微信：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_man_weChat" id="m_ma_man_weChat" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m_ma_text" class="col-sm-3 control-label">社团简介：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_text" id="m_ma_text" class="form-control"
                                   style="height: 30px;"/>
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

            <c:if test="${type == 'edit'}">
                <form action="${pageContext.request.contextPath}/editMa" method="post" class="form-horizontal"
                      role="form">
                    <div class="form-group">
                        <div class="col-sm-8">
                            <input type="hidden" name="ma_id" value="${mapMass.ma_id }" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_ma_name" class="col-sm-3 control-label">社团名称：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_name" id="e_ma_name" value="${mapMass.ma_name }"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_ma_time" class="col-sm-3 control-label">成立时间：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_time" id="e_ma_time" value="${mapMass.ma_time }"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_ma_member" class="col-sm-3 control-label">社团成员：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_member" id="e_ma_member" value="${mapMass.ma_member }"
                                   class="form-control" style="height: 30px;"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_ma_man_name" class="col-sm-3 control-label">负责人姓名：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_man_name" id="e_ma_man_name" value="${mapMass.ma_man_name }"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_ma_man_department" class="col-sm-3 control-label">负责任院系：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_man_department" id="e_ma_man_department"
                                   value="${mapMass.ma_man_department }"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_ma_man_grade" class="col-sm-3 control-label">负责人班级：</label>
                        <div class="col-sm-8">
                            <input type="email" name="ma_man_grade" id="e_ma_man_grade" value="${mapMass.ma_man_grade }"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_ma_man_phone" class="col-sm-3 control-label">负责人电话：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_man_phone" id="e_ma_man_phone" value="${mapMass.ma_man_phone }"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_ma_man_email" class="col-sm-3 control-label">负责人邮箱：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_man_email" id="e_ma_man_email" value="${mapMass.ma_man_email }"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_ma_man_qq" class="col-sm-3 control-label">负责人QQ：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_man_qq" id="e_ma_man_qq" value="${mapMass.ma_man_qq }"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_ma_man_weChat" class="col-sm-3 control-label">负责人微信：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_man_weChat" id="e_ma_man_weChat"
                                   value="${mapMass.ma_man_weChat }"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_ma_text" class="col-sm-3 control-label">社团简介：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_text" id="e_ma_text" value="${mapMass.ma_text }"
                                   class="form-control" style="height: 30px;"/>
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
        </center>
    </div>
</center>
</body>
</html>
