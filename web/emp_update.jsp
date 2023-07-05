<%--
  Created by IntelliJ IDEA.
  User: lilinhan
  Date: 2023/5/8
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<html>
<head>
      <title>Title</title>
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
          }
      </style>
      <script type="text/javascript">
          $(function () {
              $.get(
                  "emp?m=getDept",
                  function (data) {
                      for (let x in data) {
                          $("[name=did]").append("<option value='" + data[x].did + "'>" + data[x].dname + "</option>");
                      }
                      $("[name=did]").val(${emp.did});
                  },
                  "json"
              )
              $.get(
                  "emp?m=getCity",
                  function (data) {
                      for (let x in data) {
                          $("[name=cid]").append("<option value='" + data[x].cid + "'>" + data[x].cname + "</option>");
                      }
                      $("[name=cid]").val(${emp.cid});
                  },
                  "json"
              )
          })
      </script>
</head>
<body class="text-center">
<main class="w-50 m-auto">
      <div class="w-75 mb-3">
            <h1 class="h3 fw-normal m-auto">修改页面</h1>
      </div>
      <form class="row g-3">
            <%--文本框 一行二框加验证--%>
            <div class="col-md-3 form-floating">
                  <input type="text" name="eid" class="form-control" id="eid" placeholder="请输入编号" value="${emp.eid}" readonly>
                  <label for="">请输入编号</label>
            </div>
            <div class="col-md-3 text-lg-start">
                  <div class="badge text-wrap">
                        <span id="sp1"></span>
                  </div>
            </div>
            <div class="col-md-3 form-floating">
                  <input type="text" name="ename" class="form-control" id="ename" placeholder="请输入用户名" value="${emp.ename}" readonly>
                  <label for="ename">请输入用户名</label>
            </div>
            <div class="col-md-3 text-lg-start">
                  <div class="badge text-wrap">
                        <span id="sp2"></span>
                  </div>
            </div>

            <%--文本框 一行二框加验证--%>
            <div class="col-md-3 form-floating">
                  <select class="form-select" id="cid" name="cid" aria-label="Floating label select example" onblur="checkCid()">
                        <option value="">---请选择---</option>
                  </select>
                  <label for="cid">请选择所属城市</label>
            </div>
            <div class="col-md-3 text-lg-start">
                  <div class="badge text-wrap">
                        <span id="sp3"></span>
                  </div>
            </div>
            <div class="col-md-3 form-floating">
                  <select class="form-select" id="did" name="did" aria-label="Floating label select example" onblur="checkDid()">
                        <option value="">---请选择---</option>
                  </select>
                  <label for="did">请选择所属部门</label>
            </div>
            <div class="col-md-3 text-lg-start">
                  <div class="badge text-wrap">
                        <span id="sp4"></span>
                  </div>
            </div>

            <%--文本框 一行二框加验证--%>
            <div class="col-md-3 form-floating">
                  <input type="text" name="nickName" class="form-control" id="nickName" placeholder="请输入用户昵称" onblur="checkNickName()" value="${emp.nickName}">
                  <label for="nickName">请输入用户昵称</label>
            </div>
            <div class="col-md-3 text-lg-start">
                  <div class="badge text-wrap">
                        <span id="sp5"></span>
                  </div>
            </div>
            <div class="col-md-3 form-floating">
                  <input type="text" name="tel" class="form-control" id="tel" placeholder="请输入电话" onblur="checkTel()" value="${emp.tel}">
                  <label for="tel">请输入电话</label>
            </div>
            <div class="col-md-3 text-lg-start">
                  <div class="badge text-wrap">
                        <span id="sp6"></span>
                  </div>
            </div>

            <%--文本框 一行二框加验证--%>
            <div class="col-md-3 form-floating">
                  <input type="text" name="email" class="form-control" id="email" placeholder="请输入邮箱" onblur="checkEmail()" value="${emp.email}">
                  <label for="email">请输入邮箱</label>
            </div>
            <div class="col-md-3 text-lg-start">
                  <div class="badge text-wrap">
                        <span id="sp7"></span>
                  </div>
            </div>
            <div class="col-md-3 form-floating">
                  <select class="form-select" id="gender" name="gender" aria-label="Floating label select example" onblur="checkGender()">
                        <option value="">---请选择---</option>
                        <option value="1" ${emp.gender==1?"selected":""}>男</option>
                        <option value="0" ${emp.gender==0?"selected":""}>女</option>
                  </select>
                  <label for="did">请选择性别</label>
            </div>
            <div class="col-md-3 text-lg-start">
                  <div class="badge text-wrap">
                        <span id="sp8"></span>
                  </div>
            </div>

            <%--单选/复选框--%>
            <div class="col-md-4 form-floating">
                  状态：
                  <input type="radio" name="status" value="0" onclick="checkStatus()" ${emp.status==0?"checked":""}>正常
                  <input type="radio" name="status" value="1" onclick="checkStatus()" ${emp.status==1?"checked":""}>禁用
            </div>
            <div class="col-md-2 text-lg-start">
                  <div class="badge text-wrap" id="">
                        <span id="sp9"></span>
                  </div>
            </div>

            <button class="w-75 btn btn-lg btn-primary" type="button" onclick="updateEmp()">提交</button>
      </form>
</main>

<script type="text/javascript">
      function updateEmp(){
          checkName();
          checkPwd();
          checkCid();
          checkDid();
          checkNickName();
          checkTel();
          checkEmail();
          checkGender();
          checkStatus();
          let text = $("span").text();
          if(text==""){
              $.post(
                  "emp?m=updateEmp",
                  $("form").serialize(),
                  function (msg){
                      if(msg>0){
                          alert("修改成功");
                          location.href="emp?m=getEmp";
                      }else{
                          alert("修改失败");
                      }
                  },
                  "json"
              )
          }else{
              alert("好好检查一下！");
          }
      }
      function checkName(){
          let val = $("[name=ename]").val();
          if(val!=""){
              $("#sp1").html("");
          }else{
              $("#sp1").html("<font style='color: red'>请输入用户名</font>");
          }
      }
      function checkPwd(){
          let val = $("[name=upwd]").val();
          if(val!=""){
              $("#sp2").html("");
          }else{
              $("#sp2").html("<font style='color: red'>请输入登录密码</font>");
          }
      }
      function checkCid(){
          let val = $("[name=cid] option:selected").val();
          if(val!=""){
              $("#sp3").html("");
          }else{
              $("#sp3").html("<font style='color: red'>请选择所属城市</font>");
          }
      }
      function checkDid(){
          let val = $("[name=did] option:selected").val();
          if(val!=""){
              $("#sp4").html("");
          }else{
              $("#sp4").html("<font style='color: red'>请选择所属部门</font>");
          }
      }
      function checkNickName(){
          let val = $("[name=nickName]").val();
          if(val!=""){
              $("#sp5").html("");
          }else{
              $("#sp5").html("<font style='color: red'>请输入用户昵称</font>");
          }
      }
      function checkTel(){
          let val = $("[name=tel]").val();
          let str = /^1\d{10}$/
          if(val!=""){
              if(str.test(val)){
                  $.post(
                      "emp?m=checkTel",
                      {tel:val},
                      function (msg){
                          if(msg>0){
                              $("#sp6").html("<font style='color: red'>该手机号已存在</font>");
                          }else{
                              $("#sp6").html("");
                          }
                      },
                      "json"
                  )
              }else{
                  $("#sp6").html("<font style='color: red'>请输入正确的手机号码</font>");
              }
          }else{
              $("#sp6").html("<font style='color: red'>手机号码不能为空</font>");
          }
      }
      function checkEmail(){
          let val = $("[name=email]").val();
          let str = /^\w+@\w+\.+com$/
          if(val!=""){
              if(str.test(val)){
                  $("#sp7").html("");
              }else{
                  $("#sp7").html("<font style='color: red'>请正确输入邮箱格式</font>");
              }
          }else{
              $("#sp7").html("<font style='color: red'>邮箱不能为空</font>");
          }
      }
      function checkGender(){
          let val = $("[name=gender] option:selected").val();
          if(val!=""){
              $("#sp8").html("");
          }else{
              $("#sp8").html("<font style='color: red'>请选择性别</font>");
          }
      }
      function checkStatus(){
          let val = $("[name=status]:checked").val();
          if(val!=undefined){
              $("#sp9").html("");
          }else{
              $("#sp9").html("<font style='color: red'>请选择状态</font>");
          }
      }
</script>
</body>
</html>
