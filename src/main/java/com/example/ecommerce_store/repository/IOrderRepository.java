package com.example.ecommerce_store.repository;

import com.example.ecommerce_store.entities.Cart;
import com.example.ecommerce_store.entities.Order;
import com.example.ecommerce_store.entities.OrderDetail;
import com.example.ecommerce_store.entities.User;
import com.example.ecommerce_store.entities.dto.OrderDTO;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Or;

import java.util.List;

public interface IOrderRepository {
    boolean checkout(User user, Cart cart, Order order);
    List<Order> findByUser(int userId);
    List<OrderDetail> findByOrderDetail(int orderId);
    Order findById(int orderId);
    List<OrderDTO> getOrderList();
    OrderDTO getOrderById(int id);
    boolean updateStatus(int id, String status);
}
