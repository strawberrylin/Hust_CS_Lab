package cn.lin.model;

import java.sql.Date;

/**
 * Created by strawberrylin on 17-5-31.
 */
public class Order {
    private User user; //订单用户
    private Address address;//订单地址
    private int id;     //订单编号
    private Date date;  //订单日期
    private int status; //0表示未处理，1表示已经处理
    private String goodsname; //商品名

    public Order(User user, Address address, int id, Date date, int status,String goodsname) {
        this.user = user;
        this.address = address;
        this.id = id;
        this.date = date;
        this.status = status;
        this.goodsname = goodsname;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
