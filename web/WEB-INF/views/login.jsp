<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2017/11/2
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登录</title>
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

<div style="width: 1349px; height: 600px; cursor: default; overflow: hidden; display: block; outline: none; margin: 0px auto; position: relative; z-index: 1;
    background-size: cover; background: url(/statics/img/login.jpg) no-repeat 50% 50%;">
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
    <center>
        <div style="width: 380px;height: 320px;background-color: white">
            <center>
                <table>
                    <tr>
                        <td>
                            <div style="color: blue;font-weight: 800;font-size: 30px">登录</div>
                        </td>
                    </tr>
                </table>
            </center>
            <hr>
            <form action="${pageContext.request.contextPath}/login" method="post"
                  class="bs-example bs-example-form" role="form">
                <center>
                    <table>
                        <tr>
                            <td align="center">
                                <div class="input-group">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-user" style="color: #969696;"></span>
                                </span>
                                    <input type="text" class="form-control" name="username" placeholder="登录账号"
                                           style="width: 240px;height: 40px;">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <div class="input-group">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-lock" style="color: #969696;"></span>
                                </span>
                                    <input type="password" class="form-control" name="password" placeholder="登录密码"
                                           style="width: 240px;height: 40px;">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                <div class="input-group">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-heart" style="color: #969696;"></span>
                                    </span>
                                    <input type="text" class="form-control" name="validation" placeholder="请输入验证码"
                                           style="width: 240px;height: 40px;"/>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td width="108" valign="middle" colspan="8" align="center">
                                <img src="${pageContext.request.contextPath}/validation" name="validate" border="0"
                                     onclick="this.src=this.src+'?'" style="width: 140px">
                            </td>
                        </tr>
                        <tr>
                            <td align="center">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="submit" value="登录" class="btn btn-primary"
                                       style="width:240px;height:30px;background-color: blue;color: white"/>
                            </td>
                        </tr>
                    </table>
                </center>
            </form>
        </div>
    </center>
</div>
</body>
</html>
