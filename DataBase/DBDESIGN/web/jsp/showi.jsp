<%@ page import="cn.lin.model.Goods" %>
<%@ page import="cn.lin.model.User" %>
<%@ page import="cn.lin.dao.GoodsDao" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.lin.model.Order" %>
<%@ page import="cn.lin.dao.OrderDao" %>
<%@ page import="com.sun.org.apache.xpath.internal.operations.Or" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="cn.lin.dao.UserDao" %>
<%@ page import="cn.lin.dao.AddressDao" %>
<%@ page import="cn.lin.model.Address" %><%--
  Created by IntelliJ IDEA.
  User: strawberrylin
  Date: 17-6-9
  Time: 下午8:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Make Order</title>
    <script type="text/javascript">
        function clicks() {
            var addr1 = document.getElementById("addr1").innerHTML;
            var user1 = document.getElementById("user1").innerHTML;
            var tel1 = document.getElementById("tel1").innerHTML;
            var post1 = document.getElementById("post1").innerHTML;
            var gname = document.getElementById("g_name").innerHTML;
            document.getElementById("a1").value = addr1;
            document.getElementById("n1").value = user1;
            document.getElementById("t1").value = tel1;
            document.getElementById("p1").value = post1;
            document.getElementById("gname_id").value = gname;
            alert("Please make sure your order and then click the order button");
        }
        function clickb() {
            var addr_id1 = document.getElementById("addr_id1").innerHTML;
            document.getElementById("user_id").value = ${user_id};
            document.getElementById("addr_id").value = addr_id1;
            var addr = document.getElementById("a1").value;
            if (addr == ""){
                alert("Please add a address");
            }else{
                alert("Make order successfully");
            }
        }
    </script>
</head>
<body>
<form id="orderform" action="/servlet/OrderServlet" method="post">
    <center>
        <h1>确认订单商品</h1>
        <table border = "0">
            <%
                int id = Integer.valueOf(request.getParameter("transmit"));
                GoodsDao dao = new GoodsDao();
                Goods g;
                g = dao.getById(id);
                request.setAttribute("user_id",id);
            %>
            <tr>
                <td><img src=<%=g.getImag()%> width="64px" height="64px"/></td>
                <td id="g_name"><%=g.getName()%></td>
                <td><%="￥"+g.getPrice()%></td>
                <td><%=g.getInfo()%></td>
                <td><%=g.getStore()%></td>
                <td><%=g.getTypes()%></td>
            </tr>
        </table>
        <h1>选择已有地址</h1>
        <table border="0">
            <%
                String username = (String) session.getAttribute("username");
                UserDao udao = new UserDao();
                User user = udao.querry_exit(username);
                AddressDao adao = new AddressDao();
                List<Address> addr_list = adao.getByUserId(user);
                OrderDao odao = new OrderDao();
                if(addr_list!=null){
                    for(Address a:addr_list){
            %>
            <tr>
                <td id="addr_id1" hidden><%=a.getId()%></td>
                <td id="addr1"><%=a.getAddress()%></td>
                <td id="user1"><%=a.getUser().getUsername()%></td>
                <td id="tel1"><%=a.getTel()%></td>
                <td id="post1"><%=a.getPost()%></td>
                <td><input type="button" value="选择" name="choose" id="bt1" onclick="clicks()"></td>
            </tr>
            <%
                    }
                }
            %>
        </table>
        <h1>添加新地址</h1>
        <div>
            <ul style="list-style: none"><li><input type="hidden" name="user_id" id="user_id" value=""></li></ul>
            <ul style="list-style: none"><li><input type="hidden" name="goodsname" id="gname_id" value=""></li></ul>
            <ul style="list-style: none"><li><input type="hidden" name="addr_id" id="addr_id" value=""></li></ul>
            <ul style="list-style: none"><li>地址：<input type="text" name="address" id="a1" value=""></li></ul>
            <ul style="list-style: none"><li>姓名：<input type="text" name="name" id="n1"></li></ul>
            <ul style="list-style: none"><li>号码：<input type="text" name="telphone" id="t1"></li></ul>
            <ul style="list-style: none"><li>邮编：<input type="text" name="post" id="p1"></li></ul>
            <ul style="list-style: none"><li><input type="button" value="确定" onclick="clickb()"></li></ul>
            <ul style="list-style: none"><li><input type="submit" value="下单" class="btn-submit"></li></ul>
        </div>
    </center>
</form>
</body>
</html>
