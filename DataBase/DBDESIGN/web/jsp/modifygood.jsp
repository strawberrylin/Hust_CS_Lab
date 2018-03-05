<%@ page import="cn.lin.dao.GoodsDao" %>
<%@ page import="cn.lin.dao.UserDao" %>
<%@ page import="cn.lin.model.User" %><%--
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
<center>
<body>
    <%
        int id = Integer.valueOf(request.getParameter("goodsid"));
        String goodsname = request.getParameter("goodsname");
        Double goodsprice = Double.valueOf(request.getParameter("goodsprice"));
        String goodsinfo = request.getParameter("goodsinfo");
        int store = Integer.valueOf(request.getParameter("goodsstore"));
        String goodstype = request.getParameter("goodstype");
        String goodsimag = request.getParameter("goodsimag");
        GoodsDao gdao = new GoodsDao();
    %>
    <form id="modifyform" action="/servlet/ModifyGoodsServlet" method="post">
        <div>
            <h1>修改地址信息</h1>
            <ul style="list-style: none"><li><input type="hidden" name="goodsid" id="addr_id" value="<%=id%>"></li></ul>
            <ul style="list-style: none"><li>名称：<input type="text" name="goodsname" id="a1" value="<%=goodsname%>"></li></ul>
            <ul style="list-style: none"><li>图片：<input type="text" name="goodsimag" id="i1" value="<%=goodsimag%>"></li></ul>
            <ul style="list-style: none"><li>价格：<input type="text" name="goodsprice" id="n1" value="<%=goodsprice%>"></li></ul>
            <ul style="list-style: none"><li>信息：<input type="text" name="goodsinfo" id="t1" value="<%=goodsinfo%>"></li></ul>
            <ul style="list-style: none"><li>存储：<input type="text" name="goodsstore" value="<%=store%>" id="p1"></li></ul>
            <ul style="list-style: none"><li>类型：<input type="text" name="goodstype" value="<%=goodstype%>" id="p1"></li></ul>
            <ul style="list-style: none"><li><input type="submit" value="修改" class="submit-btn"></li></ul>
        </div>
    </form>
    </body>
</center>
</html>
