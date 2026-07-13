package com.example.ecommerce_store.service;

import com.example.ecommerce_store.entities.Category;
import com.example.ecommerce_store.repository.CategoryRepository;
import com.example.ecommerce_store.repository.ICategoryRepository;

import java.util.List;

public class CategoryService implements ICategoryService{
    private ICategoryRepository categoryRepository = new CategoryRepository();

    @Override
    public List<Category> getCategoryList() {
        return categoryRepository.getCategoryList();
    }

    @Override
    public boolean add(Category category) {
        return categoryRepository.add(category);
    }

    @Override
    public boolean edit(Category category) {
        return categoryRepository.edit(category);
    }

    @Override
    public boolean delete(int id) {
        return categoryRepository.delete(id);
    }
}

