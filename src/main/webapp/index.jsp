<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
</head>
<body>
<div class="container mt-3">
    <div class="row">
        <div class="col-3">
            <h2>选项卡切换</h2>
            <br>
            <!-- Nav tabs -->
            <ul class="nav nav-pills" role="tablist">
                <div class="container">
                    <li class="nav-item">
                        <a class="nav-link active" data-bs-toggle="pill" href="#home">Home</a>
                    </li>
                </div>
                <div class="container">
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="pill" href="#teacher">教师登录界面</a>
                    </li>
                </div>
                <div class="container">
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="pill" href="#manager">管理员登录界面</a>
                    </li>
                </div>
                <div class="container">
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="pill" href="#liaison">学院联络员登录界面</a>
                    </li>
                </div>

            </ul>
        </div>

        <!-- Tab panes -->
        <div class="col-9">
            <div class="tab-content">
                <div id="home" class="container tab-pane active"><br>
                    <h3>欢迎来到核算填报网站</h3>
                    <p>请根据您的身份选择登录界面</p>
                </div>
                <div id="teacher" class="container tab-pane fade"><br>
                    <h3>教师</h3>
                    <div class="container">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item active">
                                <a class="nav-link active" data-bs-toggle="tab" href="#teacherIDPage">
                                    使用ID登录
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#teacherEmailPage">
                                    使用Email登录
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#teacherPhonePage">
                                    使用电话登录
                                </a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div id="teacherIDPage" class="container tab-pane active"><br>
                                <div class="container mt-3">
                                    <h2>使用ID登录</h2>
                                    <form action="">
                                        <div class="mb-3 mt-3">
                                            <label for="teacherIDVal" class="form-label">学号:</label>
                                            <input type="text" class="form-control" id="teacherIDVal"
                                                   placeholder="Enter ID" name="ID">
                                        </div>
                                        <div class="mb-3">
                                            <label for="teacherPwdWithId" class="form-label">密码:</label>
                                            <input type="password" class="form-control" id="teacherPwdWithId"
                                                   placeholder="Enter password" name="pswd">
                                        </div>
                                        <div class="form-check mb-3">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" name="remember">
                                                是否在此设备上记住此账户
                                            </label>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </form>
                                </div>
                            </div>
                            <div id="teacherEmailPage" class="container tab-pane fade"><br>
                                <div class="container mt-3">
                                    <h2>使用邮箱登录</h2>
                                    <form action="">
                                        <div class="mb-3 mt-3">
                                            <label for="teacherEmail" class="form-label">Email:</label>
                                            <input type="email" class="form-control" id="teacherEmail"
                                                   placeholder="Enter email" name="email">
                                        </div>
                                        <div class="mb-3">
                                            <label for="teacherPwdWithEmail" class="form-label">Password:</label>
                                            <input type="password" class="form-control" id="teacherPwdWithEmail"
                                                   placeholder="Enter password" name="pswd">
                                        </div>
                                        <div class="form-check mb-3">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" name="remember">
                                                Remember me
                                            </label>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </form>
                                </div>
                            </div>
                            <div id="teacherPhonePage" class="container tab-pane fade"><br>
                                <div class="container mt-3">
                                    <h2>使用手机登录</h2>
                                    <form action="">
                                        <div class="mb-3 mt-3">
                                            <label for="teacherPhone" class="form-label">电话:</label>
                                            <input type="text" class="form-control" id="teacherPhone" placeholder="Enter phone"
                                                   name="phone">
                                        </div>
                                        <div class="mb-3">
                                            <label for="teacherPwdWithPhone" class="form-label">Password:</label>
                                            <input type="password" class="form-control" id="teacherPwdWithPhone"
                                                   placeholder="Enter password" name="pswd">
                                        </div>
                                        <div class="form-check mb-3">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" name="remember">
                                                Remember me
                                            </label>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="manager" class="container tab-pane fade"><br>
                    <h3>管理员</h3>
                    <div class="container" >
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item active">
                                <a class="nav-link active" data-bs-toggle="tab" href="#managerIDPage">
                                    使用ID登录
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#managerEmailPage">
                                    使用Email登录
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#managerPhonePage">
                                    使用电话登录
                                </a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div id="managerIDPage" class="container tab-pane active"><br>
                                <div class="container mt-3">
                                    <h2>使用ID登录</h2>
                                    <form action="">
                                        <div class="mb-3 mt-3">
                                            <label for="managerIDVal" class="form-label">学号:</label>
                                            <input type="text" class="form-control" id="managerIDVal"
                                                   placeholder="Enter ID" name="ID">
                                        </div>
                                        <div class="mb-3">
                                            <label for="managerPwdWithId" class="form-label">密码:</label>
                                            <input type="password" class="form-control" id="managerPwdWithId"
                                                   placeholder="Enter password" name="pswd">
                                        </div>
                                        <div class="form-check mb-3">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" name="remember">
                                                Remember me
                                            </label>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </form>
                                </div>
                            </div>
                            <div id="managerEmailPage" class="container tab-pane fade"><br>
                                <div class="container mt-3">
                                    <h2>使用邮箱登录</h2>
                                    <form action="">
                                        <div class="mb-3 mt-3">
                                            <label for="managerEmail" class="form-label">Email:</label>
                                            <input type="email" class="form-control" id="managerEmail"
                                                   placeholder="Enter email" name="email">
                                        </div>
                                        <div class="mb-3">
                                            <label for="managerPwdWithEmail" class="form-label">Password:</label>
                                            <input type="password" class="form-control" id="managerPwdWithEmail"
                                                   placeholder="Enter password" name="pswd">
                                        </div>
                                        <div class="form-check mb-3">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" name="remember">
                                                Remember me
                                            </label>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </form>
                                </div>
                            </div>
                            <div id="managerPhonePage" class="container tab-pane fade"><br>
                                <div class="container mt-3">
                                    <h2>使用手机登录</h2>
                                    <form action="">
                                        <div class="mb-3 mt-3">
                                            <label for="managerPhone" class="form-label">电话:</label>
                                            <input type="text" class="form-control" id="managerPhone" placeholder="Enter phone"
                                                   name="phone">
                                        </div>
                                        <div class="mb-3">
                                            <label for="managerPwdWithPhone" class="form-label">Password:</label>
                                            <input type="password" class="form-control" id="managerPwdWithPhone"
                                                   placeholder="Enter password" name="pswd">
                                        </div>
                                        <div class="form-check mb-3">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" name="remember">
                                                Remember me
                                            </label>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="liaison" class="container tab-pane fade"><br>
                    <h3>联络员</h3>
                    <div class="container">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item active">
                                <a class="nav-link active" data-bs-toggle="tab" href="#LiaisonIDPage">
                                    使用ID登录
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#liaisonEmailPage">
                                    使用Email登录
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#liaisonPhonePage">
                                    使用电话登录
                                </a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div id="LiaisonIDPage" class="container tab-pane active"><br>
                                <div class="container mt-3">
                                    <h2>使用ID登录</h2>
                                    <form action="">
                                        <div class="mb-3 mt-3">
                                            <label for="liaisonIDVal" class="form-label">学号:</label>
                                            <input type="text" class="form-control" id="liaisonIDVal"
                                                   placeholder="Enter ID" name="ID">
                                        </div>
                                        <div class="mb-3">
                                            <label for="liaisonPwdWithId" class="form-label">密码:</label>
                                            <input type="password" class="form-control" id="liaisonPwdWithId"
                                                   placeholder="Enter password" name="pswd">
                                        </div>
                                        <div class="form-check mb-3">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" name="remember">
                                                Remember me
                                            </label>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </form>
                                </div>
                            </div>
                            <div id="liaisonEmailPage" class="container tab-pane fade"><br>
                                <div class="container mt-3">
                                    <h2>使用邮箱登录</h2>
                                    <form action="">
                                        <div class="mb-3 mt-3">
                                            <label for="liaisonEmail" class="form-label">Email:</label>
                                            <input type="email" class="form-control" id="liaisonEmail"
                                                   placeholder="Enter email" name="email">
                                        </div>
                                        <div class="mb-3">
                                            <label for="liaisonPwdWithEmail" class="form-label">Password:</label>
                                            <input type="password" class="form-control" id="liaisonPwdWithEmail"
                                                   placeholder="Enter password" name="pswd">
                                        </div>
                                        <div class="form-check mb-3">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" name="remember">
                                                Remember me
                                            </label>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </form>
                                </div>
                            </div>
                            <div id="liaisonPhonePage" class="container tab-pane fade"><br>
                                <div class="container mt-3">
                                    <h2>使用手机登录</h2>
                                    <form action="">
                                        <div class="mb-3 mt-3">
                                            <label for="liaisonPhone" class="form-label">电话:</label>
                                            <input type="text" class="form-control" id="liaisonPhone" placeholder="Enter phone"
                                                   name="phone">
                                        </div>
                                        <div class="mb-3">
                                            <label for="liaisonPwdWithPhone" class="form-label">Password:</label>
                                            <input type="password" class="form-control" id="liaisonPwdWithPhone"
                                                   placeholder="Enter password" name="pswd">
                                        </div>
                                        <div class="form-check mb-3">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" name="remember">
                                                Remember me
                                            </label>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function save(account, type, password) {
        if(typeof(Storage) !== "undefined") {
            update("account",account);
            update("type", type);
            update("password", password);
        } else {
            alert("您的浏览器不支持存储账户与密码，请放弃勾选‘记住我’选项再次登录");
        }
    }

    function update(type, val){
        if(typeof(Storage) !== "undefined"){
            if(localStorage.getItem(type)){
                localStorage.removeItem(type);
                localStorage.setItem(type, val);
            }else{
                localStorage.setItem(type,val);
            }
        }
    }
</script>
</body>
</html>
