<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 24707
  Date: 2020/2/3
  Time: 0:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Teacher</title>
    <link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${APP_PATH}/css/main.css">
    <link rel="stylesheet" href="${APP_PATH}/css/doc.min.css">
    <script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
    <script src="${APP_PATH}/script/docs.min.js"></script>
    <script src="${APP_PATH}/layer/layer.js"></script>

    <style>


        #btn {
            position: absolute;
            top: 100px;
            left: 42%;
            font-size: 80px;
            color: #f00;
            cursor: pointer;
        }

        #con {
            width: 100%;
            height: 600px;
            line-height: 600px;
            font-size: 120px;
            color: red;
            text-align: center;
            margin-left: 200px;
        }
    </style>
</head>
<body style="">
<jsp:include page="/common/header.jsp"></jsp:include>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="/common/left.jsp"></jsp:include>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 点名</h3>
                </div>
                <div class="panel-body">
                    <br><br><br>
                    <div>
                        <button id="btn">start</button>
                        <button type="button" class="btn btn-info" onclick="stuAddFive()" style="float: right"
                                id="stuAddFive"><i class="glyphicon glyphicon-plus"></i>5分
                        </button>
                        <button type="button" class="btn btn-primary" onclick="stuAddTen()" style="float: right"
                                id="stuAddTen"><i class="glyphicon glyphicon-plus">10分</i></button>
                        <button type="button" class="btn btn-warning" onclick="stuSubFive()" style="float: right"
                                id="stuSubFive"><i class="glyphicon glyphicon-minus">5分</i></button>
                        <div id="con">开始</div>
                    </div>
                    <br>
                    <hr style="clear:both;">

                </div>
            </div>
        </div>
    </div>
</div>
<script>


    var sname = null;
    var loadingIndex = null;
    var arr = null;
    var len = null;

    $(function () {
        $.ajax({
            url: "${APP_PATH}/teacher/dianMingByAjax",
            beforeSend: function () {
                loadingIndex = layer.msg('加载名单中，请稍后~~', {icon: 16});
            },
            success: function (result) {
                if (result.success) {
                    arr = result.data;
                    len = result.data.length;
                    layer.open()
                    layer.msg("加载名单成功！", { icon: 6, shift: 3}, function () {
                    });
                } else {
                    layer.msg("加载名单失败了，请联系管理员！", {time: 3000, icon: 5, shift: 6}, null);
                }

            },
            complete: function () {
                layer.close(loadingIndex);
            }
        })
    });


    var btn = document.getElementById('btn');
    var con = document.getElementById('con');


    var timer = null;

    var flag = 0;

    //添点击事件
    btn.onclick = click;

    function click() {
        if (flag == 0) {
            btn.innerHTML = 'stop';
            flag = 1;
            timer = setInterval(function () {
                var x = Math.floor(Math.random() * len);
                sname = arr[x];
                con.innerHTML = arr[x];

            }, 20);
        } else {
            flag = 0;
            btn.innerHTML = 'start';
            clearInterval(timer);
        }
    }

    /*document.onkeydown = function (evt) {
        var event = evt || window.event;
        var eCode = event.keyCode || evetn.which;
        if (eCode == 13 || 32) {
            click();
        }
    }*/

    function stuAddFive() {
        $.ajax({
            url: "${APP_PATH}/teacher/stuAddFiveByAjax",
            data: {
                sname: sname
            },
            method: 'get',
            beforeSend: function () {
                loadingIndex = layer.msg(sname + "加5分中，请稍后~~", {time:3000 ,icon: 16});
            },
            success: function (result) {

                if (result.success) {
                   layer.msg(sname + "加5分成功！", {time: 3000, icon: 6, shift: 3}, function () {
                    });
                } else {
                    layer.msg("加分失败了，请联系管理员！", {time: 3000, icon: 5, shift: 6}, null);
                }

            },
            complete: function () {
                layer.close(loadingIndex);
            }
        });
    }

    function stuAddTen() {
        $.ajax({
            url: "${APP_PATH}/teacher/stuAddTenByAjax",
            data: {
                sname: sname
            },
            method: 'get',
            beforeSend: function () {
                loadingIndex = layer.msg(sname + "加10分中，请稍后~~", {icon: 16});
            },
            success: function (result) {
                if (result.success) {
                    layer.msg(sname + "加10分成功！", {time: 3000, icon: 6, shift: 3}, function () {
                    });
                } else {
                    layer.msg("加分失败了，请联系管理员！", {time: 3000, icon: 5, shift: 6}, null);
                }

            },
            complete: function () {
                layer.close(loadingIndex);
            }
        });
    }

    function stuSubFive() {
        $.ajax({
            url: "${APP_PATH}/teacher/stuSubFiveByAjax",
            data: {
                sname: sname
            },
            method: 'get',
            beforeSend: function () {
                loadingIndex = layer.msg(sname + "减5分中，请稍后~~", {icon: 16});
            },
            success: function (result) {
                if (result.success) {
                    layer.msg(sname + "减5分成功！", {time: 3000, icon: 6, shift: 3}, function () {
                    });
                } else {
                    layer.msg("加分失败了，请联系管理员！", {time: 3000, icon: 5, shift: 6}, null);
                }

            },
            complete: function () {
                layer.close(loadingIndex);
            }
        });
    }
</script>
</body>
</html>

