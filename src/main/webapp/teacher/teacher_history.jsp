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
            <a href="#" class="nav-link px-0 align-middle">
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
      <h3 class="text-left"><mark>历史打卡记录</mark></h3>
      <%
        sql.setDbName(dbName);
        sql.connect();
        String tp = session.getAttribute("type").toString();
        String ac = session.getAttribute("account").toString();
        ResultSet rs1 = null;
        ResultSet rs = null;
        rs1 = sql.query("select * from teacher where '"+tp+"' = '"+ac+"'");
        String id = rs1.getString("id");
        rs = sql.query("select * from teacher_test_tmp where Id = '"+id+"'");
      %>
      <div class="table-responsive">
        <table class="table table-hover table-light">
          <thead>
          <tr>
            <th>ID</th>
            <th>姓名</th>
            <th>学院</th>
            <th>核酸检测结果</th>
            <th>是否在四川省内</th>
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
            <td><%=rs.getString("id")%></td>
            <td><%=rs.getString("Name")%></td>
            <td><%=rs.getString("Institute")%></td>
            <td><%=rs.getString("Test")%></td>
            <td><%=rs.getString("Location")%></td>
            <td><%=rs.getString("CheckDate")%></td>
            <td><%=rs.getString("CheckTime")%></td>
              <%}%>
            <td>
          </tbody>
        </table>
      </div>

    </div>
  </div>
</div>
</body>
</html>