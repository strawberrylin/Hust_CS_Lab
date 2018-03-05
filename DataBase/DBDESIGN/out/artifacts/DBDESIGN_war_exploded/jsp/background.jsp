<%@ page import="cn.lin.dao.GoodsDao" %>
<%@ page import="cn.lin.model.Goods" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.lin.dao.OrderDao" %>
<%@ page import="cn.lin.model.Order" %>
<%@ page import="cn.lin.dao.UserDao" %>
<%@ page import="cn.lin.model.User" %>
<%@ page import="cn.lin.dao.AddressDao" %>
<%@ page import="cn.lin.model.Address" %><%--
  Created by IntelliJ IDEA.
  User: strawberrylin
  Date: 17-6-11
  Time: 下午11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>BackManage</title>
</head>
<body>
<center>
    <form id="editgoodform" name="editgoodform" action="/servlet/DeleteGoodsServlet" method="post">
        <h1>商品信息管理</h1>
        <table border = "0">
            <%
                GoodsDao dao = new GoodsDao();
                List<Goods> list = dao.getAlllGoods();
                for (Goods g:list){
            %>
            <tr>
                <td><img src=<%=g.getImag()%> width="64px" height="64px"/></td>
                <td><%=g.getName()%></td>
                <td><%="￥"+g.getPrice()%></td>
                <td><%=g.getInfo()%></td>
                <td><%=g.getStore()%></td>
                <td><%=g.getTypes()%></td>
                <ul style="list-style: none"><li><input type="hidden" name="goodsid" id="g0" value="<%=g.getId()%>"></li></ul>
                <ul style="list-style: none"><li><input type="hidden" name="goodsname" id="g1" value="<%=g.getName()%>"></li></ul>
                <ul style="list-style: none"><li><input type="hidden" name="goodsprice" id="g2" value="<%=g.getPrice()%>"></li></ul>
                <ul style="list-style: none"><li><input type="hidden" name="goodsimag" id="g3" value="<%=g.getImag()%>"></li></ul>
                <ul style="list-style: none"><li><input type="hidden" name="goodsinfo" id="g4" value="<%=g.getInfo()%>"></li></ul>
                <ul style="list-style: none"><li><input type="hidden" name="goodsstore" id="g5" value="<%=g.getStore()%>"></li></ul>
                <ul style="list-style: none"><li><input type="hidden" name="goodstype" id="g56" value="<%=g.getTypes()%>"></li></ul>
                <td><input type="button" value="修改" name="add" id="bt1" onclick="document.editgoodform.action='modifygood.jsp';document.editgoodform.submit();"></td>
                <td><input type="submit" value="删除" name="delete" id="bt2" class="submit-btn"></td>
            </tr>
            <%
                }
            %>
        </table>
        <div>
            <input type="button" value="增加" name="add" id="bt3" onclick="document.editgoodform.action='addgood.jsp';document.editgoodform.submit();">
        </div>
    </form>
    <form id="editorder" action="/servlet/EditOrderServlet" method="post">
        <h1>订单管理</h1>
        <table border="0">
            <%
                OrderDao odao = new OrderDao();
                List<Order> order_list = odao.getAllOrder();
                if(order_list!=null){
                    for(Order o:order_list){
            %>
            <tr>
                <td id="order_id"><%=o.getId()%></td>
                <td id="ouser_id"><%=o.getUser().getUsername()%></td>
                <td id="ogood"><%=o.getGoodsname()%></td>
                <td id="oaddr"><%=o.getAddress().getAddress()%></td>
                <td id="ostatus"><%=o.getStatus()%></td>

                <ul style="list-style: none"><li><input type="hidden" name="order_id" id="o0" value="<%=o.getId()%>"></li></ul>
                <td><input type="submit" value="接单" name="edit" id="bt4" class="submit-btn"></td>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </form>
</center>
</body>
</html>
