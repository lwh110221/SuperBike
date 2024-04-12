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
}
