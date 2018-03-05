<%@ page import="cn.lin.model.Address" %>
<%@ page import="cn.lin.dao.AddressDao" %>
<%@ page import="cn.lin.model.User" %>
<%@ page import="cn.lin.dao.UserDao" %><%--
  Created by IntelliJ IDEA.
  User: strawberrylin
  Date: 17-6-11
  Time: 下午8:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <title>Modify</title>
    <script type="text/javascript">
        function click() {
            alert("test");
        }
    </script>
</head>
<center>
    <body>
    <%
        int id = Integer.valueOf(request.getParameter("addr_id"));
        String tel = request.getParameter("telphone");
        String addr = request.getParameter("address");
        String post = request.getParameter("post");
        AddressDao adao = new AddressDao();
        UserDao udao = new UserDao();
        String username = (String) session.getAttribute("username");
        User user = udao.querry_exit(username);
    %>
    <form id="modifyform" action="/servlet/ModifyAddrServlet" method="post">
        <div>
            <h1>修改地址信息</h1>
            <ul style="list-style: none"><li><input type="hidden" name="user_id" id="user_id" value="<%=user.getId()%>"></li></ul>
            <ul style="list-style: none"><li><input type="hidden" name="addr_id" id="addr_id" value="<%=id%>"></li></ul>
            <ul style="list-style: none"><li>地址：<input type="text" name="address" id="a1" value="<%=addr%>"></li></ul>
            <ul style="list-style: none"><li>姓名：<input type="text" name="name" id="n1" value="<%=user.getUsername()%>"></li></ul>
            <ul style="list-style: none"><li>号码：<input type="text" name="telphone" id="t1" value="<%=tel%>"></li></ul>
            <ul style="list-style: none"><li>邮编：<input type="text" name="post" value="<%=post%>" id="p1"></li></ul>
            <ul style="list-style: none"><li><input type="submit" value="确定修改" class="submit-btn"></li></ul>
        </div>
    </form>
    </body>
</center>
</html>
