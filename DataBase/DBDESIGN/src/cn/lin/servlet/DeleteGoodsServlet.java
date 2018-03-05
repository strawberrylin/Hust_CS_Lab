package cn.lin.servlet;

import cn.lin.dao.GoodsDao;

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
@WebServlet(name = "DeleteGoodsServlet")
public class DeleteGoodsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        int goodsid = Integer.valueOf(request.getParameter("goodsid"));
        String path = "index.jsp";
        GoodsDao gdao = new GoodsDao();
        try{
           if(gdao.deleteGoods(goodsid)) {
                path = "jsp/background.jsp";
           }
        }catch (Exception e){
            e.printStackTrace();
        }
        String truepath = request.getContextPath() + File.separator + path;
        response.sendRedirect(truepath);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
