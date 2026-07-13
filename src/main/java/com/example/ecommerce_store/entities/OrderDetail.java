package com.example.ecommerce_store.entities;

public class OrderDetail {
    private int detailId;
    private int orderId;
    private int productId;
    private double price;
    private int quantity;
    private double subTotal;
    private Product product;

    public OrderDetail() {
    }

    public OrderDetail(int detailId, int orderId, int productId, double price, int quantity, double subTotal, Product product) {
        this.detailId = detailId;
        this.orderId = orderId;
        this.productId = productId;
        this.price = price;
        this.quantity = quantity;
        this.subTotal = subTotal;
        this.product = product;
    }

    public Product getProduct(){
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getDetailId() {
        return detailId;
    }

    public void setDetailId(int detailId) {
        this.detailId = detailId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }
}
