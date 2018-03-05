package cn.lin.dao;

import cn.lin.db.DBUtil;
import cn.lin.model.Address;
import cn.lin.model.Order;
import cn.lin.model.User;
import com.sun.org.apache.xpath.internal.operations.Or;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

/**
 * Created by strawberrylin on 17-6-10.
 */
public class OrderDao {
    public List<Order> getById(User user, Address address) throws Exception {
        Connection con = DBUtil.getCon();
        List<Order> orderList = new ArrayList<Order>();
        String sql = "SELECT * FROM ordert " +
                "WHERE user_id = ? AND addr_id = ?";
        PreparedStatement ptmt = con.prepareStatement(sql);
        ptmt.setInt(1, user.getId());
        ptmt.setInt(2,address.getId());
        ResultSet rs = ptmt.executeQuery();
        while(rs.next()) {
            int order_id = rs.getInt("order_id");
            int addr_id = rs.getInt("addr_id");
            Date date = rs.getDate("date");
            int status = rs.getInt("status");
            String goodsname = rs.getString("goodsname");
            Order order = new Order(user,address,order_id,date,status,goodsname);
            orderList.add(order);
        }
        return orderList;
    }

    public List<Order> getAllOrder() throws Exception{
        Connection con = DBUtil.getCon();
        List<Order> orderList = new ArrayList<Order>();
        String sql = "SELECT * FROM ordert ";
        PreparedStatement ptmt = con.prepareStatement(sql);
        UserDao udao = new UserDao();
        AddressDao adao = new AddressDao();
        ResultSet rs = ptmt.executeQuery();
        while(rs.next()) {
            int order_id = rs.getInt("order_id");
            int user_id = rs.getInt("user_id");
            User user = udao.getUserById(user_id);
            int addr_id = rs.getInt("addr_id");
            Address address = adao.getAddrById(user,addr_id);
            Date date = rs.getDate("date");
            int status = rs.getInt("status");
            String goodsname = rs.getString("goodsname");
            Order order = new Order(user,address,order_id,date,status,goodsname);
            orderList.add(order);
        }
        return orderList;
    }


    public boolean addOrder(Order order) throws Exception{
        Connection con = DBUtil.getCon();
        int result = 0;
        String sql = ""+
                    "INSERT INTO ordert "+
                    "(user_id,addr_id,date,status,goodsname) "+
                    "VALUES ("+
                    "?,?,?,?,?) ";
        PreparedStatement ptmt = con.prepareStatement(sql);
        ptmt.setInt(1,order.getUser().getId());
        ptmt.setInt(2,order.getAddress().getId());
        ptmt.setDate(3,order.getDate());
        ptmt.setInt(4,order.getStatus());
        ptmt.setString(5,order.getGoodsname());
        result = ptmt.executeUpdate();
        ptmt.close();
        if(result == 1){
            return true;
        }
        else {
            return false;
        }
    }

    public boolean deleteOrder(int order_id) throws Exception{
        Connection con = DBUtil.getCon();
        String sql = "DELETE FROM ordert WHERE order_id=?";
        PreparedStatement ptmt = con.prepareStatement(sql);
        ptmt.setInt(1,order_id);
        int result = ptmt.executeUpdate();
        ptmt.close();
        if(result == 1){
            return true;
        }else{
            return false;
        }
    }
    public boolean  updateOrder(int order_id)throws Exception{
        Connection con = DBUtil.getCon();
        String sql = "UPDATE ordert set  status = 1 WHERE order_id = ?";
        PreparedStatement ptmt = con.prepareStatement(sql);
        ptmt.setInt(1,order_id);
        System.out.println(order_id);
        int result = ptmt.executeUpdate();
        if(result == 1){
            return true;
        }else {
            return false;
        }
    }
}
