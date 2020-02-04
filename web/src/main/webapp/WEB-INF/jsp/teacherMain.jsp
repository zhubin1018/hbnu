<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 24707
  Date: 2020/2/3
  Time: 0:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Teacher</title>
    <link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${APP_PATH}/css/login.css">
    <script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
    <script src="${APP_PATH}/layer/layer.js"></script>
</head>
<body>
<jsp:include page="/common/header.jsp"></jsp:include>

<div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
        </div>
        <div class="panel-body">
            <form class="form-inline" role="form" style="float:left;">
                <div class="form-group has-feedback">
                    <div class="input-group">
                        <div class="input-group-addon">查询条件</div>
                        <input class="form-control has-success" type="text" placeholder="请输入查询条件">
                    </div>
                </div>
                <button type="button" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询</button>
            </form>
            <button type="button" class="btn btn-danger" style="float:right;margin-left:10px;"><i
                    class=" glyphicon glyphicon-remove"></i> 删除
            </button>
            <button type="button" class="btn btn-primary" style="float:right;"
                    onclick="window.location.href='add.html'"><i class="glyphicon glyphicon-plus"></i> 新增
            </button>
            <br>
            <hr style="clear:both;">
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>学号</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>授课老师</th>
                        <th>课程</th>
                        <th>课堂加分</th>
                        <th>缺勤数</th>
                        <th>平时分</th>
                        <th>卷面分</th>
                        <th>成绩比例</th>
                        <th>期末成绩</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="coursegrade" items="${requestScope.coursegrades}">
                        <tr>
                            <td>${coursegrade.stuLoginAccount}</td>
                            <td>${coursegrade.sname}</td>
                            <td>${coursegrade.ssex}</td>
                            <td>${coursegrade.tname}</td>
                            <td>${coursegrade.course}</td>
                            <td>${coursegrade.add}</td>
                            <td>${coursegrade.subtract}</td>
                            <td>${coursegrade.agrade}</td>
                            <td>${coursegrade.bgrade}</td>
                            <td>${coursegrade.proportion}</td>
                            <td>${coursegrade.grade}</td>
                            <td><button type="button" class="btn btn-info"><i class="glyphicon glyphicon-wrench"></i>修改</button></td>
                        </tr>
                    </c:forEach>
                    <c:if test="${requestScope.coursegrades != null}">
                        <tr>
                            <td colspan="12" style="text-align: center">
                                <ul class="pagination">
                                    <li><a href="#">&laquo;</a></li>
                                    <li class="active"><a href="#">1</a></li>
                                    <li class="disabled"><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#">5</a></li>
                                    <li><a href="#">&raquo;</a></li>
                                </ul>
                            </td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</body>
</html>
