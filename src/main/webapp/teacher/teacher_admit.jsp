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
    <link href="../dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="../dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/userCheck.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row flex-nowrap">
        <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
            <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                <a href="/" class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                    <span class="fs-5 d-none d-sm-inline">欢迎使用</span>
                </a>
                <hr>
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                    <li class="nav-item">
                        <a href="teacher_admit.jsp" class="nav-link align-middle px-0">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">打卡</span>
                        </a>
                    </li>
                    <li>
                        <a href="teacher_history.jsp" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-table"></i> <span class="ms-1 d-none d-sm-inline">个人打卡记录</span></a>
                    </li>
                    <li>
                        <a href="#submenu2" data-bs-toggle="collapse" class="nav-link px-0 align-middle ">
                            <i class="fs-4 bi-bootstrap"></i> <span class="ms-1 d-none d-sm-inline">个人打卡日历</span></a>
                        <ul class="collapse nav flex-column ms-1" id="submenu2" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">月度</span> 1</a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">年度</span> 2</a>
                            </li>
                        </ul>
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
                        <li><a class="dropdown-item" href="../index.jsp">登出</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col py-3">
            <h3 class="text-left"><mark>打卡信息填报</mark></h3>
            <%
                sql.setDbName(dbName);
                sql.connect();
                String tp = session.getAttribute("type").toString();
                String ac = session.getAttribute("account").toString();
                out.print(tp);
                out.print(ac);
                String sq = "select * from teacher where "+tp+" = '"+ac+"'";
                ResultSet rs = sql.query(sq);
                String id = "", n = "", ins = "";
                while (rs.next()) {
                    id = rs.getString("id");
                    n = rs.getString("Name");
                    ins = rs.getString("Institute");
                }
            %>
            <form action="teacher_admitback.jsp">
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">ID</label>
                    <div class="col-sm-10">
                        <input type="text" readonly class="form-control-plaintext" name="inputid" value="<%=id%>">
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">姓名</label>
                    <div class="col-sm-10">
                        <input type="text" readonly class="form-control-plaintext" name="inputname" value="<%=n%>">
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">所在学院</label>
                    <div class="col-sm-10">
                        <input type="text" readonly class="form-control-plaintext" name="inputinstitute" value="<%=ins%>">
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">核酸检测结果</label>
                    <div class="col-sm-10">
                        <select class="form-select" name="inputtest">
                            <option>阴性</option>
                            <option>阳性</option>
                        </select>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">是否在四川省内</label>
                    <div class="col-sm-10">
                        <select class="form-select" name="inputloc">
                            <option>是</option>
                            <option>否</option>
                        </select>
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">打卡日期</label>
                    <div class="col-sm-10">
                        <input type="date" name="inputedate">
                    </div>
                </div>
                <div class="row mb-3">
                    <label class="col-sm-2 col-form-label">打卡时间</label>
                    <div class="col-sm-10">
                        <div class='input-group date'>
                            <input type="time" name="inputtime">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-10 offset-sm-2">
                        <button type="submit" class="btn btn-primary">提交</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>