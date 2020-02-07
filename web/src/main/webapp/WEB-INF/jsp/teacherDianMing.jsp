<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 24707
  Date: 2020/2/3
  Time: 0:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
        body {
            background: #000;
        }

        #btn {
            position: absolute;
            top: 100px;
            left: 40%;
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
        }
    </style>
</head>
<body>
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
    var btn = document.getElementById('btn');
    var con = document.getElementById('con');
    var arr = [
        '张馨丹', '李青龙', '郭磊', '张晨', '王耀星', '王丽欢', '冯伟光', '张鑫磊', '王衡', '武?', '霍鑫星', '王潇', '梁晨宁', '韩钧宇', '周浩', '张庆庆', '李帅', '张玉辉', '高蕊慧', '董钰钿', '索夏雨', '唐争强', '刘繁星', '李静妍', '张艳红', '高学光', '王鑫', '韩舒畅', '赵财进', '王宁宁', '顾倩', '李鹏', '王荐', '尹晓雄', '王福森', '石浩琦', "郜仲华", "刘馥泰"
    ];
    var timer = null;
    var len = arr.length;
    var flag = 0;
    //添点击事件
    btn.onclick = click;

    function click() {
        if (flag == 0) {
            btn.innerHTML = 'stop';
            flag = 1;
            timer = setInterval(function () {
                var x = Math.floor(Math.random() * len); //0-38
                con.innerHTML = arr[x];
            }, 20);
        } else {
            flag = 0;
            btn.innerHTML = 'start';
            clearInterval(timer);
        }
    }

    document.onkeydown = function (evt) {
        var event = evt || window.event;
        var eCode = event.keyCode || evetn.which;
        if (eCode == 13 || 32) {
            click();
        }
    }
</script>
</body>
</html>

