/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import dao.OrderDAO;
import java.util.List;

/**
 *
 * @author Admin
 */
public class Cart {

    private int uid;
    private int pid;
    private int quantity;
    private Product product;
    private User u;

    public Cart() {
    }

    public Cart(int uid, int pid, int quantity) {
        this.uid = uid;
        this.pid = pid;
        this.quantity = quantity;
    }

    public Cart(int uid, int pid, int quantity, Product product, User u) {
        this.uid = uid;
        this.pid = pid;
        this.quantity = quantity;
        this.product = product;
        this.u = u;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public User getU() {
        return u;
    }

    public void setU(User u) {
        this.u = u;
    }

    public double getTotalMoney() {
        return quantity * product.getPrice();

    }

}
