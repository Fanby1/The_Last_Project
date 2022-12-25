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
<%
    sql.setDbName(dbName);
    sql.connect();
    String i = request.getParameter("id");
    String sql_del = "delete from teacher where ID ='"+i+"' ";
    int flag = sql.update(sql_del);
    if(flag > 0)
    {
        out.println("<script>alert('删除成功！');history.go(-1)</script>");
    }
    else
    {
        out.println("<script>alert('删除失败！');history.go(-1)</script>");
    }
%>
</body>
</html>