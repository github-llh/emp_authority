<%--
  Created by IntelliJ IDEA.
  User: lilinhan
  Date: 2023/5/6
  Time: 8:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<html>
<head>
      <title>$Title$</title>
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <link href="css/sign-in.css" rel="stylesheet">
      <script type="text/javascript" src="js/jquery-3.5.1.js"></script>
      <%--echart线图、柱状图、饼图等各种图型库 cdn--%>
      <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
      <%--jquery cdn--%>
      <script type="text/javascript" src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.1/jquery.js"></script>
      <style type="text/css">
            span{
                font-size: 12px;
                color: red;
            }
      </style>
</head>
<body class="text-center">
<main class="w-50 m-auto">
      <div class="w-75 mb-3">
            <h1 class="h3 fw-normal m-auto">登录页面</h1>
      </div>
      <form class="row g-3">
            <%--文本框 一行一框加验证--%>
            <div class="col-md-9 form-floating">
                  <input type="text" name="uname" class="form-control" id="uname" placeholder="请输入用户名/手机号" onblur="checkName()">
                  <label for="uname">请输入用户名/手机号</label>
            </div>
            <div class="col-md-3 text-lg-start">
                  <div class="badge text-wrap">
                        <span id="sp1"></span>
                  </div>
            </div>

            <%--文本框 一行一框加验证--%>
            <div class="col-md-9 form-floating">
                  <input type="text" name="upwd" class="form-control" id="upwd" placeholder="请输入密码" onblur="checkPwd()">
                  <label for="upwd">请输入密码</label>
            </div>
            <div class="col-md-3 text-lg-start">
                  <div class="badge text-wrap">
                        <span id="sp2"></span>
                  </div>
            </div>

            <%--文本框 一行二框加验证--%>
            <div class="col-md-4 form-floating">
                  <input type="text" name="yzm" class="form-control" id="yzm" placeholder="请输入验证码" onblur="checkYzm()">
                  <label for="yzm">请输入验证码</label>
            </div>
            <div class="col-md-3 text-center">
                  <img id="code" src="yzm.jsp" onclick="reload()">
            </div>
            <div class="col-md-5 text-lg-start">
                  <div class="badge text-wrap">
                        <span id="sp3"></span>
                  </div>
            </div>

            <button class="w-75 btn btn-lg btn-primary" type="button" onclick="login()">登录</button>
      </form>
</main>

<script type="text/javascript">
    // 点击刷新验证码
    function reload() {
        $("#code").prop("src", "yzm.jsp");
        $("[name=yzm]").val("");
    }

    function login() {
        let uname = $("[name=uname]").val();
        let upwd = $("[name=upwd]").val();
        checkYzm();
        checkName();
        checkPwd();
        let text = $("span").text();
        if (text == "") {
            $.post(
                "user?m=login",
                {uname: uname,upwd:upwd},
                function (data) {
                    if (upwd != "") {
                        if (upwd != data.upwd) {
                            $("#sp2").html("密码错误");
                            alert("密码错误！")
                        } else {
                            $("#sp2").html("");
                            alert("登录成功！");
                            location.href="emp?m=getEmp";
                        }
                    } else {
                        $("#sp2").html("密码不能为空");
                    }
                },
                "json"
            )
        } else {
            alert("好好检查一下！");
        }
    }

    function checkYzm() {
        let yzm = $("[name=yzm]").val();
        if (yzm != "") {
            $.post(
                "user?m=checkYzm",// 获取后台存在session中的验证码
                function (data) {
                    console.log(data)
                    if (yzm != $.trim(data)) {
                        $("#sp3").html("验证码错误");
                    } else {
                        $("#sp3").html("");
                    }
                }
            )
        } else {
            $("#sp3").html("验证码不能为空");
        }
    }

    function checkName() {
        let uname = $("[name=uname]").val();
        if (uname != "") {
            $.post(
                "user?m=findByName",
                {uname: uname},
                function (data) {
                    if (data != null) {
                        $("#sp1").html("");
                    } else {
                        $("#sp1").html("用户名或手机号不存在");
                    }
                },
                "json"
            )
        } else {
            $("#sp1").html("用户名不能为空");
        }
    }

    function checkPwd() {
        let upwd = $("[name=upwd]").val();
        if (upwd != "") {
            $("#sp2").html("");
        } else {
            $("#sp2").html("密码不能为空");
        }
    }
</script>
</body>
</html>
