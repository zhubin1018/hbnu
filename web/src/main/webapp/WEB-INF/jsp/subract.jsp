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
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>日期</th>
                                <th>学号</th>
                                <th>姓名</th>
                                <th>性别</th>
                                <th>缺勤数</th>
                                <th>请假数</th>
                                <th>备注</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="coursegrade" items="${requestScope.info.list}" varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td>
                                    <td id="myDate_${coursegrade.sid}">${coursegrade.dateObj}</td>
                                    <td>${coursegrade.stuLoginAccount}</td>
                                    <td>${coursegrade.sname}</td>
                                    <td>${coursegrade.ssex}</td>
                                    <td>
                                            ${coursegrade.subtract}
                                    </td>

                                    <td>${coursegrade.qingjia}</td>
                                    <td id="td_${coursegrade.sid}">
                                        <c:if test="${coursegrade.beiZhu != null && coursegrade.beiZhu != ''}">
                                            ${coursegrade.beiZhu}
                                        </c:if>
                                    </td>
                                    <td>
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-primary dropdown-toggle btn-sm"
                                                    data-toggle="dropdown">
                                                <i class="glyphicon glyphicon-edit"></i>记录 <span
                                                    class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu" role="menu">
                                                <li><a href="#" onclick="stu_yiDao(${coursegrade.sid})">已到</a></li>
                                                <li class="divider"></li>
                                                <li><a href="#" onclick="stu_QingJia(${coursegrade.sid})">请假</a></li>
                                                <li class="divider"></li>
                                                <li><a href="#"
                                                       onclick="stu_queQin_subFive(${coursegrade.sid})">缺勤扣5分</a></li>
                                                <li class="divider"></li>
                                                <li><a href="#"
                                                       onclick="stu_queQin_subTen(${coursegrade.sid})">缺勤扣10分</a></li>
                                                <li class="divider"></li>
                                                <li><a href="#" onclick="stu_queQin_subFifteen(${coursegrade.sid})">缺勤扣15分</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="12" style="text-align: center">
                                    <ul class="pagination">
                                        <c:if test="${requestScope.info.hasPreviousPage}">
                                            <li>
                                                <a href="${APP_PATH}/teacher/toSubract?pageNo=${requestScope.info.prePage}">上一页</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${!requestScope.info.hasPreviousPage}">
                                            <li class="disabled"><a href="#">上一页</a></li>
                                        </c:if>
                                        <c:forEach items="${requestScope.info.navigatepageNums}" var="num">
                                            <%--判断正在遍历的页码是不是当前页面 如果是 应该显示active样式--%>
                                            <c:if test="${num == requestScope.info.pageNum}">
                                                <li class="active"><a href="#">${num}<span
                                                        class="sr-only">(current)</span></a></li>
                                            </c:if>
                                            <c:if test="${num != requestScope.info.pageNum}">
                                                <li><a href="${APP_PATH}/teacher/toSubract?pageNo=${num}">${num}</a>
                                                </li>
                                            </c:if>
                                        </c:forEach>

                                        <c:if test="${requestScope.info.hasNextPage}">
                                            <li>
                                                <a href="${APP_PATH}/teacher/toSubract?pageNo=${requestScope.info.nextPage}">下一页</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${!requestScope.info.hasNextPage}">
                                            <li class="disabled"><a href="#">下一页</a></li>
                                        </c:if>
                                    </ul>
                                </td>
                            </tr>
                            </tfoot>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var dateObj = '${requestScope.dateObj}';
    var loadingIndex = null;

    function stu_yiDao(obj) {
        var id = "td_" + obj;
        var sid = obj;
        var arr = document.getElementById(id);
        var str = '已到';
        arr.innerHTML = str;
        $.ajax({
            url: "${APP_PATH}/teacher/toCheckByAjax",
            data: {
                str: str,
                sid: sid,
                dateObj: dateObj
            },
            beforeSend: function () {
                loadingIndex = layer.msg('正在记录考勤，请稍候~~', {icon: 16});
            },
            success: function (result) {
                if (result.success) {
                    layer.msg("考勤记录成功！", {time: 3000, icon: 6, shift: 4}, function () {
                        // 跳转页面
                    });
                } else {
                    layer.msg("考勤记录失败了，请联系管理员！", {time: 3000, icon: 5, shift: 6}, null);
                }
            },
            complete: function () {
                layer.close(loadingIndex);
            }
        });
    }

    function stu_QingJia(obj) {
        var id = "td_" + obj;
        var arr = document.getElementById(id);
        var sid = obj;
        var str = '请假';
        arr.innerHTML = str;
        $.ajax({
            url: "${APP_PATH}/teacher/toCheckByAjax",
            data: {
                str: str,
                sid: sid,
                dateObj: dateObj
            },
            beforeSend: function () {
                loadingIndex = layer.msg('正在记录考勤，请稍候~~', {icon: 16});
            },
            success: function (result) {
                if (result.success) {
                    layer.msg("考勤记录成功！", {time: 3000, icon: 6, shift: 4}, function () {
                        // 跳转页面
                    });
                } else {
                    layer.msg("考勤记录失败了，请联系管理员！", {time: 3000, icon: 5, shift: 6}, null);
                }
            },
            complete: function () {
                layer.close(loadingIndex);
            }
        });
    }

    function stu_queQin_subFive(obj) {
        var id = "td_" + obj;
        var arr = document.getElementById(id);
        var sid = obj;
        var str = '缺勤扣5分';
        arr.innerHTML = str;
        $.ajax({
            url: "${APP_PATH}/teacher/toCheckByAjax",
            data: {
                str: str,
                sid: sid,
                dateObj: dateObj
            },
            beforeSend: function () {
                loadingIndex = layer.msg('正在记录考勤，请稍候~~', {icon: 16});
            },
            success: function (result) {
                if (result.success) {
                    layer.msg("考勤记录成功！", {time: 3000, icon: 6, shift: 4}, function () {
                        // 跳转页面
                    });
                } else {
                    layer.msg("考勤记录失败了，请联系管理员！", {time: 3000, icon: 5, shift: 6}, null);
                }
            },
            complete: function () {
                layer.close(loadingIndex);
            }
        });
    }

    function stu_queQin_subTen(obj) {
        var id = "td_" + obj;
        var sid = obj;
        var arr = document.getElementById(id);
        var str = '缺勤扣10分';
        arr.innerHTML = str;
        $.ajax({
            url: "${APP_PATH}/teacher/toCheckByAjax",
            data: {
                str: str,
                sid: sid,
                dateObj: dateObj
            },
            beforeSend: function () {
                loadingIndex = layer.msg('正在记录考勤，请稍候~~', {icon: 16});
            },
            success: function (result) {
                if (result.success) {
                    layer.msg("考勤记录成功！", {time: 3000, icon: 6, shift: 4}, function () {
                        // 跳转页面
                    });
                } else {
                    layer.msg("考勤记录失败了，请联系管理员！", {time: 3000, icon: 5, shift: 6}, null);
                }
            },
            complete: function () {
                layer.close(loadingIndex);
            }
        });
    }

    function stu_queQin_subFifteen(obj) {
        var id = "td_" + obj;
        var sid = obj;
        var arr = document.getElementById(id);
        var str = '缺勤扣15分';
        arr.innerHTML = str;
        $.ajax({
            url: "${APP_PATH}/teacher/toCheckByAjax",
            data: {
                str: str,
                sid: sid,
                dateObj: dateObj
            },
            beforeSend: function () {
                loadingIndex = layer.msg('正在记录考勤，请稍候~~', {icon: 16});
            },
            success: function (result) {
                if (result.success) {
                    layer.msg("考勤记录成功！", {time: 3000, icon: 6, shift: 4}, function () {
                        // 跳转页面
                    });
                } else {
                    layer.msg("考勤记录失败了，请联系管理员！", {time: 3000, icon: 5, shift: 6}, null);
                }
            },
            complete: function () {
                layer.close(loadingIndex);
            }
        });
    }

   /* $(function () {

        var mydate = new Date();
        dateObj = "" + mydate.getFullYear() + "年";
        dateObj += (mydate.getMonth() + 1) + "月";
        dateObj += mydate.getDate() + "日";
        dateObj += mydate.getHours() + "时";


        <%--<c:forEach  var="coursegrade" items="${requestScope.coursegrades}">--%>
        var idObj = "myDate_" +<%--${coursegrade.sid};--%>
        var arr = document.getElementById(idObj);
        arr.innerHTML = dateObj;
        <%--</c:forEach>--%>
    });*/

</script>
</body>
</html>
