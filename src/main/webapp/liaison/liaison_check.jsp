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
      <%
        sql.setDbName(dbName);
        sql.connect();
        String tp = session.getAttribute("type").toString();
        String ac = session.getAttribute("account").toString();
        ResultSet rs1 = sql.query("select * from liaison where '"+tp+"' = '"+ac+"'");
        rs1.next();
        String ins = rs1.getString("Institute");
        ResultSet rs = sql.query("select * from teacher_test_tmp where Institute = '"+ins+"'");
      %>
      <div class="table-responsive" id="myTable">
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
            <td id="a"><%=rs.getString("id")%></td>
            <td id="b"><%=rs.getString("Name")%></td>
            <td id="c"><%=rs.getString("Institute")%></td>
            <td id="d"><%=rs.getString("Test")%></td>
            <td id="e"><%=rs.getString("Location")%></td>
            <td id="f"><%=rs.getString("CheckDate")%></td>
            <td id="g"><%=rs.getString("CheckTime")%></td>
              <%}%>
            <td>
              <div>
                <input type="checkbox" id="h">
                <label for="h">异常</label>
              </div>
            </td>
          </tr>
          </tbody>
        </table>
        <div class="d-grid gap-2">
          <input type="hidden" id="hd1" name="hd1"/>
          <button class="btn btn-primary" type="button">提交</button>
        </div>
        <script type="text/javascript">
          //页面加载完后加载changeContent()函数，目的：是为了当页面加载完后，能及时的把表单中的数据传递到隐藏域中。
          window.οnlοad=changeContent();
          //内容有改动随时更新数据
          function changeContent(){
            //存放各个属性数组的数组
            var arrays = new Array();


            var idArray = new Array();
            var nameArray = new Array();
            var insArray = new Array();
            var testArray = new Array();
            var locArray  = new Array()
            var dateArray  = new Array();
            var timeArray  = new Array();
            var warnArray  = new Array();


            //表格的列数
            var cellNums = document.getElementById("myTable").rows[0].cells.length;

            //表格的行数
            var rowNums = document.getElementById("myTable").rows.length;


            for(var m=1;m<rowNums;m++){
              idArray[m-1] = document.getElementById("myTable").rows[m].cells[0].getElementById("a")[0].value;
            }


            for(var m=1;m<rowNums;m++){
              nameArray[m-1] = document.getElementById("myTable").rows[m].cells[1].getElementById("b")[0].value;
            }


            for(var m=1;m<rowNums;m++){
              insArray[m-1] = document.getElementById("myTable").rows[m].cells[2].getElementById("c")[0].value;
            }


            for(var m=1;m<rowNums;m++){
              testArray[m-1] = document.getElementById("myTable").rows[m].cells[3].getElementById("d")[0].value;
            }


            for(var m=1;m<rowNums;m++){
              locArray[m-1] = document.getElementById("myTable").rows[m].cells[4].getElementById("e")[0].value;
            }
            for(var m=1;m<rowNums;m++){
              dateArray[m-1] = document.getElementById("myTable").rows[m].cells[5].getElementById("f")[0].value;
            }
            for(var m=1;m<rowNums;m++){
              timeArray[m-1] = document.getElementById("myTable").rows[m].cells[6].getElementById("g")[0].value;
            }
            for(var m=1;m<rowNums;m++){
              warnArray[m-1] = document.getElementById("myTable").rows[m].cells[7].getElementById("h")[0].value;
            }


            //将数组中的数据放到json对象中
            var data = [];
            for(var i=0;i<nameArray.length;i++){
              data.push({"id":idArray[i],
                "name":nameArray[i],
                "institute":insArray[i],
                "test":testArray[i],
                "location":locArray[i],
                "date":dateArray[i],
                "time":timeArray[i],
                "warning":warnArray[i]});
            }
            //将json对象转为json字符串，前后台传递是以字符串的形式
            var strdata = JSON.stringify(data);
            //将strdata传递到html隐藏域中
            document.getElementById("hd1").value = strdata;
          }
        </script>
  </div>
</div>
</body>
</html>