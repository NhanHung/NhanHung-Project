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
public class Order {

    private int id;
    private User user;
    private Date orderDate;
    private double total;
    private String notes;
    private String address;
    private String phone;
    private int status;
    private String statusName;

    public Order(int id, User user, Date orderDate, double total, String notes, String address, String phone, int status) {
        this.id = id;
        this.user = user;
        this.orderDate = orderDate;
        this.total = total;
        this.notes = notes;
        this.address = address;
        this.phone = phone;
        this.status = status;
    }

    public Order(int id, User user, Date orderDate, double total, String notes) {
        this.id = id;
        this.user = user;
        this.orderDate = orderDate;
        this.total = total;
        this.notes = notes;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getStatusName() {
        return StatusEnum.findByCode(status).name;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

}
