package com.lwhao.bean;

/**
 * @author : Luowenhao221
 * @date : 2024/4/12 18:51
 * @Project : SuperBike
 */

//用户类，包含用户的各种属性和操作方法。
public class User {
        private Integer id;
        private String username;
        private String password;
        private String email;
        private String address;
        private String receiver;
        private String phone;
        private String adminornot;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getAdminornot() {
        return adminornot;
    }

    public void setAdminornot(String adminornot) {
        this.adminornot = adminornot;
    }

    /**
     * 重写toString方法
     */
    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", receiver='" + receiver + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }

    public User() {
    }//无参构造方法


    /**
     * 有参构造方法
     */

    public User(Integer id, String username, String password, String email, String address,String receiver,String phone,String adminornot) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
        this.address = address;
        this.receiver = receiver;
        this.phone = phone;
        this.adminornot = adminornot;      //新增管理员判断属性 yes:管理员
    }


}
