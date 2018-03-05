<%@ page import="cn.lin.dao.GoodsDao" %>
<%@ page import="cn.lin.model.Goods" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: strawberrylin
  Date: 17-6-12
  Time: 下午5:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<input type="button" value="个人信息" onclick="javascript:window.location.href='/jsp/messages.jsp'">
<center>
  <li style="list-style: none">
    <input type="text" name="type" value="" id="i1">
    <input type="button" value="查询" id="bt1" onclick="window.location.href='/jsp/typequire.jsp'">
  </li>
  <table border = "0">
    <h1>商品展示</h1>
    <%
      GoodsDao dao = new GoodsDao();
      List<Goods> list;
      String type = request.getParameter("type");
      System.out.println(type);

      if (type==""){
        list = dao.getAlllGoods();
      }else{
        list = dao.getTypeGoodsList(type);
      }
      if(list!=null){

      for (Goods g:list){
    %>
    <tr onclick="window.location.href='/jsp/showi.jsp?transmit=<%=g.getId()%>'">
      <td><img src=<%=g.getImag()%> width="64px" height="64px"/></td>
      <td><%=g.getName()%></td>
      <td><%="￥"+g.getPrice()%></td>
    </tr>
    <%
        }
      }
    %>
  </table>
</center>
</body>
</html>
