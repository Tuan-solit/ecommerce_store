package com.example.ecommerce_store.service;

import com.example.ecommerce_store.entities.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();
    List<Product> search(String keyword);
    Product findById(int id);

    // admin
    List<Product> getProductList();
    List<Product> getProductRandomList();
    boolean add(Product product);
    boolean edit(Product product);
    boolean delete(int id);
    int countProductByCategoryId(int id);
}
