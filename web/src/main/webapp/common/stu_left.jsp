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
                        <a href="${APP_PATH}/student/toStudentMain"><i class="glyphicon glyphicon-list-alt">成绩明细</i> </a>
                </span>
            </li>

            <li class="list-group-item tree-closed">
                <span>
                        <a href="${APP_PATH}/"><i class="glyphicon glyphicon-list-alt"></i> 考勤明细</a>
                </span>
            </li>
        </ul>
    </div>
</div>
