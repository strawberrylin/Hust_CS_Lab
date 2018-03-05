<%--
  Created by IntelliJ IDEA.
  User: strawberrylin
  Date: 17-6-4
  Time: 下午11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
</head>
<body>
<center>
    <form  id="loginform" action="/servlet/LoginServlet" method="post">
        <input name="qx" type="hidden" value="1">
        <div>
            <ul style="list-style: none"><li><h3>用户登录</h3></li></ul>
            <ul style="list-style: none"><li>用户名：<input type="text" name="username" value=""></li></ul>
            <ul style="list-style: none"><li>密&emsp;码：<input type="password" name="password"></li></ul>
            <ul style="list-style: none"><li><input type="radio" name="radio" value="0">普通用户<input type="radio" name="radio" value="1">商家用户</li></ul>
            <ul style="list-style: none"><li><input type="submit" value="登录" class="btn-submit"></li></ul>
        </div>
    </form>
    <form id="registertoform" action="/servlet/LoginServlet" method="post">
        <input name="qx" type="hidden" value="2">
        <div>
            <ul style="list-style: none"><li><input type="submit" value="注册" class="btn-submit"></li></ul>
        </div>
    </form>
</center>
</body>
</html>
