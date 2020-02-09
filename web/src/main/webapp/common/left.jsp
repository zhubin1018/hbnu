<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-sm-3 col-md-2 sidebar">
    <div class="tree">
        <ul style="padding-left:0px;" class="list-group">
            <li class="list-group-item tree-closed">
                <a href="${APP_PATH}/toMain"  style="color: #0f0f0f"><i class="glyphicon glyphicon-th-list"></i> 操作</a>
            </li>

            <li class="list-group-item tree-closed">
                <span>
                        <a href="${APP_PATH}/teacher/toSubract"><i class="glyphicon glyphicon-ok"></i> 上课点名</a>
                </span>
            </li>
            <%--<li class="list-group-item tree-closed">
                <span>
                        <a href="${APP_PATH}/teacher/toCheckMingXi"><i class="glyphicon glyphicon-list-alt"></i> 考勤明细</a>
                </span>
            </li>--%>
            <li class="list-group-item tree-closed">
                <span>
                        <a href="${APP_PATH}/toDianMing"><i class="glyphicon glyphicon-user"></i> 点名答题</a>
                </span>
            </li>
            <li class="list-group-item tree-closed">
                <span>
                        <a href="${APP_PATH}/teacher/toTeacherMain"><i class="glyphicon glyphicon-list-alt"></i> 成绩明细</a>
                </span>
            </li>
        </ul>
    </div>
</div>
