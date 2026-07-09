package com.example.ecommerce_store.service;

import com.example.ecommerce_store.entities.User;
import com.example.ecommerce_store.repository.IUserRepository;
import com.example.ecommerce_store.repository.UserRepository;

public class UserService implements IUserService{

    private IUserRepository userRepository = new UserRepository();

    @Override
    public User login(String username, String password) {
        return userRepository.login(username, password);
    }

    @Override
    public boolean register(User user) {
        return userRepository.register(user);
    }

    @Override
    public boolean existByUsername(String username) {
        return userRepository.existByUsername(username);
    }

    @Override
    public boolean existByEmail(String email) {
        return userRepository.existByEmail(email);
    }
}
