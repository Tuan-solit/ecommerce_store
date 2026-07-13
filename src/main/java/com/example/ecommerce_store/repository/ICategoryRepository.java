package com.example.ecommerce_store.repository;

import com.example.ecommerce_store.entities.Category;

import java.util.List;

public interface ICategoryRepository {
    List<Category> getCategoryList();
    boolean add(Category category);
    boolean edit(Category category);
    boolean delete(int id);
}
