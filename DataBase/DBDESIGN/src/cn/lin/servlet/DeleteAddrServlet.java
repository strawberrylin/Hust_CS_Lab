package cn.lin.servlet;

import cn.lin.dao.AddressDao;

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
@WebServlet(name = "DeleteAddrServlet")
public class DeleteAddrServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        int addr_id = Integer.valueOf(request.getParameter("addr_id"));
        AddressDao adao = new AddressDao();
        String path = "index.jsp";
        try{
           if(adao.deleteAddr(addr_id)) {
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
