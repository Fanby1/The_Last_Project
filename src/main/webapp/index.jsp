<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.tool.Constant" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>bootstrap起步</title>
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="dist/js/bootstrap.bundle.min.js"></script>
    <%
        String state = "none";
        String temp = request.getParameter("state");
        if(temp != ""){
            state = temp;
        }
    %>
</head>
<body>
<div class="container">
    <h1>Hello, world!</h1>
    <div class="row">
        <div class="col-md-2">
            <nav class="navbar bg-light">
                <ul class="navbar-nav">
                    <li class="nav-item" >
                        <a class=<%out.print("teacher".equals(state) ? "\"nav-link bg-primary\"" : "\"nav-link\"");%> href=<%=Constant.warName%>/index.jsp?state=teacher>教师</a>
                    </li>
                    <li class="nav-item">
                        <a class=<%out.print("manager".equals(state) ? "\"nav-link bg-primary\"" : "\"nav-link\"");%> href=<%=Constant.warName%>/index.jsp?state=manager>管理员</a>
                    </li>
                    <li class="nav-item">
                        <a class=<%out.print("liaison".equals(state) ? "\"nav-link bg-primary\"" : "\"nav-link\"");%> href=<%=Constant.warName%>/index.jsp?state=liaison>联络员</a>
                    </li>
                </ul>
            </nav>
        </div>
        <div class="col-md-8">
            <p>hello world</p>
        </div>
    </div>

</div>

</body>
</html>
