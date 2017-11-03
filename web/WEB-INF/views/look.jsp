<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/11/2
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看页面</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.2.1.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        $(function () {
            $.post(
                "/lookActByMassId",
                {
                    "id": "<%=request.getAttribute("massId")%>"
                }, function (data) {
                    var list = "";
                    $.each($.parseJSON(data), function (num, content) {
                        list += "<tr>";
                        list += "<td style='width: 55%'>" + content.ac_name + "</td>"
                            + "<td style='width: 10%'><a href='/lookAc?id=" + content.ac_id + "&type=edit'><span class='glyphicon glyphicon-edit'></span></a>"
                            + "<td style='width: 10%'><a href='/deleteAc?id=" + content.ac_id + "&type=lo'><span class='glyphicon glyphicon-trash'></span></a></td>"
                            + "<td style='width: 10%'>" + content.ac_address + "</td>"
                            +"<td style='width: 15%'>" + content.ac_time + "</td>";
                        list += "</tr>";
                        $("#myActivity").html(list);
                    })
                }
            )
        })
    </script>

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
                                <span class="glyphicon glyphicon-log-in"
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
    <div style="width: 80%;">
        <div class="panel-group" id="accordion">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordion"
                           href="#collapseOne">
                            <div style="width: 80%;text-align: center;">
                                <span style="width: 30%;">社团名称：${mapMass.ma_name }</span>
                                <span style="width: 70%;">社团成员：${mapMass.ma_member }</span>
                            </div>
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse">
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="m_ma_name" class="col-sm-3 control-label">社团名称：</label>
                            <div class="col-sm-8">
                                <input type="text" id="m_ma_name" class="form-control" value="${mapMass.ma_name }"
                                       readonly="readonly"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="m_ma_time" class="col-sm-3 control-label">成立时间：</label>
                            <div class="col-sm-8">
                                <input type="text" id="m_ma_time" class="form-control" value="${mapMass.ma_time }"
                                       readonly="readonly"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="m_ma_member" class="col-sm-3 control-label">社团成员：</label>
                            <div class="col-sm-8">
                                <input type="text" id="m_ma_member" value="${mapMass.ma_member }" class="form-control"
                                       readonly="readonly"
                                       style="height: 30px;"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="m_ma_man_name" class="col-sm-3 control-label">负责人姓名：</label>
                            <div class="col-sm-8">
                                <input type="text" id="m_ma_man_name" value="${mapMass.ma_man_name }"
                                       readonly="readonly"
                                       class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="m_ma_man_department" class="col-sm-3 control-label">负责任院系：</label>
                            <div class="col-sm-8">
                                <input type="text" id="m_ma_man_department" value="${mapMass.ma_man_department }"
                                       readonly="readonly"
                                       class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="m_ma_man_grade" class="col-sm-3 control-label">负责人班级：</label>
                            <div class="col-sm-8">
                                <input type="email" id="m_ma_man_grade" value="${mapMass.ma_man_grade }"
                                       readonly="readonly"
                                       class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="m_ma_man_phone" class="col-sm-3 control-label">负责人电话：</label>
                            <div class="col-sm-8">
                                <input type="text" id="m_ma_man_phone" value="${mapMass.ma_man_phone }"
                                       readonly="readonly"
                                       class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="m_ma_man_email" class="col-sm-3 control-label">负责人邮箱：</label>
                            <div class="col-sm-8">
                                <input type="text" id="m_ma_man_email" value="${mapMass.ma_man_email}"
                                       readonly="readonly"
                                       class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="m_ma_man_qq" class="col-sm-3 control-label">负责人QQ：</label>
                            <div class="col-sm-8">
                                <input type="text" id="m_ma_man_qq" value="${mapMass.ma_man_qq}" readonly="readonly"
                                       class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="m_ma_man_weChat" class="col-sm-3 control-label">负责人微信：</label>
                            <div class="col-sm-8">
                                <input type="text" id="m_ma_man_weChat" value="${mapMass.ma_man_weChat}"
                                       readonly="readonly"
                                       class="form-control"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="m_ma_text" class="col-sm-3 control-label">社团简介：</label>
                            <div class="col-sm-8">
                                <input type="text" id="m_ma_text" class="form-control" value="${mapMass.ma_text}"
                                       readonly="readonly"
                                       style="height: 30px;"/>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <hr>
        <table class="table">
            <thead>
            <tr>
                <th style="width: 55%">活动名称</th>
                <th style="width: 10%">编辑</th>
                <th style="width: 10%">删除</th>
                <th style="width: 10%">举办地点</th>
                <th style="width: 15%">举办时间</th>
            </tr>
            </thead>
            <tbody id="myActivity">

            </tbody>
        </table>
    </div>
</center>
</body>
</html>
