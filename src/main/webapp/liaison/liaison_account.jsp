<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.tool.Constant" %>
<%@ page import="java.sql.*" %>
<%@ page import="static com.tool.Constant.sql" %>
<%@ page import="static com.tool.Constant.dbName" %>
<!DOCTYPE html>
<html>
<head>
    <title>liaison_account</title>
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
                        <a href="#" class="nav-link align-middle px-0">
                            <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">教师账号管理</span>
                        </a>
                    </li>
                    <li>
                        <a href="liaison_account.jsp" data-bs-toggle="collapse" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-speedometer2"></i> <span class="ms-1 d-none d-sm-inline">打卡记录查询</span>
                        </a>
                        <ul class="collapse show nav flex-column ms-1" id="submenu1" data-bs-parent="#menu">
                            <li class="w-100">
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">按时间段</span></a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">按打卡次数</span></a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">按核酸检测次数</span></a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-0"> <span class="d-none d-sm-inline">组合查询</span></a>
                            </li>

                        </ul>
                    </li>
                    <li>
                        <a href="#" class="nav-link px-0 align-middle">
                            <i class="fs-4 bi-table"></i> <span class="ms-1 d-none d-sm-inline">打卡信息上报</span></a>
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
                        <li><a class="dropdown-item" href="#">个人信息</a></li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>
                        <li><a class="dropdown-item" href="../index.jsp">登出</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="col py-3">
            <div class="table-responsive">
                <table class="table table-hover table-light">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>年龄</th>
                        <th>学院</th>
                        <th>电话</th>
                        <th>邮箱</th>
                        <th>密码</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        sql.setDbName(dbName);
                        sql.connect();
                        ResultSet rs = null;
                        ResultSet rs1 = null;
                        String type = session.getAttribute("type").toString();
                        String account = session.getAttribute("account").toString();
                        rs1 = sql.query("select * from liaison where '"+type+"' = '"+account+"'");
                        String ins = "";
                        while (rs1.next()) {
                            ins = rs1.getString("Institute");
                        }
                        rs = sql.query("select * from teacher where Institute = '"+ins+"'");
                    %>
                    <%
                        //遍历结果集
                        while(rs.next()){
                            String ret = rs.getString("ID");
                            String ret1 = rs.getString("Name");
                            String ret2 = rs.getString("Gender");
                            String ret3 = rs.getString("Age");
                            String ret4 = rs.getString("Institute");
                            String ret5 = rs.getString("PhoneNumber");
                            String ret6 = rs.getString("Email");
                            String ret7 = rs.getString("Password");
                    %>
                    <tr>
                        <td><%=ret%></td>
                        <td><%=ret1%></td>
                        <td><%=ret2%></td>
                        <td><%=ret3%></td>
                        <td><%=ret4%></td>
                        <td><%=ret5%></td>
                        <td><%=ret6%></td>
                        <td><%=ret7%></td>
                        <td>
                            <div class="btn-group btn-group-sm">
                                <button type="button" class="btn btn-primary">
                                    <a href="manager_editT.jsp?id=<%=ret%>&name=<%=ret1%>&gender=<%=ret2%>&age=<%=ret3%>&institute=<%=ret4%>&pn=<%=ret5%>&email=<%=ret6%>&pw=<%=ret7%>" style="color:white;text-decoration: none " )>编辑</a>
                                </button>
                                <button type="button" class="btn btn-danger">
                                    <a href="manager_deleteT.jsp?id=<%=ret%>" style="color:white;text-decoration: none " onClick="return confirm('确认删除当前记录?')">删除</a>
                                </button>
                            </div>
                        </td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>