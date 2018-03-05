<%@ page import="cn.lin.dao.GoodsDao" %><%--
  Created by IntelliJ IDEA.
  User: strawberrylin
  Date: 17-6-12
  Time: 上午9:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form id="modifyform" action="/servlet/AddGoodsServlet" method="post">
        <div>
            <h1>修改地址信息</h1>
            <ul style="list-style: none"><li><input type="hidden" name="goodsid" id="addr_id" value=""></li></ul>
            <ul style="list-style: none"><li>名称：<input type="text" name="goodsname" id="a1" value=""></li></ul>
            <ul style="list-style: none"><li>图片：<input type="text" name="goodsimag" id="i1" value=""></li></ul>
            <ul style="list-style: none"><li>价格：<input type="text" name="goodsprice" id="n1" value=""></li></ul>
            <ul style="list-style: none"><li>信息：<input type="text" name="goodsinfo" id="t1" value=""></li></ul>
            <ul style="list-style: none"><li>存储：<input type="text" name="goodsstore" value="" id="p1"></li></ul>
            <ul style="list-style: none"><li>类型：<input type="text" name="goodstype" value="" id="p2"></li></ul>
            <ul style="list-style: none"><li><input type="submit" value="添加" class="submit-btn"></li></ul>
        </div>
    </form>
</body>
</html>
