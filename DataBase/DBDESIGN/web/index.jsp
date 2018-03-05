<%--
  Created by IntelliJ IDEA.
  User: strawberrylin
  Date: 17-5-17
  Time: 下午7:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cn.lin.dao.GoodsDao,cn.lin.model.Goods" %>
<%@ page import="java.util.List" %>
<%
  String path = request.getContextPath();
  String basepath = request.getScheme()+"://" + request.getServerName()+":" + request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title>Home Page</title>
</head></li>
<body>
<input type="button" value="个人信息" onclick="javascript:window.location.href='/jsp/messages.jsp'">
<center>
  <form action="/jsp/typequire.jsp">
  <li style="list-style: none">
    <input type="text" name="type" value="" id="i1">
    <input type="submit" value="查询" id="bt1" onclick="window.location.href='/jsp/typequire.jsp'">
  </li>
  </form>
  <table border = "0">
    <h1>商品展示</h1>
    <%
      GoodsDao dao = new GoodsDao();
      List<Goods> list;
      list = dao.getAlllGoods();
      for (Goods g:list){
    %>

    <tr onclick="window.location.href='/jsp/showi.jsp?transmit=<%=g.getId()%>'">
      <td><img src=<%=g.getImag()%> width="64px" height="64px"/></td>
      <td><%=g.getName()%></td>
      <td><%="￥"+g.getPrice()%></td>
    </tr>
    <%
      }
    %>
  </table>
</center>
</body>
</html>