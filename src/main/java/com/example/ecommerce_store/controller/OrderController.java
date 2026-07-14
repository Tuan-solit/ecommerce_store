package com.example.ecommerce_store.controller;

import com.example.ecommerce_store.entities.Order;
import com.example.ecommerce_store.entities.OrderDetail;
import com.example.ecommerce_store.entities.User;
import com.example.ecommerce_store.service.IOderService;
import com.example.ecommerce_store.service.OderService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/orders")
public class OrderController extends HttpServlet {

    private final IOderService orderService = new OderService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        User user = (User) session.getAttribute("user");

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String action = req.getParameter("action");

        if (action == null) {
            action = "";
        }

        switch (action) {
            case "detail":
                showDetail(req, resp, user);
                break;
            default:
                showOrders(req, resp, user);
        }
    }

    private void showOrders(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {

        List<Order> orders = orderService.findByUser(user.getId());

        req.setAttribute("orders", orders);

        req.getRequestDispatcher("/view/order/orders.jsp").forward(req, resp);
    }

    private void showDetail(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {

        int orderId = Integer.parseInt(req.getParameter("id"));

        Order order = orderService.findById(orderId);

        List<OrderDetail> details = orderService.findByOrderDetail(orderId);

        req.setAttribute("details", details);
        req.setAttribute("order", order);

        req.getRequestDispatcher("/view/order/order-detail.jsp").forward(req, resp);
    }
}
