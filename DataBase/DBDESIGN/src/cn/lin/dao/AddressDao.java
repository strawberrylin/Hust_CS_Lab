package cn.lin.dao;

import cn.lin.db.DBUtil;
import cn.lin.model.Address;
import cn.lin.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by strawberrylin on 17-6-10.
 */
public class AddressDao {
    public List<Address> getByUserId(User user) throws Exception {
        Connection con = DBUtil.getCon();
        List<Address> addrList = new ArrayList<Address>();
        String sql = "SELECT * FROM address " +
                "WHERE user_id = ?";
        PreparedStatement ptmt = con.prepareStatement(sql);
        ptmt.setInt(1, user.getId());
        ResultSet rs = ptmt.executeQuery();
        Address address;
        while (rs.next()) {
            int addr_id = rs.getInt("addr_id");
            String addr = rs.getString("address");
            String tel = rs.getString("tel");
            String post = rs.getString("post");
            address = new Address(user, addr_id, addr, tel, post);
            System.out.println(addr_id);
            addrList.add(address);
        }
        return addrList;
    }

    public boolean querry_exit(final String address) throws Exception{
        Connection con = DBUtil.getCon();
        String sql = "SELECT * FROM address " +
                    "WHERE address = ?";
        PreparedStatement ptmt = con.prepareStatement(sql);
        ptmt.setString(1,address);
        ResultSet rs = ptmt.executeQuery();
        if (rs.next()) {
            return true;
        }
        else {
            ptmt.close();
            return false;
        }
    }
    public Address getAddrById(User user,final int addr_id) throws Exception{
        Connection con = DBUtil.getCon();
        String sql = "SELECT * FROM address " +
                    "WHERE addr_id = ?";
        PreparedStatement ptmt = con.prepareStatement(sql);
        ptmt.setInt(1,addr_id);
        ResultSet rs = ptmt.executeQuery();
        Address address;
        if (rs.next()) {
            String addr = rs.getString("address");
            String tel = rs.getString("tel");
            String post = rs.getString("post");
            address = new Address(user, addr_id, addr, tel, post);
            return address;
        }
        else {
            ptmt.close();
            return null;
        }
    }

    public boolean addAddr(Address address) throws Exception{
        Connection con = DBUtil.getCon();
        int result = 0;
        String sql = ""+
                    "INSERT INTO address "+
                    "(user_id,address,tel,post) "+
                    "VALUES ("+
                    "?,?,?,?) ";
        PreparedStatement ptmt = con.prepareStatement(sql);
        ptmt.setInt(1,address.getUser().getId());
        ptmt.setString(2,address.getAddress());
        ptmt.setString(3,address.getTel());
        ptmt.setString(4,address.getPost());
        result = ptmt.executeUpdate();
        ptmt.close();
        if(result == 1){
            return true;
        }
        else {
            return false;
        }
    }

    public boolean deleteAddr(int addr_id) throws Exception{
        Connection con = DBUtil.getCon();
        String sql = "DELETE FROM address WHERE addr_id=?";
        PreparedStatement ptmt = con.prepareStatement(sql);
        ptmt.setInt(1,addr_id);
        int result = ptmt.executeUpdate();
        ptmt.close();
        if(result == 1){
            return true;
        }else{
            return false;
        }
    }
    public boolean  updateAddr(Address address)throws Exception{
        Connection con = DBUtil.getCon();
        String sql = "UPDATE address set address = ?,tel = ?, post = ? WHERE addr_id = ?";
        PreparedStatement ptmt = con.prepareStatement(sql);
        ptmt.setString(1,address.getAddress());
        ptmt.setString(2,address.getTel());
        ptmt.setString(3,address.getPost());
        ptmt.setInt(4,address.getId());
        int result = ptmt.executeUpdate();
        if(result == 1){
            return true;
        }else {
            return false;
        }
    }
}
