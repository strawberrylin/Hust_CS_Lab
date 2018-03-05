package cn.lin.model;

import java.sql.Blob;

/**
 * Created by strawberrylin on 17-5-31.
 */
public class Goods {
    private int id;     //商品编号
    private String name;//商品名
    private Double price;//商品价格
    private String info;//商品信息
    private String  imag;//商品图片存储
    private int store;//商品存储量
    private String types; //商品类型

    public Goods(int id, String name, Double price, String info, String imag, int store,String types) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.info = info;
        this.imag = imag;
        this.store = store;
        this.types = types;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public String getImag() {
        return imag;
    }

    public void setImag(String imag) {
        this.imag = imag;
    }

    public int getStore() {
        return store;
    }

    public void setStore(int store) {
        this.store = store;
    }

    public String getTypes() {
        return types;
    }

    public void setTypes(String types) {
        this.types = types;
    }
}
