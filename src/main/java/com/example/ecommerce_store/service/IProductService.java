package com.example.ecommerce_store.service;

import com.example.ecommerce_store.entities.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();
    List<Product> search(String keyword);
    Product findById(int id);
}
