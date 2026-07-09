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
}

