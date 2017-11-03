<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/11/1
  Time: 22:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/jquery-ui.min.css"/>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-3.2.1.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/statics/js/jquery-ui.min.js"></script>

    <script type="text/javascript">
        $(function () {

            setTimeout(function () {
                $("#one").hide();
                $("#myCarousel").show();
            }, 60000);

            $("#boss").click(function () {
                $("#one").show();
                $("#myCarousel").hide();
            });

            $("[data-toggle='tooltip']").tooltip();

            $.post(
                "/mass",
                function (data) {
                    var list = "";
                    $.each($.parseJSON(data), function (num, content) {
                        list += "<tr>";
                        list += "<td style='width: 80%'><a href='/massDetail?id=" + content.ma_id + "'>" + content.ma_name + "</a></td>"
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
                        list += "<td style='width: 60%'><a href='/activityDetail?id=" + content.ac_id + "'>" + content.ac_name + "</a></td>"
                            + "<td style='width: 20%'>" + content.ac_address + "</td>"
                            + "<td style='width: 20%'>" + content.ac_time + "</td>";
                        list += "</tr>";
                        $("#myActivity").html(list);
                    })
                }
            )
        })
    </script>

    <script type="text/javascript">
        var mapAc = "<%=request.getAttribute("mapAc")%>";
        var mapMass = "<%=request.getAttribute("mapMass")%>";

        function acType(data) {
            if (data == 1) {
                return "歌唱类";
            } else if (data == 2) {
                return "跳舞类";
            } else if (data == 3) {
                return "相声类";
            } else if (data == 4) {
                return "讲座类";
            } else if (data == 5) {
                return "书法类";
            } else if (data == 6) {
                return "其他";
            }
        }

        $(function () {
            if (mapAc != null && mapAc != "null") {
                var ac_class = acType(${mapAc.ac_class});
                $("#m_ac_class").attr("value", ac_class);
                $("#myModalActivity").modal("show");
            }

            if (mapMass != null && mapMass != "null") {
                console.log("mapAc: " + mapAc);
                $("#myModalMass").modal("show");
            }

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

    </script>

    <script type="text/javascript">
        $(function () {
            $("#search").autocomplete({
                source: function (request, response) {
                $.post(
                    "/search",
                    {
                        "data": $("#search").val(),
                        "type":"mo"
                    }, function (data) {
                        response($.map($.parseJSON(data), function (item) {
                            return {
                                label: item.name,
                                value: item.name
                            }
                        }))
                    })
                }
            })

            $("#cli").click(function () {
                $("#myMass").hide();
                $("#myActivity").hide();
                $.post(
                    "/search",
                    {
                        "data":$("#search").val(),
                        "type":"on"
                    },function (data) {
                        console.log(data);
                        var list = "";
                        $.each($.parseJSON(data),function (num,content) {
                            if (content.ac_name != null && content.ac_name != "null" && content.ac_name != undefined){
                                $("#activity").addClass("active");
                                $("#mass").removeClass("active");
                                $("#onActivity").show();
                                $("#onMass").hide();
                                list += "<tr>";
                                list += "<td style='width: 60%'><a href='/activityDetail?id=" + content.ac_id + "'>" + content.ac_name + "</a></td>"
                                    + "<td style='width: 20%'>" + content.ac_address + "</td>"
                                    + "<td style='width: 20%'>" + content.ac_time + "</td>";
                                list += "</tr>";
                                $("#onActivity").html(list);
                            }
                            if (content.ma_name != null && content.ma_name != "null" && content.ma_name != undefined){
                                $("#mass").addClass("active");
                                $("#activity").removeClass("active");
                                $("#onMass").show();
                                $("#onActivity").hide();
                                list += "<tr>";
                                list += "<td style='width: 80%'><a href='/massDetail?id=" + content.ma_id + "'>" + content.ma_name + "</a></td>"
                                    + "<td style='width: 20%'>" + content.ma_time + "</td>";
                                list += "</tr>";
                                $("#onMass").html(list);
                            }
                        })
                    }
                )
            })
        })

    </script>

</head>

<body id="boss">

<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="2000">
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner">
        <div class="item active">
            <img src="${pageContext.request.contextPath}/statics/img/1.jpg" alt="First slide"
                 style="background-size: cover;">
        </div>
        <div class="item">
            <img src="${pageContext.request.contextPath}/statics/img/2.jpg" alt="Second slide">
        </div>
        <div class="item">
            <img src="${pageContext.request.contextPath}/statics/img/3.jpg" alt="Third slide">
        </div>
    </div>
    <!-- 轮播（Carousel）导航 -->
    <a class="carousel-control left" href="#myCarousel"
       data-slide="prev">&lsaquo;</a>
    <a class="carousel-control right" href="#myCarousel"
       data-slide="next">&rsaquo;</a>
</div>

<div id="one" style="display: none;">
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
                        <table style="height:87px; width: 500px" cellpadding="0" cellspacing="0">
                            <div style="color: white;width: 400px;text-align: left">
                                <tr>
                                    <td width="40%">
                                        <input type="text" maxlength="100" style="height: 41px;width: 100%"
                                               name="search" id="search" placeholder="社团或活动查询" autocomplete="on"/>
                                    </td>
                                    <td width="10%">
                                        <div style="background-color:#1e50ae;height:41px;width: 100%;">
                                            <center>
                                                <a href="javascript:void(0)" id="cli">
                                                    <span data-toggle="modal" data-target="#myModal">
                                                        <span style="color: rgb(255, 255, 255);line-height:41px;font-size:30px;"
                                                              class="glyphicon glyphicon-search"></span>
                                                    </span>
                                                </a>
                                            </center>
                                        </div>
                                    </td>
                                </tr>
                            </div>
                        </table>
                    </li>
                    <li>
                        <div style="height: 87px;width: 87px;">
                            <center>
                                <a href="/toLogin" style="height: 41px;" data-toggle="tooltip" data-placement="bottom"
                                   title="管理员登录">
                                    <span class="glyphicon glyphicon-user"
                                          style="color: black; font-size: 32px;margin-top: 25px;"></span>
                                </a>
                            </center>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <hr>
    <br>
    <div>
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
                            <th style="width: 80%">社团名称</th>
                            <th style="width: 20%">成立时间</th>
                        </tr>
                        </thead>
                        <tbody id="myMass">

                        </tbody>
                        <tbody id="onMass">

                        </tbody>
                    </table>
                </div>

                <div id="listActivity" style="width: 80%;text-align: center;display: none">
                    <table class="table">
                        <thead>
                        <tr>
                            <th style="width: 60%">活动名称</th>
                            <th style="width: 20%">地点</th>
                            <th style="width: 20%">时间</th>
                        </tr>
                        </thead>
                        <tbody id="myActivity">

                        </tbody>
                        <tbody id="onActivity">

                        </tbody>
                    </table>
                </div>
            </div>
        </center>
    </div>
</div>

<div class="modal fade" id="myModalMass" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabelMass">社团信息</h4>
            </div>
            <div class="modal-body">
                <form role="form">
                    <div class="form-group">
                        <label for="e_ma_name" class="col-sm-3 control-label">社团名称：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_name" id="e_ma_name" value="${mapMass.ma_name }"
                                   readonly="readonly"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_ma_time" class="col-sm-3 control-label">成立时间：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_time" id="e_ma_time" value="${mapMass.ma_time }"
                                   readonly="readonly"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_ma_member" class="col-sm-3 control-label">社团成员：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_member" id="e_ma_member" value="${mapMass.ma_member }"
                                   readonly="readonly"
                                   class="form-control" style="height: 30px;"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_ma_man_name" class="col-sm-3 control-label">负责人姓名：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_man_name" id="e_ma_man_name" value="${mapMass.ma_man_name }"
                                   readonly="readonly" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_ma_man_department" class="col-sm-3 control-label">负责任院系：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_man_department" id="e_ma_man_department"
                                   value="${mapMass.ma_man_department }"
                                   readonly="readonly" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_ma_man_grade" class="col-sm-3 control-label">负责人班级：</label>
                        <div class="col-sm-8">
                            <input type="email" name="ma_man_grade" id="e_ma_man_grade" value="${mapMass.ma_man_grade }"
                                   readonly="readonly" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_ma_man_phone" class="col-sm-3 control-label">负责人电话：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_man_phone" id="e_ma_man_phone" value="${mapMass.ma_man_phone }"
                                   readonly="readonly" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_ma_man_email" class="col-sm-3 control-label">负责人邮箱：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_man_email" id="e_ma_man_email" value="${mapMass.ma_man_email }"
                                   readonly="readonly" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_ma_man_qq" class="col-sm-3 control-label">负责人QQ：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_man_qq" id="e_ma_man_qq" value="${mapMass.ma_man_qq }"
                                   readonly="readonly" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_ma_man_weChat" class="col-sm-3 control-label">负责人微信：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_man_weChat" id="e_ma_man_weChat"
                                   value="${mapMass.ma_man_weChat }"
                                   readonly="readonly" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="e_ma_text" class="col-sm-3 control-label">社团简介：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_text" id="e_ma_text" value="${mapMass.ma_text }"
                                   readonly="readonly" class="form-control" style="height: 30px;"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <a href="#">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </a>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModalActivity" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabelActivity">活动详细信息</h4>
            </div>
            <div class="modal-body">
                <form role="form">
                    <div class="form-group">
                        <label for="m_ac_name" class="col-sm-3 control-label">活动名称：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ac_name" id="m_ac_name" value="${mapAc.ac_name }"
                                   readonly="readonly"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m_ac_time" class="col-sm-3 control-label">活动时间：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ac_time" id="m_ac_time" value="${mapAc.ac_time}"
                                   readonly="readonly"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m_ac_address" class="col-sm-3 control-label">活动地点：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ac_address" id="m_ac_address" value="${mapAc.ac_address}"
                                   readonly="readonly"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m_ac_mainMass" class="col-sm-3 control-label">主办社团：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ac_mainMass" id="m_ac_mainMass" value="${mapAc.ac_mainMass}"
                                   readonly="readonly"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m_ac_class" class="col-sm-3 control-label">活动类型：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ac_class" id="m_ac_class" value="" readonly="readonly"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m_ma_man_grade" class="col-sm-3 control-label">活动规模：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ma_man_grade" id="m_ma_man_grade" value="${mapAc.ac_scale }人"
                                   readonly="readonly"
                                   class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="m_ac_text" class="col-sm-3 control-label">活动简介：</label>
                        <div class="col-sm-8">
                            <input type="text" name="ac_text" id="m_ac_text" value="${mapAc.ac_text}"
                                   readonly="readonly"
                                   class="form-control" style="height: 30px;"/>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <a href="#">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </a>
            </div>
        </div>
    </div>
</div>

</body>
</html>
