package cn.lin.servlet;

import cn.lin.dao.UserDao;
import cn.lin.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

import static java.lang.System.out;

/**
 * Created by strawberrylin on 17-6-6.
 */
@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        String qx = request.getParameter("qx");
        int qxs = Integer.parseInt(qx);
        int ra = Integer.valueOf(request.getParameter("radio"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println(username+password);
        User user = null;
        String message = "";
        String path = "jsp/login.jsp";
        if(qxs==1){
            try{
                UserDao dao = new UserDao();
                if((user = dao.querry_exit(username))!=null){
                    if(user.getPassword().equals(password)){
                        if((user.getType()==0)&&(ra==0)) {
                            request.getSession().setAttribute("username", username);
                            request.getSession().setAttribute("user_id", String.valueOf(user.getId()));
                            path = "index.jsp";

                        }else if((user.getType()==1)&&(ra==1)){
                            request.getSession().setAttribute("username", username);
                            request.getSession().setAttribute("user_id", String.valueOf(user.getId()));
                            path = "jsp/background.jsp";
                        }
                    }
                }
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if(qxs == 2){
            path = "jsp/register.jsp";
        }
        String truepath = request.getContextPath() + File.separator + path;
        response.sendRedirect(truepath);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
