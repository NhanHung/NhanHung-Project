/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Admin
 */
public class Product {

    private int id;
    private String name;
    private double price;
    private int stock;
    private Category category;
    private String img;
    private String description;
    private Date createDate;

    private int size;

    public Product() {
    }

//    public Product(int id, String name, double price, int stock, Category category, String img, String description, Date createDate) {
//        this.id = id;
//        this.name = name;
//        this.price = price;
//        this.stock = stock;
//        this.category = category;
//        this.img = img;
//        this.description = description;
//        this.createDate = createDate;
//    }
   public Product(int id, String name, double price, int stock, Category category, String img, String description, Date createDate, int size) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.stock = stock;
        this.category = category;
        this.img = img;
        this.description = description;
        this.createDate = createDate;
        this.size = size;
    }
    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

}
