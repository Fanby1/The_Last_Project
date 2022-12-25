<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.tool.Constant" %>
<%@ page import="java.sql.*" %>
<%@ page import="static com.tool.Constant.sql" %>
<%@ page import="static com.tool.Constant.dbName" %>
<!DOCTYPE html>
<html>
<head>
  <title>manager_TeacherAccount</title>
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
                <a href="instituteAccount.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">学院账号</span></a>
              </li>
              <li>
                <a href="teacherAccount.jsp" class="nav-link px-0"> <span class="d-none d-sm-inline">教师账号</span></a>
              </li>
            </ul>
          </li>
          <li class="nav-item">
            <a href="check.jsp" class="nav-link align-middle px-0">
              <i class="fs-4 bi-house"></i> <span class="ms-1 d-none d-sm-inline">全校打卡情况</span>
            </a>
          </li>
          <li class="nav-item">
            <a href="history.jsp" class="nav-link align-middle px-0">
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
            <li><a class="dropdown-item" href="../index.jsp">登出</a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="col py-3">
      <h3 class="text-left"><mark>修改学院联络员账号</mark></h3>
      <%
        String s1 = request.getParameter("id");
        String s2 = request.getParameter("ins");
        String s3 = request.getParameter("pn");
        String s4 = request.getParameter("em");
        String s5 = request.getParameter("pw");
      %>
      <div class="row g-2">
        <div class="col-12">
          <div class="input-group">
                        <span class="input-group-text">
                            ID
                        </span>
            <input id="a1" type="text" class="form-control" value="<%=s1%>" readonly="readonly">
          </div>
        </div>
        <div class="col-12">
          <div class="input-group">
                        <span class="input-group-text">
                            电话
                        </span>
            <input id="a2" type="text" class="form-control" value="<%=s3%>">
          </div>
        </div>
        <div class="col-12">
          <div class="input-group">
                        <span class="input-group-text">
                            邮箱
                        </span>
            <input id="a3" type="text" class="form-control" value="<%=s4%>">
          </div>
        </div>
        <div class="col-12">
          <div class="input-group">
                        <span class="input-group-text">
                            密码
                        </span>
            <input id="a4" type="text" class="form-control" value="<%=s5%>">
          </div>
        </div>
        <div class="col-12">
          <div class="input-group">
                        <span class="input-group-text">
                            学院
                        </span>
            <input id="a5" type="text" class="form-control" list="typelist" placeholder="请选择所属学院">
            <datalist id="typelist" >
              　　<option>计算机与人工智能</option>
              　　<option>金融</option>
              　　<option>数学</option>
              　　<option>工商管理</option>
              　　<option>统计</option>
            </datalist>
          </div>
        </div>
        <%--隐式表单储存数据上传--%>
        <form name = "frmApp" action = "editBackLiaison.jsp" id= "frmAppId" mothed= "post" />
        <input id= "a" type= "hidden" name = "id" >
        <input id= "b" type= "hidden" name = "pn" >
        <input id= "c" type= "hidden" name = "em" >
        <input id= "d" type= "hidden" name = "pw" >
        <input id= "e" type= "hidden" name = "ins" >
        </form>
        <script>
          function setItemValue(){
            let id = document.getElementById("a1").value;
            let pn = document.getElementById("a2").value;
            let em = document.getElementById("a3").value;
            let pw = document.getElementById("a4").value;
            let ins = document.getElementById("a5").value;
            document.getElementById( "a" ).value = id;  // 将JS变量值存储到隐藏控件中
            document.getElementById( "b" ).value = pn;  // 将JS变量值存储到隐藏控件中
            document.getElementById( "c" ).value = em;  // 将JS变量值存储到隐藏控件中
            document.getElementById( "d" ).value = pw;  // 将JS变量值存储到隐藏控件中
            document.getElementById( "e" ).value = ins;  // 将JS变量值存储到隐藏控件中
          }
          function submit(){
            let frm = document.getElementById( "frmAppId" ); // 获取表单
            frm.submit(); // 对表单进行提交
          }
        </script>
        <div class="col-12">
          <div class="d-grid">
            <button type="button" class="btn btn-primary btn-block" onclick="setItemValue();submit()">提交</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>