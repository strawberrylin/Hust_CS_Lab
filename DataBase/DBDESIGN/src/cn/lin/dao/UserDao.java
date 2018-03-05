package cn.lin.dao;

import cn.lin.db.DBUtil;
import cn.lin.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by strawberrylin on 17-5-31.
 */
public class UserDao {
    public User querry_exit(final String username) throws Exception{

        Connection con = DBUtil.getCon();
        String sql = "SELECT * FROM user " +
                    "WHERE username = ?";
        PreparedStatement ptmt = con.prepareStatement(sql);
        ptmt.setString(1,username);
        ResultSet rs = ptmt.executeQuery();

        if (rs.next()) {
            int user_id = rs.getInt("user_id");
            String uname = rs.getString("username");
            String password = rs.getString("password");
            String nickname = rs.getString("nickname");
            int type = rs.getInt("type");
            User user = new User(user_id,uname,password,nickname,type);
            ptmt.close();
            return user;
        }
        else {
            ptmt.close();
            return null;
        }
    }

    public User getUserById(final int user_id) throws Exception{

        Connection con = DBUtil.getCon();
        String sql = "SELECT * FROM user " +
                    "WHERE user_id = ?";
        PreparedStatement ptmt = con.prepareStatement(sql);
        ptmt.setInt(1,user_id);
        ResultSet rs = ptmt.executeQuery();

        if (rs.next()) {
            String uname = rs.getString("username");
            String password = rs.getString("password");
            String nickname = rs.getString("nickname");
            int type = rs.getInt("type");
            User user = new User(user_id,uname,password,nickname,type);
            ptmt.close();
            return user;
        }
        else {
            ptmt.close();
            return null;
        }
    }

    public boolean addUser(User user){
        try{
            Connection con = DBUtil.getCon();
            String sql = ""+
                    "INSERT INTO user "+
                    "(username,password,nickname,type)"+
                    "VALUES("+
                    "?,?,?,?) " ;
            PreparedStatement ptmt = con.prepareStatement(sql);
            ptmt.setString(1,user.getUsername());
            ptmt.setString(2,user.getPassword());
            ptmt.setString(3,user.getNickname());
            ptmt.setInt(4,user.getType());
            ptmt.execute();
            ptmt.close();
            return true;
        }catch (SQLException e){
            e.printStackTrace();
        }
        return true;
    }

    public boolean login(User user){
        try{
            Connection con = DBUtil.getCon();
            String sql = "SELECT * from user "+
                    "WHERE nickname = ? AND password = ? ";
            PreparedStatement ptmt = con.prepareStatement(sql);
            ptmt.setString(1,user.getNickname());
            ptmt.setString(2,user.getPassword());
            ResultSet rs = ptmt.executeQuery();
            ptmt.close();
            if(rs.next()){
                return true;
            }
            else {
                return false;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return true;
    }
}
