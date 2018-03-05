<%--
  Created by IntelliJ IDEA.
  User: strawberrylin
  Date: 17-6-5
  Time: 上午12:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>register</title>
</head>
<body>

<center>
    <img src="/images/react.png">
    <form id="registerform" action="/servlet/RegisterServlet" method="post">
        <input name="qx" type="hidden" value="1">
        <div>
            <ul style="list-style: none"><li><h3>用户注册</h3></li></ul>
            <ul style="list-style: none"><li>用户名&emsp;：<input type="text" name="username" value=""></li></ul>
            <ul style="list-style: none"><li>昵&emsp;称&emsp;：<input type="text" name="nickname" value=""></li></ul>
            <ul style="list-style: none"><li>密&emsp;码&emsp;：<input type="password" name="password"></li></ul>
            <ul style="list-style: none"><li>确认密码：<input type="password" name="repassword"></li></ul>
            <ul style="list-style: none"><li><input type="radio" name="radio" value="0">普通用户<input type="radio" name="radio" value="1">商家用户</li></ul>
            <ul style="list-style: none"><li><input type="submit" value="注册" class="btn-submit"></li></ul>
        </div>
</center>
</body>
</html>
