package com.example.ecommerce_store.controller.admin;

import com.example.ecommerce_store.entities.OrderDetail;
import com.example.ecommerce_store.entities.dto.OrderDTO;
import com.example.ecommerce_store.repository.IOrderRepository;
import com.example.ecommerce_store.repository.OrderRepository;
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

@WebServlet(name = "AdminOrderController", value = "/admin/order")
public class AdminOrderController extends HttpServlet {
    private IOderService oderService = new OderService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "detail":
                showDetail(req, resp);
                break;
            default:
                showList(req, resp);
        }
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) {
        try {
            List<OrderDTO> orderList = oderService.getOrderList();
            req.setAttribute("orderList", orderList);
            req.getRequestDispatcher("/view/component/admin/order/list.jsp").forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showDetail(HttpServletRequest req, HttpServletResponse resp) {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            OrderDTO orderDTO = oderService.getOrderById(id);
            List<OrderDetail> orderDetailList = oderService.findByOrderDetail(id);
            req.setAttribute("order", orderDTO);
            req.setAttribute("orderDetails", orderDetailList);
            req.getRequestDispatcher("/view/component/admin/order/detail.jsp").forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "update":
                updateStatus(req, resp);
                break;
            default:
        }
    }

    private void updateStatus(HttpServletRequest req, HttpServletResponse resp) {
        String status = req.getParameter("status");
        int id = Integer.parseInt(req.getParameter("orderId"));
        boolean isSuccess = oderService.updateStatus(id,status);
        if (isSuccess) {
            try {
                HttpSession session = req.getSession();
                session.setAttribute("message", "update_success");
                resp.sendRedirect(req.getContextPath() + "/admin/order");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            HttpSession session = req.getSession();
            session.setAttribute("message", "update_failed");
            try {
                resp.sendRedirect(req.getContextPath() + "/admin/order");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }

        }
    }
}

