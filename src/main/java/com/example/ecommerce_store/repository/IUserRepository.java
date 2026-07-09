package com.example.ecommerce_store.repository;

import com.example.ecommerce_store.entities.User;

public interface IUserRepository {
    User login(String username, String password);
    boolean register(User user);
    boolean existByUsername(String username);
    boolean existByEmail(String email);
}
