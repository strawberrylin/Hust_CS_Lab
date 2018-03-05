package cn.lin.model;

/**
 * Created by strawberrylin on 17-5-31.
 */
public class User {
    private int id;             //id
    private String username;   //名字
    private String password;   //密码
    private String nickname;    //昵称
    private int type;           //类型，0代表商家和1代表普通用户

    public User(int id, String username, String password, String nickname, int type) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.nickname = nickname;
        this.type = type;
    }

    public User(){

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
