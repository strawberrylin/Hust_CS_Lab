package cn.lin.servlet;

import cn.lin.dao.OrderDao;
import cn.lin.model.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

/**
 * Created by strawberrylin on 17-6-12.
 */
@WebServlet(name = "EditOrderServlet")
public class EditOrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        int order_id = Integer.valueOf(request.getParameter("order_id"));
        OrderDao odao = new OrderDao();
        String path = "";
        try{
            if(odao.updateOrder(order_id)){
                path = "jsp/background.jsp";
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
