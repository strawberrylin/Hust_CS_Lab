package cn.lin.servlet;

import cn.lin.dao.UserDao;
import cn.lin.model.User;
import javafx.scene.control.RadioButton;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by strawberrylin on 17-6-7.
 */
@WebServlet(name = "RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        int ra = Integer.valueOf(request.getParameter("radio"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String nickname = request.getParameter("nickname");
        String path = "jsp/register.jsp";
        int type = 0;
        String message = "Fail to register,try again please";
        if(ra ==0){
            try{
                if(password.equals(repassword)){
                    if(register(username,password,nickname,type)){
                        message ="Congratulations,you have registered successfully";
                        path = "jsp/login.jsp";
                    }
                }
            }catch (Exception e){
                e.printStackTrace();
            }
        }else if(ra==1){
            type =1;
            try{
                if(password.equals(repassword)){
                    if(register(username,password,nickname,type)){
                        message ="Congratulations,you have registered successfully";
                        path = "jsp/login.jsp";
                    }
                }
            }catch (Exception e){
                e.printStackTrace();
            }
        }

        String truePath = request.getContextPath() + File.separator + path;
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
        out.println("<HTML>");
        out.println("  <HEAD><TITLE>注册</TITLE>");
        out.println("<meta http-equiv=\"refresh\" content=\"5;url=" + truePath
                + "\">");
        out.println("</HEAD>");
        out.println("  <BODY>");
        out.print("<div align=\"center\">");
        out.print(message);
        out.print("<br/>");
        out.print("jump to right page");
        out.print("<br/>");
        out.print("or click here：");
        out.print("<a href=\"" + truePath + "\"" + ">return" + "</a>");
        out.print("</div>");
        out.println("  </BODY>");
        out.println("</HTML>");
        out.flush();
        out.close();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    public boolean register(String username,String password,String nickname,int type){
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setNickname(nickname);
        user.setType(type);
        UserDao dao = new UserDao();
        try{
            if(dao.querry_exit(username)!=null){
                return false;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return dao.addUser(user);
    }
}
