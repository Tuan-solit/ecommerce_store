package com.example.ecommerce_store.entities.dto;

import java.util.Date;

public class OrderDTO {
    private int id;
    private String userName;
    private String phone;
    private Date created;
    private double total;
    private String status;

    public OrderDTO() {
    }

    public OrderDTO(int id, String userName, Date created, double total, String status) {
        this.id = id;
        this.userName = userName;
        this.created = created;
        this.total = total;
        this.status = status;
    }

    public OrderDTO(int id, String userName, String phone, Date created, double total, String status) {
        this.id = id;
        this.userName = userName;
        this.phone = phone;
        this.created = created;
        this.total = total;
        this.status = status;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
