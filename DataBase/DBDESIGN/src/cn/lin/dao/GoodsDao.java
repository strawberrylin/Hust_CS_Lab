package cn.lin.dao;

import cn.lin.db.DBUtil;
import cn.lin.model.Goods;
import cn.lin.model.User;
import sun.java2d.pipe.hw.ExtendedBufferCapabilities;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by strawberrylin on 17-6-5.
 */
public class GoodsDao {
    public Goods getById(int goods_id) throws Exception {
        Connection con = DBUtil.getCon();
        String sql = "SELECT * FROM goods,category WHERE goods_id = ? AND goods.type_id = category.type_id";
        PreparedStatement ptmt = con.prepareStatement(sql);
        ptmt.setInt(1, goods_id);
        ResultSet rs = ptmt.executeQuery();
        if (rs.next()) {
            String goodsname = rs.getString("goodsname");
            double price = rs.getDouble("price");
            String info = rs.getString("info");
            String imag = rs.getString("imag");
            int store = rs.getInt("store");
            String types = rs.getString("typesname");
            Goods goods = new Goods(goods_id,goodsname,price,info,imag,store,types);
            return  goods;
        } else {
            return null;
        }
    }

    public boolean addGoods(Goods goods) throws Exception{
        Connection con = DBUtil.getCon();
        int result = 0;
        String sql = ""+
                    "INSERT INTO goods"+
                    "(goodsname,price,info,imag,store,type_id) "+
                    "VALUES ("+
                    "?,?,?,?,?,(SELECT type_id FROM category WHERE typesname = ?)) ";
        PreparedStatement ptmt = con.prepareStatement(sql);
        ptmt.setString(1,goods.getName());
        ptmt.setDouble(2,goods.getPrice());
        ptmt.setString(3,goods.getInfo());
        ptmt.setString(4,goods.getImag());
        ptmt.setInt(5,goods.getStore());
        ptmt.setString(6,goods.getTypes());
        result = ptmt.executeUpdate();
        ptmt.close();
        if(result == 1){
            return true;
        }
        else {
            return false;
        }
    }

    public List<Goods> getAlllGoods() throws Exception{
        String sql = "SELECT * FROM goods,category WHERE goods.type_id = category.type_id";
        Connection con = DBUtil.getCon();
        Statement st = null;
        ResultSet rs = null;
        st = (Statement) con.createStatement();
        rs = st.executeQuery(sql);
        List<Goods> goodsList = new ArrayList<Goods>();
        Goods goods;
        while (rs.next()) {
            int id = rs.getInt("goods_id");
            String name = rs.getString("goodsname");
            double price = rs.getDouble("price");
            String info = rs.getString("info");
            String imag = rs.getString("imag");
            int store = rs.getInt("store");
            String types = rs.getString("typesname");
            goods = new Goods(id,name,price,info,imag,store,types);
            goodsList.add(goods);
        }
        return goodsList;
    }

    public String[] queryTypes() throws Exception {
        String sql = "SELECT * FROM category ";
        Connection con = DBUtil.getCon();
        Statement st = null;
        ResultSet rs = null;
        st = (Statement) con.createStatement();
        rs = st.executeQuery(sql);
        String[] types = new String[10];
        int i = 0;
        while (rs.next()) {
            types[i] = rs.getString("typesname");
            i++;
        }
        con.close();
        return types;
    }

    public List<Goods> getTypeGoodsList(String type) throws Exception {
        List<Goods> goodsList = new ArrayList<Goods>();
        Connection con = DBUtil.getCon();
        Goods goods;
        ResultSet rs = null;
        String sql = "SELECT * FROM goods,category WHERE goods.type_id = category.type_id AND typesname =? ;";
        PreparedStatement ptmt = con.prepareStatement(sql);
        ptmt.setString(1, type);
        rs = ptmt.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("goods_id");
            String name = rs.getString("goodsname");
            double price = rs.getDouble("price");
            String info = rs.getString("info");
            String imag = rs.getString("imag");
            int store = rs.getInt("store");
            goods = new Goods(id,name,price,info,imag,store,type);
            goodsList.add(goods);
        }
        con.close();
        return goodsList;
    }

    public boolean deleteGoods(int goods_id) throws Exception {
        Connection con = DBUtil.getCon();
        String sql = "DELETE FROM goods WHERE goods_id=?";
        PreparedStatement ptmt = con.prepareStatement(sql);
        int result = 0;
        ptmt = con.prepareStatement(sql);
        ptmt.setInt(1, goods_id);
        result = ptmt.executeUpdate();
        ptmt.close();
        if (result == 1) {
            return true;
        }
        return false;
    }

    public boolean updateGoods(Goods goods) throws Exception{
        Connection con = DBUtil.getCon();
        String sql = "UPDATE goods set goodsname=?,price=?,info=?,imag=?,store=?,type_id= (SELECT type_id FROM category WHERE typesname = ?) WHERE goods_id = ?";
        PreparedStatement ptmt = con.prepareStatement(sql);
        int result = 0;
        ptmt.setString(1,goods.getName());
        ptmt.setDouble(2,goods.getPrice());
        ptmt.setString(3,goods.getInfo());
        ptmt.setString(4,goods.getImag());
        ptmt.setInt(5,goods.getStore());
        ptmt.setString(6,goods.getTypes());
        ptmt.setInt(7,goods.getId());
        result=ptmt.executeUpdate();
        ptmt.close();
        if(result == 1){
            return true;
        }else {
            return false;
        }
    }
}
