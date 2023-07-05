<%--
  Created by IntelliJ IDEA.
  User: lilinhan
  Date: 2023/5/11
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<html>
<head>
      <title>Title</title>
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <script type="text/javascript" src="js/jquery-3.5.1.js"></script>
      <%--echart线图、柱状图、饼图等各种图型库 cdn--%>
      <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
      <%--jquery cdn--%>
      <script type="text/javascript" src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.1/jquery.js"></script>
</head>
<body>
<center>
      <div style="width: 500px;height: 300px;text-align: left;border: 1px solid red">
            <form>
                  用户名：<input type="text" name="name" onblur="checkName()"><span id="sp1"></span><br>
                  密码：<input type="text" name="pwd" onblur="checkPwd()"><span id="sp2"></span><br>
                  单选：<input type="radio" name="dan" onchange="checkDan()" value="1">男
                  <input type="radio" name="dan" onchange="checkDan()" value="0">女
                  <span id="sp4"></span><br>
                  验证码：<input type="text" name="code" onblur="checkCode()"><img id="yzm" src="user?m=yzm" onclick="reload()"><span id="sp3"></span><br>
                  <input id="inp" type="button" value="登录" onclick="login()">
            </form>
      </div>
</center>

<script type="text/javascript">
    // 点击刷新yzm
    function reload(){
        $("#yzm").prop("src","user?m=yzm&time="+new Date());
        $("[name=code]").val("");
    }
    function login(){
        checkDan()
        checkName();
        checkPwd();
        checkCode()
        let text = $("span").text();
        let upwd = $("[name=pwd]").val();
        let uname = $("[name=name]").val();
        if (text == "") {
            $.post(
                "user?m=checkName",
                {name:uname},
                function (data){
                    if(upwd==data.upwd){
                        $.post(
                            "user?m=login2",
                            $("form").serialize(), 
                            function (msg){
                                if(msg!=""){
                                    alert(msg);
                                    reload();
                                }else{
                                    location.href="success.jsp";
                                }
                            }
                        )
                    }else{
                        alert("密码错误！")
                        reload();
                    }
                },
                'json'
            )
        } else {
            alert("好好检查一下");
        }
    }
    function checkDan(){
        let val = $("[name=dan]:checked").val();
        if (val != undefined) {
            $("#sp4").html("");
        } else {
            $("#sp4").html("<font style='color: red'>单选框不能为空</font>");
        }
    }

    function checkName() {
        let val = $("[name=name]").val();
        if (val != "") {
            $.post(
                "user?m=checkName",
                {name: val},
                function (data) {
                    if (data != null) {
                        $("#sp1").html("");
                    } else {
                        $("#sp1").html("<font style='color: red'>用户名不存在</font>");
                    }
                },
                "json"
            )
        } else {
            $("#sp1").html("<font style='color: red'>用户名不能为空</font>");
        }
    }

    function checkPwd() {
        let val = $("[name=pwd]").val();
        if (val != "") {
            $("#sp2").html("");
        } else {
            $("#sp2").html("<font style='color: red'>密码不能为空</font>");
        }
    }

    function checkCode() {
        let val = $("[name=code]").val();
        if (val != "") {
            $("#sp3").html("");
        } else {
            $("#sp3").html("<font style='color: red'>验证码不能为空</font>");
        }
    }
</script>
</body>
</html>
