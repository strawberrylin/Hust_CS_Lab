<%@ page import="cn.lin.dao.UserDao" %>
<%@ page import="cn.lin.model.User" %>
<%@ page import="cn.lin.dao.AddressDao" %>
<%@ page import="cn.lin.model.Address" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.lin.dao.OrderDao" %>
<%@ page import="cn.lin.model.Order" %><%--
  Created by IntelliJ IDEA.
  User: strawberrylin
  Date: 17-6-11
  Time: 下午3:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Person Page</title>
</head>
<center>
    <body>
    <div id="info">
        <form id="editinfoform" name="editinfoform" action="/servlet/DeleteAddrServlet" method="post">
            <h1>个人信息</h1>
            <ol style="list-style: none">
                <%
                    String username = (String) session.getAttribute("username");
                    UserDao udao = new UserDao();
                    User user = udao.querry_exit(username);
                %>
                <li><label for="username">用户名:  </label><input id="username" name="username" type="text" value="<%=user.getUsername()%>" disabled="true"></li>
                <li><label for="nickname">昵&emsp;称:  </label><input id="nickname" name="nickname" type="text" value="<%=user.getNickname()%>" disabled="true"></li>
            </ol>
            <h1>地址信息</h1>
            <table border="0">
                <%
                    AddressDao adao = new AddressDao();
                    List<Address> addr_list = adao.getByUserId(user);
                    if(addr_list!=null){
                        for(Address a:addr_list){
                %>
                <tr>
                    <td id="addr_id1"><%=a.getId()%></td>
                    <td id="addr1"><%=a.getAddress()%></td>
                    <td id="user1"><%=a.getUser().getUsername()%></td>
                    <td id="tel1"><%=a.getTel()%></td>
                    <td id="post1"><%=a.getPost()%></td>
                    <td><input type="hidden" name="addr_id" value="<%=a.getId()%>"></td>
                    <ul style="list-style: none"><li><input type="hidden" name="address" id="a1" value="<%=a.getAddress()%>"></li></ul>
                    <ul style="list-style: none"><li><input type="hidden" name="telphone" id="t1" value="<%=a.getTel()%>"></li></ul>
                    <ul style="list-style: none"><li><input type="hidden" name="post" id="p1" value="<%=a.getPost()%>"></li></ul>
                    <td><input type="button" value="修改" name="alter" id="bt1" onclick="document.editinfoform.action='modifyaddr.jsp';document.editinfoform.submit();"></td>
                    <td><input type="submit" value="删除" name="delete" id="bt2" class="submit-btn"></td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
            <h1>订单信息</h1>
            <table border="0" >
                <%
                    OrderDao odao = new OrderDao();
                    if(addr_list!=null){
                        for(Address a:addr_list){
                            List<Order> order_list = odao.getById(user,a);
                            if(order_list!=null){
                                for(Order o:order_list){
                %>
                <tr>
                    <td id="order_id"><%=o.getId()%></td>
                    <td id="ouser_id"><%=o.getUser().getUsername()%></td>
                    <td id="ogood"><%=o.getGoodsname()%></td>
                    <td id="oaddr"><%=o.getAddress().getAddress()%></td>
                    <td id="ostatus"><%=o.getStatus()%></td>
                </tr>
                <%
                                }
                            }
                        }
                    }
                %>
            </table>
        </form>
    </div>

    </body>
</center>
</html>
