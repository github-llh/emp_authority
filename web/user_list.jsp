<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lilinhan
  Date: 2023/5/8
  Time: 20:53
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
      <div style="width: 1200px;">
            <form action="user?m=getUser" method="post">
                  <table class="table table-bordered table-striped table-hover align-middle caption-top text-center">
                        <caption>用户列表</caption>
                        <thead class="table-light">
                        <tr>
                              <th>用户编号</th>
                              <th>用户名</th>
                              <th>密码</th>
                              <th>电话</th>
                              <th>角色</th>
                        </tr>
                        </thead>
                        <tbody class="table-group-divider">
                        <c:forEach items="${pageInfo.list}" var="user">
                              <tr class="align-bottom">
                                    <th>${user.uid}</th>
                                    <td>${user.uname}</td>
                                    <td>${user.upwd}</td>
                                    <td>${user.tel}</td>
                                    <td>${user.power==1?"超级管理员":"普通用户"}</td>
                              </tr>
                        </c:forEach>
                        <tr class="table">
                              <td colspan="5">
                                    <button type="button" class="btn btn-danger btn-sm" onclick="back()">回退</button>
                                    <button name="pageNum" class="btn btn-outline-primary btn-sm" value="1"><<</button>
                                    <button name="pageNum" class="btn btn-outline-primary btn-sm" value="${pageInfo.prePage==1?1:pageInfo.prePage}"><</button>
                                    <c:forEach items="${pageInfo.navigatepageNums}" var="na">
                                          <button name="pageNum" class="btn btn-outline-primary btn-sm" value="${na}">${na}</button>
                                    </c:forEach>
                                    <button name="pageNum" class="btn btn-outline-primary btn-sm" value="${pageInfo.nextPage==0?pageInfo.pages:pageInfo.nextPage}">></button>
                                    <button name="pageNum" class="btn btn-outline-primary btn-sm" value="${pageInfo.pages}">>></button>
                                    总条数：${pageInfo.total}条
                                    <button type="button" class="btn btn-danger btn-sm" onclick="sw()">切换用户</button>
                              </td>
                        </tr>
                        </tbody>
                  </table>
            </form>
      </div>
</center>
<script type="text/javascript">
      function sw(){
          location.href="emp?m=exit";
      }
      function back(){
          location.href="emp?m=getEmp";
      }
</script>
</body>
</html>
