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
  <link href="dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="dist/js/bootstrap.bundle.min.js"></script>
  <script src="js/userCheck.js"></script>
</head>
<body>
<%
  sql.setDbName(dbName);
  sql.connect();
  String tid = request.getParameter("id");
  String email = request.getParameter("em");
  String pn = request.getParameter("pn");
  String pw = request.getParameter("pw");
  String ins = request.getParameter("ins");
  out.print(tid);
  String sql_del = "update liaison set Email ='"+email+"',PhoneNumber ='"+pn+"',Password ='"+pw+"',Institute ='"+ins+"'where ID = '"+tid+"'";
  int flag = sql.update(sql_del);
  if(flag > 0)
  {
    out.println("<script>alert('编辑成功！');history.go(-2)</script>");
  }
  else
  {
    out.println("<script>alert('编辑失败！');history.go(-1)</script>");
  }

%>
</body>
</html>