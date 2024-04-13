package com.lwhao.bean;

import  java.math.BigDecimal;

/**
 * @author : Luowenhao221
 * @date : 2024/4/12 18:41
 * @Project : SuperBike
 */

//自行车类，包含自行车的各种属性和操作方法。
public class Bike {
    private Integer id;
    private String name;
    private String brand;
    private BigDecimal price;
    private Integer sales;
    private Integer stock;
    private String size;
    private String classification;
    private String img_path;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getSales() {
        return sales;
    }

    public void setSales(Integer sales) {
        this.sales = sales;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getClassification() {
        return classification;
    }

    public void setClassification(String classification) {
        this.classification = classification;
    }

    public String getImg_path() {
        return img_path;
    }

    public void setImg_path(String img_path) {
        this.img_path = img_path;
    }


    /**
     * 重写toString方法
     */
    @Override
    public String toString() {
        return "Bike{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", brand='" + brand + '\'' +
                ", price=" + price +
                ", sales=" + sales +
                ", stock=" + stock +
                ", size=" + size +
                ", classification='" + classification + '\'' + //新增分类
                ", img_path='" + img_path + '\'' +
                '}';
    }


    /**
     * 无参构造方法
     */
    public Bike() {
    }

    /**
     * 有参构造方法
     */
    public Bike(Integer id, String name, String brand, BigDecimal price, Integer sales, Integer stock, String size, String classification, String img_path){
        this.id = id;
        this.name = name;
        this.brand = brand;
        this.price = price;
        this.sales = sales;
        this.stock = stock;
        this.size = size;
        this.classification = classification;
        this.img_path = img_path;
    }
}
