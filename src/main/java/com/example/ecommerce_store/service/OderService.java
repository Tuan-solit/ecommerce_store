package com.example.ecommerce_store.service;

import com.example.ecommerce_store.entities.Cart;
import com.example.ecommerce_store.entities.Order;
import com.example.ecommerce_store.entities.OrderDetail;
import com.example.ecommerce_store.entities.User;
import com.example.ecommerce_store.repository.IOrderRepository;
import com.example.ecommerce_store.repository.OrderRepository;

import java.util.List;

public class OderService implements IOderService{

    private IOrderRepository orderRepository = new OrderRepository();

    @Override
    public boolean checkout(User user, Cart cart, Order order) {
        return orderRepository.checkout(user, cart, order);
    }

    @Override
    public List<Order> findByUser(int userId) {
        return orderRepository.findByUser(userId);
    }

    @Override
    public List<OrderDetail> findByOrderDetail(int orderId) {
        return orderRepository.findByOrderDetail(orderId);
    }

    @Override
    public Order findById(int orderId) {
        return orderRepository.findById(orderId);
    }
}
