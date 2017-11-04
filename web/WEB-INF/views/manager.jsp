<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/11/2
  Time: 12:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员界面</title>
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
                        list += "<tr>";
                        list += "<td style='width: 60%'><a href='/lookMass?id=" + content.ma_id + "'>" + content.ma_name + "</a></td>"
                            + "<td style='width: 10%'><a href='/toAddMa?type=edit&id=" + content.ma_id + "'><span class='glyphicon glyphicon-edit'></span></a></td>"
                            + "<td style='width: 10%'><a href='/deleteMa?id=" + content.ma_id + "'><span class='glyphicon glyphicon-trash'></span></a></td>"
                            + "<td style='width: 20%'>" + content.ma_time + "</td>";
                        list += "</tr>";
                        $("#myMass").html(list);
                    })
                }
            );
            $.post(
                "/activity",
                function (data) {
                    var list = "";
                    $.each($.parseJSON(data), function (num, content) {
                        list += "<tr>";
                        list += "<td style='width: 30%'><a href='/lookMass?id=" + content.ac_id + "'>" + content.ac_name + "</a></td>"
                            + "<td style='width: 10%'><a href='/lookAc?type=edit&id=" + content.ac_id + "'><span class='glyphicon glyphicon-edit'></span></a>"
                            + "<td style='width: 10%'><a href='/deleteAc?id=" + content.ac_id + "&type=ma'><span class='glyphicon glyphicon-trash'></span></a></td>"
                            + "<td style='width: 20%'>" + content.ac_address + "</td>"
                            + "<td style='width: 10%'>" + content.ac_class + "</td>"
                            + "<td style='width: 20%'>" + content.ac_time + "</td>";
                        list += "</tr>";
                        $("#myActivity").html(list);
                    })
                }
            )
        })
    </script>

    <script type="text/javascript">

        $(function () {
            $("#mass").click(function () {
                if ($("#mass").css("class") != "active") {
                    $("#mass").addClass("active");
                    $("#activity").removeClass("active");
                    $("#listMass").show();
                    $("#listActivity").hide();
                }
            })
            $("#activity").click(function () {
                if ($("#activity").css("class") != "active") {
                    $("#activity").addClass("active");
                    $("#mass").removeClass("active");
                    $("#listActivity").show();
                    $("#listMass").hide();
                }
            })
        })
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
                    <div style="height: 87px;width: 87px;float: right;">
                        <center>
                            <a href="${pageContext.request.contextPath}/toIndex" style="height: 41px;"
                               data-toggle="tooltip" data-placement="bottom"
                               title="退出管理员界面">
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
<br>
<center>
    <div style="width: 80%;text-align: center">
        <div>
            <center>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th id="mass" class="active">社团</th>
                        <th id="activity">活动</th>
                    </tr>
                    </thead>
                </table>
            </center>
        </div>
        <br>

        <div id="listMass" style="width: 80%;text-align: center">
            <table class="table">
                <thead>
                <tr>
                    <th style="width: 70%;">社团概览</th>
                    <th style="width: 30%;text-align: center;">
                        <a href="${pageContext.request.contextPath}/toAddMa?type=add">
                            <button class="btn btn-primary" style="background-color: blue;">
                                <span class="glyphicon glyphicon-plus" style="color: white; font-size: 15px;">添加</span>
                            </button>
                        </a>
                    </th>
                </tr>
                </thead>
            </table>
            <hr>
            <br>
            <table class="table">
                <thead>
                <tr>
                    <th style="width: 60%">社团名称</th>
                    <th style="width: 10%">编辑</th>
                    <th style="width: 10%">删除</th>
                    <th style="width: 20%">成立时间</th>
                </tr>
                </thead>
                <tbody id="myMass">

                </tbody>
            </table>
        </div>

        <div id="listActivity" style="width: 80%;text-align: center;display: none;">
            <table class="table">
                <thead>
                <tr>
                    <th style="width: 70%;">活动概览</th>
                    <th style="width: 30%;text-align: center;">
                        <a href="${pageContext.request.contextPath}/toAddAc">
                            <button class="btn btn-primary" style="background-color: blue;">
                                <span class="glyphicon glyphicon-plus" style="color: white; font-size: 15px;">添加</span>
                            </button>
                        </a>
                    </th>
                </tr>
                </thead>
            </table>
            <hr>
            <br>
            <table class="table">
                <thead>
                <tr>
                    <th style="width: 30%">活动名称</th>
                    <th style="width: 10%">编辑</th>
                    <th style="width: 10%">删除</th>
                    <th style="width: 20%">活动地点</th>
                    <th style="width: 10%">活动类型</th>
                    <th style="width: 20%">活动时间</th>
                </tr>
                </thead>
                <tbody id="myActivity">

                </tbody>
            </table>
        </div>
    </div>
</center>

</body>
</html>
