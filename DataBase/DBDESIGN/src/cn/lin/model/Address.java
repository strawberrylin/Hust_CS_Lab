package cn.lin.model;

/**
 * Created by strawberrylin on 17-5-31.
 */

public class Address {
    private User user;  //用户
    private int id;     //id
    private String address;     //地址
    private String tel;     //电话
    private String post; //邮编

    public Address(User user, int id, String address, String tel, String post) {
        this.user = user;
        this.id = id;
        this.address = address;
        this.tel = tel;
        this.post = post;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
    }
}
