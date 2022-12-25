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

<div class="container">
    <div class="row">
        <div class="col-8 offset-2">
            <h2>核酸检测网站</h2>
            <ul class="nav nav-tabs" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" data-bs-toggle="tab" href="#loginPage">登录</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="tab" href="#registerPage">注册</a>
                </li>
            </ul>
            <div class="tab-content">
                <div id="loginPage" class="tab-pane fade active container show"><br>
                    <form action="login" id="1" method="post">
                        <div class="mb-3 mt-3">
                            <label for="account" class="form-label">账号:</label>
                            <input type="text" class="form-control" id="account"
                                   placeholder="手机/邮箱/ID:" name="account" onchange="checkAccount()">
                            <div class="card d-none" id="accountWarning">
                                <div class="card-body" id="accountWarningBody"></div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">密码:</label>
                            <input type="password" class="form-control" id="password"
                                   placeholder="密码:" name="password" oninput="checkPassword()">
                            <br>
                            <div class="card d-none" id="passwordWarning">
                                <div class="card-body" id="passwordWarningBody"></div>
                            </div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col-2 offset-10">
                                    <label class="form-check-label float-end" for="identity">请选择你的身份</label>
                                </div>
                            </div>
                            <div class="row" id="identity">
                                <div class="col-2 offset-6">
                                    <div class="form-check">
                                        <input type="radio" class="form-check-input" id="teacher" name="identity"
                                               value="teacher" checked>教师
                                        <label class="form-check-label" for="teacher"></label>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="form-check">
                                        <input type="radio" class="form-check-input" id="liaison" name="identity"
                                               value="liaison">联络员
                                        <label class="form-check-label" for="liaison"></label>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="form-check">
                                        <input type="radio" class="form-check-input" id="manager" name="identity"
                                               value="manager">管理员
                                        <label class="form-check-label" for="manager"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-check mb-4 offset-8">
                            <label class="form-check-label">
                                <input class="form-check-input" type="checkbox" name="remember"
                                       value="remember" id="remember">
                                是否在此设备上记住此账户
                            </label>
                        </div>
                        <div class="container d-none">
                            <div class="row" id="type">
                                <div class="col-3">
                                    <div class="form-check">
                                        <input type="radio" class="form-check-input" id="email" name="type"
                                               value="email">
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="form-check">
                                        <input type="radio" class="form-check-input" id="phone" name="type"
                                               value="phone">
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="form-check">
                                        <input type="radio" class="form-check-input" id="id" name="type"
                                               value="id">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary"
                                onclick="return check()">
                            Submit
                        </button>
                    </form>
                </div>
                <div id="registerPage" class="tab-pane fade container">
                    <form action="singIn" id="2" method="post">
                        <div class="mb-3 mt-3">
                            <label for="account" class="form-label">账号:</label>
                            <input type="text" class="form-control" id="accountRegister"
                                   placeholder="手机/邮箱/ID:" name="account" onchange="checkAccountRegister()">
                            <div class="card d-none" id="accountWarningRegister">
                                <div class="card-body" id="accountWarningRegisterBody"></div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">密码:</label>
                            <input type="password" class="form-control" id="passwordRegister"
                                   placeholder="密码:" name="password" oninput="checkPasswordRegister()">
                            <br>
                            <div class="card d-none" id="passwordWarningRegister">
                                <div class="card-body" id="passwordWarningRegisterBody"></div>
                            </div>
                        </div>
                        <div class="container">
                            <div class="row">
                                <div class="col-2 offset-10">
                                    <label class="form-check-label float-end" for="identity">请选择你的身份</label>
                                </div>
                            </div>
                            <div class="row" id="identityRegister">
                                <div class="col-2 offset-6">
                                    <div class="form-check">
                                        <input type="radio" class="form-check-input" id="teacherRegister"
                                               name="identityRegister"
                                               value="teacher" checked>教师
                                        <label class="form-check-label" for="teacher"></label>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="form-check">
                                        <input type="radio" class="form-check-input" id="liaisonRegister"
                                               name="identityRegister"
                                               value="liaison">联络员
                                        <label class="form-check-label" for="liaison"></label>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="form-check">
                                        <input type="radio" class="form-check-input" id="managerRegister"
                                               name="identityRegister"
                                               value="manager">管理员
                                        <label class="form-check-label" for="manager"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-check mb-4 offset-8">
                            <label class="form-check-label">
                                <input class="form-check-input" type="checkbox" name="remember"
                                       value="remember" id="rememberRegister">
                                是否在此设备上记住此账户
                            </label>
                        </div>
                        <div class="container d-none">
                            <div class="row" id="typeRegister">
                                <div class="col-3">
                                    <div class="form-check">
                                        <input type="radio" class="form-check-input" id="emailRegister"
                                               name="typeRegister"
                                               value="email">
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="form-check">
                                        <input type="radio" class="form-check-input" id="phoneRegister"
                                               name="typeRegister"
                                               value="phone">
                                    </div>
                                </div>
                                <div class="col-3">
                                    <div class="form-check">
                                        <input type="radio" class="form-check-input" id="idRegister" name="typeRegister"
                                               value="id">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary"
                                onclick="return checkRegister()">
                            Submit
                        </button>
                    </form>
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
    function login() {
        var accountType = localStorage.getItem("accountType") == null ? "" : localStorage.getItem("accountType");
        var type = localStorage.getItem("type") == null ? "" : localStorage.getItem("type");

        if (type != "" && accountType != "") {
            var account = document.getElementById("account");
            account.value = localStorage.getItem("account");
            var pwd = document.getElementById("password");
            pwd.value = localStorage.getItem("password");
            var checkbox = document.getElementById("remember");
            checkbox.checked = true;
            var identify = document.getElementsByName("identity");
            for (var i = 0; i < identify.length; i++) {
                if (identify[i].value == accountType) {
                    identify[i].checked = true;
                }
            }
            var enterType = document.getElementsByName("type");
            for (var i = 0; i < identify.length; i++) {
                if (enterType[i].value == type) {
                    enterType[i].checked = true;
                }
            }
        }
    }

    var email = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
    var phone = /^[1][3,4,5,7,8][0-9]{9}$/;
    var id = /^[0-9]{8}$/;
    var errorEmail1 = /[0-9a-zA-Z]*@[0-9a-zA-Z]*/
    var errorEmail2 = /[a-zA-Z_-]+/
    var erroPhone = /^[0-9]{11}$/;

    function checkAccount() {
        var account = document.getElementById("account");
        var accountWarning = document.getElementById("accountWarning");
        var accountWarningBody = document.getElementById("accountWarningBody");
        if (email.test(account.value.trim())) {
            accountWarning.className = "card bg-success text-wight rounded";
            accountWarningBody.innerHTML = "    您输入了正确的邮箱";
            return 1;
        } else if (phone.test(account.value.trim())) {
            accountWarning.className = "bg-success text-wight rounded";
            accountWarningBody.innerHTML = "    您输入了正确的手机";
            return 2;
        } else if (id.test(account.value.trim())) {
            accountWarning.className = "bg-success text-wight rounded";
            accountWarningBody.innerHTML = "    您输入了正确的id";
            return 3;
        } else if (errorEmail1.test(account.value.trim()) || errorEmail2.test(account.value.trim())) {
            accountWarning.className = "bg-warning text-white rounded";
            accountWarningBody.innerHTML = "    您输入了错误的账号格式，您可能想输入邮箱";
            return -1;
        } else if (erroPhone.test(account.value.trim())) {
            accountWarning.className = "bg-warning text-white rounded";
            accountWarningBody.innerHTML = "    您输入了错误的账号格式，您可能想输入手机";
            return -1;
        } else {
            accountWarning.className = "bg-warning text-white rounded";
            accountWarningBody.innerHTML = "    您输入了错误的账号格式";
            return -1;
        }
    }

    function checkAccountRegister() {
        var account = document.getElementById("accountRegister");
        var accountWarning = document.getElementById("accountWarningRegister");
        var accountWarningBody = document.getElementById("accountWarningRegisterBody");
        if (email.test(account.value.trim())) {
            accountWarning.className = "bg-success text-wight rounded";
            accountWarningBody.innerHTML = "    您输入了正确的邮箱";
            return 1;
        } else if (phone.test(account.value.trim())) {
            accountWarning.className = "bg-success text-wight rounded";
            accountWarningBody.innerHTML = "    您输入了正确的手机";
            return 2;
        } else if (id.test(account.value.trim())) {
            accountWarning.className = "bg-success text-wight rounded";
            accountWarningBody.innerHTML = "    您输入了正确的id";
            return 3;
        } else if (errorEmail1.test(account.value.trim()) || errorEmail2.test(account.value.trim())) {
            accountWarning.className = "bg-warning text-white rounded";
            accountWarningBody.innerHTML = "    您输入了错误的账号格式，您可能想输入邮箱";
            return -1;
        } else if (erroPhone.test(account.value.trim())) {
            accountWarning.className = "bg-warning text-white rounded";
            accountWarningBody.innerHTML = "    您输入了错误的账号格式，您可能想输入手机";
            return -1;
        } else {
            accountWarning.className = "bg-warning text-white rounded";
            accountWarningBody.innerHTML = "    您输入了错误的账号格式";
            return -1;
        }
    }

    function checkPassword() {
        var password = document.getElementById("password").value.trim();
        var passwordWarning = document.getElementById("passwordWarning");
        var passwordWarningBody = document.getElementById("passwordWarningBody");
        if (password.match(/[^a-zA-Z0-9]/g)) {
            passwordWarning.className = "bg-danger text-white rounded";
            passwordWarningBody.innerHTML = "    您的密码包含非法字符，密码只能由数字与大小写字母组成";
            return false;
        }else{
            passwordWarning.className = "bg-danger text-white rounded d-none";
            return true;
        }
    }

    function checkPasswordRegister() {
        var password = document.getElementById("passwordRegister").value.trim();
        var username = document.getElementById("accountRegister").value.trim();
        let iRank = 0;
        var passwordWarning = document.getElementById("passwordWarningRegister");
        var passwordWarningBody = document.getElementById("passwordWarningRegisterBody");
        password.match(/[a-z]/g) && iRank++;
        password.match(/[A-Z]/g) && iRank++;
        password.match(/[0-9]/g) && iRank++;
        password.match(/[a-zA-Z0-9]/g) && iRank++;
        iRank = iRank > 3 ? 3 : iRank;
        if (
            password.length < 8 ||
            iRank === 1 ||
            (username != "" && (
                password.includes(username) ||
                password.includes(username.split('').reverse().join(''))))
        ) {
            iRank = 0;
        }
        if (iRank === 2) {
            if (
                (password.match(/[0-9]/g) && password.match(/[a-z]/g)) ||
                (password.match(/[0-9]/g) && password.match(/[A-Z]/g))
            ) {
                iRank = 1;
            }
        }
        if (password.match(/[^0-9a-zA-Z]/)) {
            iRank = -1;
        }
        switch (iRank) {
            case 0:
                passwordWarning.className = "bg-danger text-white rounded";
                passwordWarningBody.innerHTML = "    您的密码太弱";
                return false;
            case 1:
                passwordWarning.className = "bg-warning text-white rounded";
                passwordWarningBody.innerHTML = "    您的密码较弱";
                return true;
            case 2:
                passwordWarning.className = "bg-info text-white rounded";
                passwordWarningBody.innerHTML = "    您的密码较强";
                return true;
            case 3:
                passwordWarning.className = "bg-success text-white rounded";
                passwordWarningBody.innerHTML = "    您的密码很强";
                return true;
            default:
                passwordWarning.className = "bg-danger text-white rounded";
                passwordWarningBody.innerHTML = "    密码不能含有特殊字符";
                return false;
        }
    }

    function checkRegister() {
        var account = document.getElementById("accountRegister");
        var psw = document.getElementById("passwordRegister");
        var checkbox = document.getElementById("rememberRegister");
        var accountType = document.getElementsByName("identityRegister");
        var type = document.getElementsByName("typeRegister");

        if (account.value.trim() == '' || psw.value.trim() == '') {
            alert("账户或密码不能为空");
            return false;
        }
        var typeVal = "";
        var accountTypeVal = ""
        for (var i = 0; i < 3; i++) {
            if (accountType[i].checked) {
                accountTypeVal = accountType[i].value;
            }
        }

        if (checkAccountRegister() < 0 || checkPasswordRegister() !== true) {
            return false;
        }

        var typelist = ["email", "phone", "id"];
        typeVal = typelist[checkAccountRegister() - 1];

        for (let i = 0; i < type.length; i++) {
            if (type[i].value == typeVal) {
                alert(i);
                type[i].checked = true;
            }
        }

        alert(typeVal);


        if (checkbox.checked) {
            saveStorage(account.value.trim(), typeVal, psw.value.trim(), accountTypeVal);
        } else {
            clear();
        }

        saveSession(accountTypeVal);
    }


    function check() {
        var account = document.getElementById("account");
        var psw = document.getElementById("password");
        var checkbox = document.getElementById("remember");
        var accountType = document.getElementsByName("identity");
        var type = document.getElementsByName("type");

        if (account.value.trim() == '' || psw.value.trim() == '') {
            alert("账户或密码不能为空");
            return false;
        }
        var typeVal = "";
        var accountTypeVal = ""
        for (var i = 0; i < 3; i++) {
            if (accountType[i].checked) {
                accountTypeVal = accountType[i].value;
            }
        }

        if (checkAccount() < 0 || checkPassword() !== true) {
            return false;
        }

        var typelist = ["email", "phone", "id"];
        typeVal = typelist[checkAccount() - 1];

        for (let i = 0; i < type.length; i++) {
            if (type[i].value == typeVal) {
                type[i].checked = true;
            }
        }


        if (checkbox.checked) {
            saveStorage(account.value.trim(), typeVal, psw.value.trim(), accountTypeVal);
        } else {
            clear();
        }
        saveSession(accountTypeVal);
    }

    function saveStorage(account, type, password, accountType) {
        if (typeof (Storage) !== "undefined") {
            update("account", account);
            update("type", type);
            update("password", password);
            update("accountType", accountType);
        } else {
            alert("    您的浏览器不支持存储账户与密码，请放弃勾选‘记住我’选项再次登录");
        }
    }

    function saveSession(identity) {
        if (sessionStorage.getItem("identity")) {
            sessionStorage.removeItem("identity")
        }
        sessionStorage.setItem("identity", identity);
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

</script>
</body>
</html>
