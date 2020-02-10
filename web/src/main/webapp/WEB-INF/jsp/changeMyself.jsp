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
</head>
<body>
<jsp:include page="/common/header.jsp"></jsp:include>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="/common/left.jsp"></jsp:include>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li><a href="#">数据列表</a></li>
                <li class="active">修改</li>
            </ol>
            <div class="panel panel-default">
                <div class="panel-heading">表单数据
                    <div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i
                            class="glyphicon glyphicon-question-sign"></i></div>
                </div>
                <div class="panel-body">
                    <form role="form" id="form" method="post" action="${APP_PATH}/toChange">
                        <div class="form-group">
                            <label for="loginAccount">登录账号</label>
                            <input type="text" class="form-control" id="loginAccount" name="loginAccount"
                                   value="${requestScope.user.loginAccount}" disabled>
                        </div>
                        <div class="form-group">
                            <label for="name">
                                <c:if test="${(requestScope.user.userType).equals('teacher')}">
                                    教师
                                </c:if>
                                <c:if test="${(requestScope.user.userType).equals('student')}">
                                    学生
                                </c:if>
                                <c:if test="${(requestScope.user.userType).equals('parents')}">
                                    孩子
                                </c:if>
                                姓名</label>
                            <input type="text" class="form-control" id="name" name="name"
                                   value="${requestScope.name}"
                                   disabled>
                        </div>
                        <c:if test="${(requestScope.user.userType).equals('student') || (requestScope.user.userType).equals('parents')}">
                            <div class="form-group">
                                <label for="ssex">性别</label>
                                <input type="text" class="form-control" id="ssex" name="ssex"
                                       value="${requestScope.ssex}">
                            </div>
                        </c:if>
                        <c:if test="${(requestScope.user.userType).equals('teacher')}">
                            <div class="form-group">
                                <label for="course">传授课目</label>
                                <input type="text" class="form-control" id="course" name="course"
                                       value="${requestScope.course}">
                            </div>
                        </c:if>
                        <div class="form-group">
                            <label for="password">登录密码</label>
                            <input type="text" class="form-control" id="password" name="password"
                                   value="${requestScope.user.password}">
                        </div>
                        <button type="button" onclick="updateCoursegrade()" class="btn btn-success"><i
                                class="glyphicon glyphicon-edit"></i> 修改
                        </button>
                        <button type="button" onclick="resetForm()" class="btn btn-danger"><i
                                class="glyphicon glyphicon-refresh"></i> 重置
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">

    function updateCoursegrade() {

        // 获取用户数据的数据

        var password = $("#password").val();
        <c:if test="${(requestScope.user.userType).equals('teacher')}">
        var course = $("#course").val();
        if (course == '') {
            layer.msg("传授课目不能为空", {time: 3000, icon: 5, shift: 6}, null);
            return;
        }
        </c:if>

        if (password == '') {
            layer.msg("登录密码不能为空", {time: 3000, icon: 5, shift: 6}, null);
            return;
        }
        if (password.length < 6) {
            layer.msg("登录密码不能小于6位数", {time: 3000, icon: 5, shift: 6}, null);
            return;
        }
        var form = document.getElementById('form');
        form.submit();
    }


    function resetForm() {
        // dom对象  jquery对象    reset 是 dom 对象的方法
        // jquery对象  --> dom对象
        $("#form")[0].reset();
    }
</script>
</body>
</html>

