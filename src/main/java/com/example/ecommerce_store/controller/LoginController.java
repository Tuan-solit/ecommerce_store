package com.example.ecommerce_store.controller;

import com.example.ecommerce_store.entities.User;
import com.example.ecommerce_store.service.IUserService;
import com.example.ecommerce_store.service.UserService;
import com.example.ecommerce_store.utils.Validate;
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

        req.setAttribute("username", username);
        boolean hasError = false;

        if (username.isEmpty()) {
            req.setAttribute("usernameError", "Tên đăng nhập không được để trống");
            hasError = true;
        } else if (!Validate.isUsername(username)) {
            req.setAttribute("usernameError", "Tên đăng nhập phải từ 4-20 ký tự");
            hasError = true;
        }

        if (password.isEmpty()) {
            req.setAttribute("passwordError", "Mật khẩu không được để trống");
            hasError = true;
        } else if (!Validate.isPassword(password)) {
            req.setAttribute("passwordError", "Mật khẩu phải có ít nhất 6 ký tự");
            hasError = true;
        }

        if (hasError) {
            req.getRequestDispatcher("/view/auth/login.jsp").forward(req, resp);
            return;
        }

        User user = userService.login(username, password);
        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);

            //Flash Message
            session.setAttribute("successMessage", "Đăng nhập thành công");

            resp.sendRedirect(req.getContextPath() + "/home");
        } else {
            req.setAttribute("loginError", "Sai tên đăng nhập hoặc mật khẩu");

            // Giữ lại username
            req.setAttribute("username", username);
            req.getRequestDispatcher("/view/auth/login.jsp").forward(req, resp);
        }
    }
}
