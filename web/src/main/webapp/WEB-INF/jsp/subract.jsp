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
    <%--===checkboxes==--%>
    <link type="text/css" rel="stylesheet" href="${APP_PATH}/checkBoxes/check.css"/>
</head>
<body>
<jsp:include page="/common/header.jsp"></jsp:include>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="/common/left.jsp"></jsp:include>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
                </div>
                <div class="panel-body">
                    <div>

                    </div>
                    <br>
                    <hr style="clear:both;">
                    <div class="table-responsive">
                        <form>
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>学号</th>
                                    <th>姓名</th>
                                    <th>性别</th>
                                    <th>缺勤数</th>
                                    <th>是否缺勤</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="coursegrade" items="${requestScope.coursegrades}" varStatus="status">
                                    <tr>
                                        <td>${status.index + 1}</td>
                                        <td>${coursegrade.stuLoginAccount}</td>
                                        <td>${coursegrade.sname}</td>
                                        <td>${coursegrade.ssex}</td>

                                        <td>
                                                ${coursegrade.subtract}
                                        </td>

                                        <td class=" switch">
                                            <label class="cb-enable selected"><span>是</span></label>
                                            <label class="cb-disable "><span>否</span></label>

                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td colspan="6">
                                        <button type="button" onclick="resetForm()" class="btn btn-danger"><i
                                                class="glyphicon glyphicon-remove"></i> 扣分
                                        </button>
                                        <button type="submit" class="btn btn-success"><i
                                                class="glyphicon glyphicon-edit"></i> 提交
                                        </button>
                                    </td>
                                </tr>
                                </tbody>




                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        $(".cb-enable").click(function () {
            var parent = $(this).parents('.switch');
            $('.cb-disable', parent).removeClass('selected');
            $(this).addClass('selected');
            $('.checkbox', parent).attr('checked', true);
        });
        $(".cb-disable").click(function () {
            var parent = $(this).parents('.switch');
            $('.cb-enable', parent).removeClass('selected');
            $(this).addClass('selected');
            $('.checkbox', parent).attr('checked', false);
        });
    });
</script>

</body>
</html>
