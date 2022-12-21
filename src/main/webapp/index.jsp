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
<body onload="login()">
<div class="container mt-3">
    <div class="row">
        <div class="col-3">
            <h2>选项卡切换</h2>
            <br>
            <!-- Nav tabs -->
            <ul class="nav nav-pills" role="tablist" id="accountTypeNav">
                <div class="container">
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="pill" href="#homePage" id="homeTab">Home</a>
                    </li>
                </div>
                <div class="container">
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="pill" href="#teacherPage" id="teacherTab">教师登录界面</a>
                    </li>
                </div>
                <div class="container">
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="pill" href="#managerPage" id="managerTab">管理员登录界面</a>
                    </li>
                </div>
                <div class="container">
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="pill" href="#liaisonPage"
                           id="liaisonTab">学院联络员登录界面</a>
                    </li>
                </div>

            </ul>
        </div>

        <!-- Tab panes -->
        <div class="col-9">
            <div class="tab-content">
                <div id="homePage" class="container tab-pane fade"><br>
                    <h3>欢迎来到核算填报网站</h3>
                    <p>请根据您的身份选择登录界面</p>
                </div>
                <div id="teacherPage" class="container tab-pane fade"><br>
                    <h3>教师</h3>
                    <div class="container">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#teacherIdPage" id="teacherIdTab">
                                    使用ID登录
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#teacherEmailPage" id="teacherEmailTab">
                                    使用Email登录
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#teacherPhonePage" id="teacherPhoneTab">
                                    使用电话登录
                                </a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div id="teacherIdPage" class="container tab-pane fade"><br>
                                <div class="container mt-3">
                                    <h2>使用ID登录</h2>
                                    <form action="" id="teacherIdSubmit">
                                        <div class="mb-3 mt-3">
                                            <label for="teacherIdVal" class="form-label">学号:</label>
                                            <input type="text" class="form-control" id="teacherIdVal"
                                                   placeholder="Enter Id" name="Id">
                                        </div>
                                        <div class="mb-3">
                                            <label for="teacherPwdWithId" class="form-label">密码:</label>
                                            <input type="password" class="form-control" id="teacherPwdWithId"
                                                   placeholder="Enter password" name="pswd">
                                        </div>
                                        <div class="form-check mb-3">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" name="remember"
                                                       value="remember" id="teacherIdCheckbox">
                                                是否在此设备上记住此账户
                                            </label>
                                        </div>
                                        <button type="submit" class="btn btn-primary"
                                                onclick="check('teacher','id')">
                                            Submit
                                        </button>
                                    </form>
                                </div>
                            </div>
                            <div id="teacherEmailPage" class="container tab-pane fade"><br>
                                <div class="container mt-3">
                                    <h2>使用邮箱登录</h2>
                                    <form action="" id="teacherEmailSubmit">
                                        <div class="mb-3 mt-3">
                                            <label for="teacherEmailVal" class="form-label">Email:</label>
                                            <input type="email" class="form-control" id="teacherEmailVal"
                                                   placeholder="Enter email" name="email">
                                        </div>
                                        <div class="mb-3">
                                            <label for="teacherPwdWithEmail" class="form-label">Password:</label>
                                            <input type="password" class="form-control" id="teacherPwdWithEmail"
                                                   placeholder="Enter password" name="pswd">
                                        </div>
                                        <div class="form-check mb-3">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" name="remember"
                                                       value="remember" id="teacherEmailCheckbox">
                                                Remember me
                                            </label>
                                        </div>
                                        <button type="submit" class="btn btn-primary"
                                                onclick="check('teacher','email')">
                                            Submit
                                        </button>
                                    </form>
                                </div>
                            </div>
                            <div id="teacherPhonePage" class="container tab-pane fade"><br>
                                <div class="container mt-3">
                                    <h2>使用手机登录</h2>
                                    <form action="">
                                        <div class="mb-3 mt-3">
                                            <label for="teacherPhoneVal" class="form-label">电话:</label>
                                            <input type="text" class="form-control" id="teacherPhoneVal"
                                                   placeholder="Enter phone"
                                                   name="phone">
                                        </div>
                                        <div class="mb-3">
                                            <label for="teacherPwdWithPhone" class="form-label">Password:</label>
                                            <input type="password" class="form-control" id="teacherPwdWithPhone"
                                                   placeholder="Enter password" name="pswd">
                                        </div>
                                        <div class="form-check mb-3">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" name="remember" id="teacherPhoneCheckbox">
                                                Remember me
                                            </label>
                                        </div>
                                        <button type="submit" class="btn btn-primary"
                                                onclick="check('teacher','phone')">
                                            Submit
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="managerPage" class="container tab-pane fade"><br>
                    <h3>管理员</h3>
                    <div class="container">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#managerIdPage">
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
                            <div id="managerIdPage" class="container tab-pane fade"><br>
                                <div class="container mt-3">
                                    <h2>使用ID登录</h2>
                                    <form action="">
                                        <div class="mb-3 mt-3">
                                            <label for="managerIdVal" class="form-label">学号:</label>
                                            <input type="text" class="form-control" id="managerIdVal"
                                                   placeholder="Enter Id" name="Id">
                                        </div>
                                        <div class="mb-3">
                                            <label for="managerPwdWithId" class="form-label">密码:</label>
                                            <input type="password" class="form-control" id="managerPwdWithId"
                                                   placeholder="Enter password" name="pswd">
                                        </div>
                                        <div class="form-check mb-3">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" name="remember" id="managerIdCheckbox">
                                                Remember me
                                            </label>
                                        </div>
                                        <button type="submit" class="btn btn-primary" onclick="check('manager', 'id')">Submit</button>
                                    </form>
                                </div>
                            </div>
                            <div id="managerEmailPage" class="container tab-pane fade"><br>
                                <div class="container mt-3">
                                    <h2>使用邮箱登录</h2>
                                    <form action="">
                                        <div class="mb-3 mt-3">
                                            <label for="managerEmailVal" class="form-label">Email:</label>
                                            <input type="email" class="form-control" id="managerEmailVal"
                                                   placeholder="Enter email" name="email">
                                        </div>
                                        <div class="mb-3">
                                            <label for="managerPwdWithEmail" class="form-label">Password:</label>
                                            <input type="password" class="form-control" id="managerPwdWithEmail"
                                                   placeholder="Enter password" name="pswd">
                                        </div>
                                        <div class="form-check mb-3">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" name="remember" id="managerEmailCheckbox">
                                                Remember me
                                            </label>
                                        </div>
                                        <button type="submit" class="btn btn-primary" onclick="check('manager','email')">Submit</button>
                                    </form>
                                </div>
                            </div>
                            <div id="managerPhonePage" class="container tab-pane fade"><br>
                                <div class="container mt-3">
                                    <h2>使用手机登录</h2>
                                    <form action="">
                                        <div class="mb-3 mt-3">
                                            <label for="managerPhoneVal" class="form-label">电话:</label>
                                            <input type="text" class="form-control" id="managerPhoneVal"
                                                   placeholder="Enter phone"
                                                   name="phone">
                                        </div>
                                        <div class="mb-3">
                                            <label for="managerPwdWithPhone" class="form-label">Password:</label>
                                            <input type="password" class="form-control" id="managerPwdWithPhone"
                                                   placeholder="Enter password" name="pswd">
                                        </div>
                                        <div class="form-check mb-3">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" name="remember" id="managerPhoneCheckbox">
                                                Remember me
                                            </label>
                                        </div>
                                        <button type="submit" class="btn btn-primary" onclick="check('manager', 'phone')">Submit</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="liaisonPage" class="container tab-pane fade"><br>
                    <h3>联络员</h3>
                    <div class="container">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="tab" href="#LiaisonIdPage">
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
                            <div id="LiaisonIdPage" class="container tab-pane fade"><br>
                                <div class="container mt-3">
                                    <h2>使用ID登录</h2>
                                    <form action="">
                                        <div class="mb-3 mt-3">
                                            <label for="liaisonIdVal" class="form-label">学号:</label>
                                            <input type="text" class="form-control" id="liaisonIdVal"
                                                   placeholder="Enter Id" name="Id">
                                        </div>
                                        <div class="mb-3">
                                            <label for="liaisonPwdWithId" class="form-label">密码:</label>
                                            <input type="password" class="form-control" id="liaisonPwdWithId"
                                                   placeholder="Enter password" name="pswd">
                                        </div>
                                        <div class="form-check mb-3">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" name="remember" id="liaisonIdCheckbox">
                                                Remember me
                                            </label>
                                        </div>
                                        <button type="submit" class="btn btn-primary" onclick="check('liaison','id')">Submit</button>
                                    </form>
                                </div>
                            </div>
                            <div id="liaisonEmailPage" class="container tab-pane fade"><br>
                                <div class="container mt-3">
                                    <h2>使用邮箱登录</h2>
                                    <form action="">
                                        <div class="mb-3 mt-3">
                                            <label for="liaisonEmailVal" class="form-label">Email:</label>
                                            <input type="email" class="form-control" id="liaisonEmailVal"
                                                   placeholder="Enter email" name="email">
                                        </div>
                                        <div class="mb-3">
                                            <label for="liaisonPwdWithEmail" class="form-label">Password:</label>
                                            <input type="password" class="form-control" id="liaisonPwdWithEmail"
                                                   placeholder="Enter password" name="pswd">
                                        </div>
                                        <div class="form-check mb-3">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" name="remember" id="liaisonEmailCheckbox">
                                                Remember me
                                            </label>
                                        </div>
                                        <button type="submit" class="btn btn-primary" onclick="check('liaison','email')">Submit</button>
                                    </form>
                                </div>
                            </div>
                            <div id="liaisonPhonePage" class="container tab-pane fade"><br>
                                <div class="container mt-3">
                                    <h2>使用手机登录</h2>
                                    <form action="">
                                        <div class="mb-3 mt-3">
                                            <label for="liaisonPhoneVal" class="form-label">电话:</label>
                                            <input type="text" class="form-control" id="liaisonPhoneVal"
                                                   placeholder="Enter phone"
                                                   name="phone">
                                        </div>
                                        <div class="mb-3">
                                            <label for="liaisonPwdWithPhone" class="form-label">Password:</label>
                                            <input type="password" class="form-control" id="liaisonPwdWithPhone"
                                                   placeholder="Enter password" name="pswd">
                                        </div>
                                        <div class="form-check mb-3">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="checkbox" name="remember" id="liaisonPhoneCheckbox">
                                                Remember me
                                            </label>
                                        </div>
                                        <button type="submit" class="btn btn-primary" onclick="check('liaison','phone')">Submit</button>
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
    function clear() {
        localStorage.removeItem("account");
        localStorage.removeItem("type");
        localStorage.removeItem("password");
        localStorage.removeItem("accountType");
    }

    //此函数在查找到历史账户后自动切换到目标页面 type 是key d 是默认活动页面
    function login(){
        var accountType = localStorage.getItem("accountType") == null ? "home" : localStorage.getItem("accountType");
        var type = localStorage.getItem("type") == null ? "" : localStorage.getItem("accountType");
        var tab = getTab(accountType, "");
        var page = getPage(accountType, "");
        var element = document.getElementById(tab);
        element.className += ' active';
        element = document.getElementById(page);
        element.className += " show active";

        if(type != "") {
            tab = getTab(localStorage.getItem("type"),accountType);
            page = getPage(localStorage.getItem("type"),accountType);
            element = document.getElementById(tab);
            element.className += " active";
            element = document.getElementById(page);
            element.className += " show active";
            var account = document.getElementById(getAccountId(accountType, type));
            account.value = localStorage.getItem("account");
            var pwd = document.getElementById(getPasswordId(accountType, type));
            pwd.value = localStorage.getItem("password");
            var checkbox = document.getElementById(getCheckboxId(accountType,type));
            checkbox.checked = true;
        }
    }

    function check(accountType,type){
        var account = document.getElementById(getAccountId(accountType,type));
        var psw = document.getElementById(getPasswordId(accountType,type));
        var checkbox = document.getElementById(getCheckboxId(accountType,type));
        if(account.value.trim() == '' || psw.value.trim() == ''){
            alert("账户或密码不能为空");
            return;
        }
        if (checkbox.checked){
            saveForever(account.value.trim(),type,psw.value.trim(), accountType);
        }else{
            clear();
        }
    }

    function upFirstChar(word) {
        return word.charAt(0).toUpperCase()
            + word.slice(1);
    }

    function getPage(value, path) {
        //alert((path ? path + upFirstChar(value) : value) + 'Page');
        return (path ? path + upFirstChar(value) : value) + 'Page';
    }

    function getTab(value, path) {
        return (path ? path + upFirstChar(value) : value) + 'Tab';
    }

    function getSubmit(value, path) {
        return (path ? path + upFirstChar(value) : value) + 'Submit';
    }
    function saveForever(account, type, password, accountType) {
        if (typeof (Storage) !== "undefined") {
            update("account", account);
            update("type", type);
            update("password", password);
            update("accountType", accountType);
        } else {
            alert("您的浏览器不支持存储账户与密码，请放弃勾选‘记住我’选项再次登录");
        }
    }

    function update(key, val) {
        if (typeof (Storage) !== "undefined") {
            if (localStorage.getItem(key)) {
                localStorage.removeItem(key);
                localStorage.setItem(key, val);
            } else {
                localStorage.setItem(key, val);
            }
        }
    }

    function getValue(name) {
        var obj = document.getElementsByName(name);
        var s = '';
        for (var i = 0; i < obj.length; i++) {
            s += obj[i].value;
        }
        //alert(s);
        return s;
    }

    function getPasswordId(accountType,type){
        return accountType + "PwdWith" + upFirstChar(type);
    }

    function getAccountId(accountType,type){
        return accountType + upFirstChar(type) + "Val";
    }

    function getCheckboxId(accountType,type){
        return accountType + upFirstChar(type) + "Checkbox";
    }
</script>
</body>
</html>
