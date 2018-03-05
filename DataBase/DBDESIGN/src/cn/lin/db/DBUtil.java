package cn.lin.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLClientInfoException;
import java.sql.SQLException;

/**
 * Created by strawberrylin on 17-5-31.
 */
public class DBUtil {
    private static final String url = "jdbc:mysql://localhost:3306/salesol";
    private static final String user = "root";
    private static final String password = "123456";

    private static Connection con = null;
    static {
        try{
            //加载driver
            Class.forName("com.mysql.jdbc.Driver");
            //获取数据库连接
            con = DriverManager.getConnection(url,user,password);
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public static Connection getCon(){
        return con;
    }
}
