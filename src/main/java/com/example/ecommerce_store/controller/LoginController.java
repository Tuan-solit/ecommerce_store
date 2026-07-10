package com.example.ecommerce_store.controller;

import com.example.ecommerce_store.entities.User;
import com.example.ecommerce_store.service.IUserService;
import com.example.ecommerce_store.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/auth/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User user = userService.login(username, password);
        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            if ("admin".equals(user.getRole())) {
                resp.sendRedirect(req.getContextPath() + "/admin/product/list");
            } else {
                resp.sendRedirect(req.getContextPath() + "/home");
            }
        } else {
            req.setAttribute("message", "Sai tên đăng nhập hoặc mật khẩu");

            // Giữ lại username
            req.setAttribute("username", username);
            req.getRequestDispatcher("/view/auth/login.jsp").forward(req, resp);
        }
    }
}
