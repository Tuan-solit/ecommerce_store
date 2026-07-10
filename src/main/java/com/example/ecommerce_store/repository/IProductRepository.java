package com.example.ecommerce_store.repository;

import com.example.ecommerce_store.entities.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();
    List<Product> search(String keyword);
    Product findById(int id);
    List<Product> getProductList();
    List<Product> getProductRandomList();
    
}
