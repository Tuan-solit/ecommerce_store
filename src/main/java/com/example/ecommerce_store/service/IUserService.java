package com.example.ecommerce_store.service;

import com.example.ecommerce_store.entities.User;

public interface IUserService {
    User login(String username, String password);
    boolean register(User user);
    boolean existByUsername(String username);
    boolean existByEmail(String email);
}
