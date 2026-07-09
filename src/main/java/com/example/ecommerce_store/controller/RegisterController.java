package com.example.ecommerce_store.controller;

import com.example.ecommerce_store.entities.User;
import com.example.ecommerce_store.service.IUserService;
import com.example.ecommerce_store.service.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegisterController extends HttpServlet {

    private IUserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/auth/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullName = req.getParameter("fullName");
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {
            req.setAttribute("message", "Mật khẩu xác nhận không khớp");

            req.setAttribute("fullName", fullName);
            req.setAttribute("username", username);
            req.setAttribute("email", email);
            req.setAttribute("phone", phone);

            req.getRequestDispatcher("/view/auth/register.jsp").forward(req, resp);
            return;
        }

        if (userService.existByUsername(username)) {
            req.setAttribute("message", "Tên đăng nhập đã tồn tại");

            req.setAttribute("fullName", fullName);
            req.setAttribute("username", username);
            req.setAttribute("email", email);
            req.setAttribute("phone", phone);
            req.getRequestDispatcher("/view/auth/register.jsp").forward(req, resp);
            return;
        }

        if (userService.existByEmail(email)) {
            req.setAttribute("message", "Email đã tồn tại");

            req.setAttribute("fullName", fullName);
            req.setAttribute("username", username);
            req.setAttribute("email", email);
            req.setAttribute("phone", phone);
            req.getRequestDispatcher("/view/auth/register.jsp").forward(req, resp);
            return;
        }

        User user = new User();

        user.setFullName(fullName);
        user.setUserName(username);
        user.setEmail(email);
        user.setPhone(phone);
        user.setPassWord(password);

        if (userService.register(user)) {
            resp.sendRedirect(req.getContextPath() + "/login?success=1");
        } else {
            req.setAttribute("message", "Đăng ký thất bại");
            req.getRequestDispatcher("/view/auth/register.jsp").forward(req, resp);
        }
    }
}
