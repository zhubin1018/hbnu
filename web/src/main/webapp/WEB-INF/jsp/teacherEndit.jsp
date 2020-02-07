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
                    <form role="form" id="form" method="post" action="${APP_PATH}/teacher/index">
                        <input type="hidden" id="pageNo" name="pageNo" value="${requestScope.pageNo}">

                        <input type="hidden" id="stuLog" name="stuLog" value="${requestScope.stuLog}">
                        <input type="hidden" id="stuName" name="stuName" value="${requestScope.stuName}">

                        <input type="hidden" id="sid" name="sid" value="${requestScope.coursegrade.sid}">
                        <input type="hidden" id="tid" name="tid" value="${requestScope.coursegrade.tid}">
                        <div class="form-group">
                            <label for="stuLoginAccount">学号</label>
                            <input type="text" class="form-control" id="stuLoginAccount" name="stuLoginAccount"
                                   value="${requestScope.coursegrade.stuLoginAccount}" disabled>
                        </div>
                        <div class="form-group">
                            <label for="sname">姓名</label>
                            <input type="text" class="form-control" id="sname" name="sname" value="${requestScope.coursegrade.sname}"
                                   disabled>
                        </div>
                        <div class="form-group">
                            <label for="course">课目</label>
                            <input type="text" class="form-control" id="course" name="course"
                                   value="${requestScope.coursegrade.course}" disabled>
                        </div>
                        <div class="form-group">
                            <label for="agrade">平时分</label>
                            <input type="text" class="form-control" id="agrade" name="agrade"
                                   value="${requestScope.coursegrade.agrade}">
                        </div>
                        <div class="form-group">
                            <label for="bgrade">卷面分</label>
                            <input type="text" class="form-control" id="bgrade" name="bgrade"
                                   value="${requestScope.coursegrade.bgrade}">
                        </div>
                        <div class="form-group">
                            <label for="proportion">成绩比例</label>
                            <input type="text" class="form-control" id="proportion" name="proportion"
                                   value="${requestScope.coursegrade.proportion}" disabled>
                        </div>
                        <div class="form-group">
                            <label for="grade">期末成绩</label>
                            <input type="text" class="form-control" id="grade" value="${requestScope.coursegrade.grade}" name="grade"
                                   disabled>
                        </div>
                        <button type="submit" class="btn btn-success"><i class="glyphicon glyphicon-edit"></i> 修改</button>
                        <button type="button" onclick="resetForm()" class="btn btn-danger"><i class="glyphicon glyphicon-refresh"></i> 重置</button>
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
        /*var agrade = $("#agrade").val();
        var bgrade = $("#bgrade").val();
        if (agrade > 100) {
            layer.msg("平时分不能大于100！", {time: 3000, icon: 5, shift: 6}, null);
            return;
        }
        if (bgrade > 100) {
            layer.msg("成绩不能大于100！", {time: 3000, icon: 5, shift: 6}, null);
            return;
        }
         var form =   document.getElementById('form');
        form.submit();*/
    }


    function resetForm() {
        // dom对象  jquery对象    reset 是 dom 对象的方法
        // jquery对象  --> dom对象
        $("#form")[0].reset();
    }
</script>
</body>
</html>
