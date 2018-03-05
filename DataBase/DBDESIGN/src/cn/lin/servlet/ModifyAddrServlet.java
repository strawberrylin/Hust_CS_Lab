package cn.lin.servlet;

import cn.lin.dao.AddressDao;
import cn.lin.dao.UserDao;
import cn.lin.model.Address;
import cn.lin.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

/**
 * Created by strawberrylin on 17-6-11.
 */
@WebServlet(name = "ModifyAddrServlet")
public class ModifyAddrServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        int user_id = Integer.valueOf(request.getParameter("user_id"));
        int addr_id = Integer.valueOf(request.getParameter("addr_id"));
        String address = request.getParameter("address");
        String username = request.getParameter("name");
        String tel = request.getParameter("telphone");
        System.out.print(tel);
        String post = request.getParameter("post");
        AddressDao adao = new AddressDao();
        UserDao udao = new UserDao();
        Address address1;
        String path = "index.jsp";
        User user;
        try{
            user = udao.getUserById(user_id) ;
            address1 = new Address(user,addr_id,address,tel,post);
            if(adao.updateAddr(address1)){
                path = "index.jsp";
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
