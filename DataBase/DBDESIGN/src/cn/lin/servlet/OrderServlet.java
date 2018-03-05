package cn.lin.servlet;

import cn.lin.dao.AddressDao;
import cn.lin.dao.OrderDao;
import cn.lin.dao.UserDao;
import cn.lin.model.Address;
import cn.lin.model.Order;
import cn.lin.model.User;
import com.sun.org.apache.xpath.internal.operations.Or;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.Date;

/**
 * Created by strawberrylin on 17-6-11.
 */
@WebServlet(name = "OrderServlet")
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("test/html");
        int user_id = Integer.valueOf(request.getParameter("user_id"));
        int addr_id = Integer.valueOf(request.getParameter("addr_id"));
        String address = request.getParameter("address");
        String name =  request.getParameter("name");
        String telphone = request.getParameter("telphone");
        String post = request.getParameter("post");
        String goodsname = request.getParameter("goodsname");
        AddressDao adao = new AddressDao();
        UserDao udao = new UserDao();
        OrderDao odao = new OrderDao();
        String path = "index.jsp";
        User user;
        try{
            user = udao.getUserById(user_id);
            if(!adao.querry_exit(address)){
                Address address1= new Address(user,addr_id,address,telphone,post);
                adao.addAddr(address1);
            }
            Address address2 = adao.getAddrById(user,addr_id);
            java.util.Date date = new java.util.Date();
            Order order = new Order(user,address2,0,new java.sql.Date(date.getTime()),0,goodsname);
            if(odao.addOrder(order)){
                path= "index.jsp";
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        String truepath = request.getContextPath() + File.separator + path;
        response.sendRedirect(truepath);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
