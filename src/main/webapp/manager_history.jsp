<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.tool.Constant" %>
<%@ page import="java.sql.*" %>
<%@ page import="static com.tool.Constant.sql" %>
<%@ page import="static com.tool.Constant.dbName" %>
<!DOCTYPE html>
<html>
<head>
    <title>manager_history</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/userCheck.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                <a href="manager.jsp" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                    <span class="fs-5 d-none d-sm-inline">欢迎使用</span>
                </a>
                <hr>
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                    <li>
                        <a href="#submenu1" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-speedometer2"></i> <span class="ms-1 d-none d-sm-inline">全校账号管理</span>
                        </a>
                        <ul class="collapse show nav flex-column ms-1" id="submenu1" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="manager_InstituteAccount.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">学院账号</span></a>
                            </li>
                            <li>
                                <a href="manager_TeacherAccount.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">教师账号</span></a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="manager_Check.jsp" class="nav-link align-middle px-0">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">全校打卡情况</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="manager_history.jsp" class="nav-link align-middle px-0">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">历史记录</span>
                        </a>
                    </li>
                </ul>
                <hr>
                <div class="dropdown pb-4">
                    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
                       id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="https://github.com/mdo.png" alt="hugenerd" width="30" height="30"
                             class="rounded-circle">
                        <span class="d-none d-sm-inline mx-1">测试用户</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
                        <li><a class="dropdown-item" href="#">个人资料</a></li>
                        <li><a class="dropdown-item" href="#">修改密码</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="index.jsp">登出</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col py-3">
            <h3 class="text-left"><mark>历史打卡记录</mark></h3>
            <%
                sql.setDbName(dbName);
                sql.connect();
                ResultSet rs = null;
                rs = sql.query("select * from teacher_test");
            %>
            <div class="table-responsive">
                <table class="table table-hover table-light">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>姓名</th>
                        <th>学院</th>
                        <th>核酸检测结果</th>
                        <th>所在地</th>
                        <th>打卡日期</th>
                        <th>打卡时间</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        //遍历结果集
                        while(rs.next()){
                    %>
                    <tr>
                        <td><%=rs.getString("ID")%></td>
                        <td><%=rs.getString("Name")%></td>
                        <td><%=rs.getString("Institute")%></td>
                        <td><%=rs.getString("Test")%></td>
                        <td><%=rs.getString("Location")%></td>
                        <td><%=rs.getString("CheckDate")%></td>
                        <td><%=rs.getString("CheckTime")%></td>
                    <%}%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>