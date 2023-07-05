<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: lilinhan
  Date: 2023/5/8
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<html>
<head>
      <title>Title</title>
      <link href="css/bootstrap.min.css" rel="stylesheet">
      <script type="text/javascript" src="js/jquery-3.5.1.js"></script>
      <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
      <%--echart线图、柱状图、饼图等各种图型库 cdn--%>
      <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
      <%--jquery cdn--%>
      <script type="text/javascript" src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.1/jquery.js"></script>
      <script type="text/javascript">
          $(function () {
              $.get(
                  "emp?m=getDept",
                  function (data) {
                      for (let x in data) {
                          $("[name=did]").append("<option value='" + data[x].did + "'>" + data[x].dname + "</option>");
                      }
                      $("[name=did]").val(${map.did});
                  },
                  "json"
              )
              $.get(
                  "emp?m=getCity",
                  function (data) {
                      for (let x in data) {
                          $("[name=cid]").append("<option value='" + data[x].cid + "'>" + data[x].cname + "</option>");
                      }
                      $("[name=cid]").val(${map.cid});
                  },
                  "json"
              )
          })
      </script>
</head>
<body>
<center>
      <div style="width: 1400px;">
            <h3>欢迎<span style="color: red">${USER.uname}</span>用户登录成功</h3>
            <form action="emp?m=getEmp" method="post">
                  <table class="table table-bordered table-striped table-hover align-middle caption-top text-center">
                        <caption>用户列表</caption>
                        <thead class="table-light">
                        <tr>
                              <td colspan="11">
                                    姓名/昵称：<input type="text" name="ename" value="${map.ename}">
                                    创建人：<input type="text" name="uname" value="${map.uname}">
                                    创建时间：<input type="text" onclick="WdatePicker()" name="createTimeMin" value="${map.createTimeMin}">-
                                    <input type="text" onclick="WdatePicker()" name="createTimeMax" value="${map.createTimeMax}"><br>
                                    部门名称：<select name="did">
                                    <option value="">--请选择--</option>
                              </select>
                                    城市名称：<select name="cid">
                                    <option value="">--请选择--</option>
                              </select>
                                    排序方式：<select name="orderName">
                                    <option value="">--请选择--</option>
                                    <option value="eid" ${map.orderName=="eid"?"selected":""}>用户编号</option>
                                    <option value="create_time" ${map.orderName=="create_time"?"selected":""}>创建时间</option>
                              </select>-
                                    <select name="orderType">
                                          <option value="">--请选择--</option>
                                          <option value="asc" ${map.orderType=="asc"?"selected":""}>正序</option>
                                          <option value="desc" ${map.orderType=="desc"?"selected":""}>倒序</option>
                                    </select>
                                    <button type="submit" class="btn btn-outline-primary btn-sm">查询</button>
                                    <button type="button" class="btn btn-outline-primary btn-sm" onclick="cl()">重置</button>
                                    <button type="button" class="btn btn-outline-primary btn-sm" onclick="exitLogin()">退出登录</button>
                                    <button type="button" class="btn btn-outline-primary btn-sm" onclick="addEmp()">普通添加</button>
                              </td>
                        </tr>
                        <tr>
                              <th>用户编号</th>
                              <th>姓名</th>
                              <th>用户昵称</th>
                              <th>所属部门</th>
                              <th>所属城市</th>
                              <th>电话</th>
                              <th>邮箱</th>
                              <th>创建时间</th>
                              <th>创建人</th>
                              <th>状态</th>
                              <th>操作</th>
                        </tr>
                        </thead>
                        <tbody class="table-group-divider">
                        <c:forEach items="${pageInfo.list}" var="emp">
                              <tr class="align-bottom">
                                    <th>
                                          <input type="checkbox" class="ck" value="${emp.eid}">
                                          ${emp.eid}
                                    </th>
                                    <td>${emp.ename}</td>
                                    <td>${emp.nickName}</td>
                                    <td>${emp.dname}</td>
                                    <td>${emp.cname}</td>
                                    <td>${emp.tel}</td>
                                    <td>${emp.email}</td>
                                    <td><fmt:formatDate value="${emp.createTime}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
                                    <td>${emp.uname}</td>
                                    <td class="st">
                                          <c:if test="${emp.status==1}">
                                                <button type="button" class="btn btn-danger btn-sm">禁用</button>
                                          </c:if>
                                          <c:if test="${emp.status==0}">
                                                <button type="button" class="btn btn-success btn-sm">正常</button>
                                          </c:if>
                                    </td>
                                    <td>
                                          <c:if test="${USER.uname!='admin'}">
                                                <button type="button" class="btn btn-outline-primary btn-sm" disabled>只读</button>
                                          </c:if>
                                          <c:if test="${USER.uname=='admin'}">
                                                <c:if test="${emp.status==0}">
                                                      <button type="button" class="btn btn-outline-success btn-sm" onclick="toUpdate(${emp.eid})">编辑</button>
                                                      <button type="button" class="btn btn-outline-danger btn-sm" onclick="delEmp(${emp.eid})">删除</button>
                                                </c:if>
                                                <c:if test="${emp.status==1}">
                                                      <button type="button" class="btn btn-danger btn-sm" onclick="toUpdate(${emp.eid})">编辑</button>
                                                      <button type="button" class="btn btn-outline-danger btn-sm" onclick="delEmp(${emp.eid})">删除</button>
                                                </c:if>
                                          </c:if>
                                    </td>
                              </tr>
                        </c:forEach>
                        <tr class="table">
                              <td colspan="11">
                                    <button type="button" class="btn btn-outline-primary btn-sm" onclick="xz(true)">全选</button>
                                    <button type="button" class="btn btn-outline-primary btn-sm" onclick="xz(false)">全不选</button>
                                    <button type="button" class="btn btn-outline-primary btn-sm" onclick="fx()">反选</button>
                                    <c:if test="${USER.uname=='admin'}">
                                          <button type="button" class="btn btn-outline-danger btn-sm" onclick="batchDelEmp()">批量删除</button>
                                    </c:if>

                                    <button name="pageNum" class="btn btn-outline-primary btn-sm" value="1"><<</button>
                                    <button name="pageNum" class="btn btn-outline-primary btn-sm"
                                            value="${pageInfo.prePage==1?1:pageInfo.prePage}"><
                                    </button>
                                    <button name="pageNum" class="btn btn-outline-primary btn-sm" value="${pageInfo.pageNum}">${pageInfo.pageNum}</button>
<%--                                    <c:forEach items="${pageInfo.navigatepageNums}" var="na">--%>
<%--                                          <button name="pageNum" class="btn btn-outline-primary btn-sm"--%>
<%--                                                  value="${na}">${na}</button>--%>
<%--                                    </c:forEach>--%>
                                    <button name="pageNum" class="btn btn-outline-primary btn-sm"
                                            value="${pageInfo.nextPage==0?pageInfo.pages:pageInfo.nextPage}">>
                                    </button>
                                    <button name="pageNum" class="btn btn-outline-primary btn-sm"
                                            value="${pageInfo.pages}">>>
                                    </button>
                                    总条数：${pageInfo.total}条
                                    <c:if test="${USER.uname=='admin'}">
                                          <button type="button" class="btn btn-danger btn-sm" onclick="showLoginUser()">查看登录用户</button>
                                    </c:if>
                              </td>
                        </tr>
                        </tbody>
                  </table>
            </form>
      </div>
</center>

<script type="text/javascript">
      function showLoginUser(){
          location.href="emp?m=getUser";
      }
      function toUpdate(eid){
          location.href="emp?m=toUpdate&eid="+eid;
      }
      // 单删
      function delEmp(eid){
          if(confirm("确定要删除吗？")){
              $.post(
                  "emp?m=delEmp",
                  {eid:eid},
                  function (msg){
                      if(msg>0){
                          alert("删除成功！");
                          location.href="emp?m=getEmp";
                      }else{
                          alert("删除失败");
                      }
                  },
                  "json"
              )
          }
      }
      // 批量删除
      function batchDelEmp(){
          let str = "";
          $(".ck:checked").each(function (){
              str += ","+this.value
          })
          if(str.length>0){
              if(confirm("确定要删除吗？")){
                  $.post(
                      "emp?m=batchDelEmp",
                      {ids:str.substring(1)},
                      function (msg){
                          if(msg>0){
                              alert("删除成功！");
                              location.href="emp?m=getEmp";
                          }else{
                              alert("删除失败");
                          }
                      },
                      "json"
                  )
              }
          }else{
              alert("最少选择一个！");
          }
      }
      function xz(flag){
          $(".ck").each(function (){
              this.checked=flag;
          })
      }
      function fx(){
          $(".ck").each(function (){
              this.checked=!this.checked;
          })
      }
      //清除
      function cl(){
          $("[name=ename]").val("");
          $("[name=uname]").val("");
          $("[name=createTimeMin]").val("");
          $("[name=createTimeMax]").val("");
          $("[name=did]").val("");
          $("[name=cid]").val("");
          $("[name=orderName]").val("");
          $("[name=orderType]").val("");
      }
      // 退出登录
      function exitLogin(){
          location.href="emp?m=exit";
      }
      function addEmp(){
          location.href="emp_add.jsp";
      }
</script>
</body>
</html>
