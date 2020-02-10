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
        <jsp:include page="/common/stu_left.jsp"></jsp:include>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i> 数据列表</h3>
                </div>
                <div class="panel-body">
                    <div>
                        <form class="form-inline" role="form" style="float:left;" method="get"
                              action="${APP_PATH}/student/selectLike">
                            <div class="form-group has-feedback">
                                <div class="input-group">
                                    <div class="input-group-addon">课程查询</div>
                                    <input class="form-control has-success" type="text" placeholder="请输入查询课程"
                                           name="course" value="${requestScope.course}">
                                </div>
                            </div>
                            <button type="submit" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询
                            </button>
                        </form>
                    </div>
                    <div style="margin-left: 40px ;padding-left: 100px;float: left;">
                        <form class="form-inline" role="form" style="float:left;" method="get"
                              action="${APP_PATH}/student/selectLike">
                            <div class="form-group has-feedback">
                                <div class="input-group">
                                    <div class="input-group-addon">教师姓名查询</div>
                                    <input class="form-control has-success" type="text" placeholder="请输入查询教师姓名"
                                           name="tname" value="${requestScope.tname}">
                                </div>
                            </div>
                            <button type="submit" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询
                            </button>
                        </form>
                    </div>
                    <br>
                    <hr style="clear:both;">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>学号</th>
                                <th>姓名</th>
                                <th>性别</th>
                                <th>授课老师</th>
                                <th>课程</th>
                                <th>缺勤数</th>
                                <th>平时分</th>
                                <th>卷面分</th>
                                <th>成绩比例</th>
                                <th>期末成绩</th>
                                <%--<th>操作</th>--%>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="coursegrade" items="${requestScope.info.list}" varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td>
                                    <td>${coursegrade.stuLoginAccount}</td>
                                    <td>${coursegrade.sname}</td>
                                    <td>${coursegrade.ssex}</td>
                                    <td>${coursegrade.tname}</td>
                                    <td>${coursegrade.course}</td>

                                    <td>
                                            ${coursegrade.subtract}
                                    </td>
                                    <td>${coursegrade.agrade}</td>
                                    <td>${coursegrade.bgrade}</td>
                                    <td>${coursegrade.proportion}</td>
                                    <td>${coursegrade.grade}</td>
                                    <%--<td>
                                        <button type="button" class="btn btn-info">
                                            <a href="${APP_PATH}/teacher/toTeacherEndit?sid=${coursegrade.sid}&tid=${coursegrade.tid}&pageNo=${requestScope.pageNo}&tname=${requestScope.tname}&course=${requestScope.course}">
                                                <i class="glyphicon glyphicon-wrench"></i>修改</a>
                                        </button>
                                    </td>--%>
                                </tr>
                            </c:forEach>

                            </tbody>
                            <c:if test="${requestScope.info != null}">
                            <tfoot>
                            <tr>
                                <td colspan="11" style="text-align: center">
                                    <ul class="pagination">
                                        <c:if test="${requestScope.info.hasPreviousPage}">
                                            <li>
                                                <a href="${APP_PATH}/student/selectLike?pageNo=${requestScope.info.prePage}&tname=${requestScope.tname}&course=${requestScope.course}">上一页</a>
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
                                                <li><a href="${APP_PATH}/student/selectLike?pageNo=${num}&tname=${requestScope.tname}&course=${requestScope.course}">${num}</a>
                                                </li>
                                            </c:if>
                                        </c:forEach>

                                        <c:if test="${requestScope.info.hasNextPage}">
                                            <li>
                                                <a href="${APP_PATH}/student/selectLike?pageNo=${requestScope.info.nextPage}&tname=${requestScope.tname}&course=${requestScope.course}">下一页</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${!requestScope.info.hasNextPage}">
                                            <li class="disabled"><a href="#">下一页</a></li>
                                        </c:if>
                                    </ul>
                                </td>
                            </tr>
                            </c:if>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">

</script>
</body>
</html>
