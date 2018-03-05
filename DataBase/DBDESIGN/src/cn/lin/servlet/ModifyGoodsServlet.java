package cn.lin.servlet;

import cn.lin.dao.GoodsDao;
import cn.lin.model.Goods;

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
@WebServlet(name = "ModifyGoodsServlet")
public class ModifyGoodsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        int id = Integer.valueOf(request.getParameter("goodsid"));
        String goodsname = request.getParameter("goodsname");
        Double goodsprice = Double.valueOf(request.getParameter("goodsprice"));
        String info = request.getParameter("goodsinfo");
        String imag = request.getParameter("goodsimag");
        int store = Integer.valueOf(request.getParameter("goodsstore"));
        String type = request.getParameter("goodstype");
        GoodsDao gdao = new GoodsDao();
        Goods goods ;
        String path = "index.jsp";
        try{
            goods = new Goods(id,goodsname,goodsprice,info,imag,store,type);
            if(gdao.updateGoods(goods)){
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
