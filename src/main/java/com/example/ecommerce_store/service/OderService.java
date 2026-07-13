package com.example.ecommerce_store.service;

import com.example.ecommerce_store.entities.Cart;
import com.example.ecommerce_store.entities.Order;
import com.example.ecommerce_store.entities.User;
import com.example.ecommerce_store.repository.IOrderRepository;
import com.example.ecommerce_store.repository.OrderRepository;

public class OderService implements IOderService{

    private IOrderRepository orderRepository = new OrderRepository();

    @Override
    public boolean checkout(User user, Cart cart, Order order) {
        return orderRepository.checkout(user, cart, order);
    }
}
