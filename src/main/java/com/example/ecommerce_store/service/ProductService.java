package com.example.ecommerce_store.service;

import com.example.ecommerce_store.entities.Product;
import com.example.ecommerce_store.repository.IProductRepository;
import com.example.ecommerce_store.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService {

    private IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public List<Product> search(String keyword) {
        return productRepository.search(keyword);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }

    @Override
    public List<Product> getProductList() {
        return productRepository.getProductList();
    }

    @Override
    public List<Product> getProductRandomList() {
        return productRepository.getProductRandomList();
    }
}
