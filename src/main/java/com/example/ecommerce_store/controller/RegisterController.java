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
        String fullName = req.getParameter("fullName").trim();
        String username = req.getParameter("username").trim();
        String email = req.getParameter("email").trim();
        String phone = req.getParameter("phone").trim();
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        //Giữ lại dữ liệu người dùng đã nhập
        req.setAttribute("fullName", fullName);
        req.setAttribute("username", username);
        req.setAttribute("email", email);
        req.setAttribute("phone", phone);

        boolean hasError = false;

        //Validate họ tên
        if (!Validate.isFullName(fullName)) {
            req.setAttribute("fullNameError", "Họ tên phải từ 2-50 ký tự, chỉ gồm chữ cái và khoảng trắng");
            hasError = true;
        }

       //Validate username
        if (!Validate.isUsername(username)) {
            req.setAttribute("usernameError", "Tên đăng nhập phải từ 4-20 ký tự, chỉ gồm chữ, số, dấu . _ -");
            hasError = true;
        } else if (userService.existByUsername(username)) {
            req.setAttribute("usernameError", "Tên đăng nhập đã tồn tại");
            hasError = true;
        }

        //Validate email
        if (!Validate.isEmail(email)) {
            req.setAttribute("emailError", "Email không đúng định dạng");
            hasError = true;
        } else if (userService.existByEmail(email)) {
            req.setAttribute("emailError", "Email đã tồn tại");
            hasError = true;
        }

        //Validate SĐT
        if (!Validate.isPhone(phone)) {
            req.setAttribute("phoneError", "Số điện thoại không hợp lệ");
            hasError = true;
        }

        //Validate password
        if (!Validate.isPassword(password)) {
            req.setAttribute("passwordError", "Mật khẩu phải có ít nhất 6 ký tự");
            hasError = true;
        }

        //Validate confirm password
        if (!password.equals(confirmPassword)) {
            req.setAttribute("confirmPasswordError", "Mật khẩu xác nhận không khớp");
            hasError = true;
        }

        //Có lỗi thì quay lại form
        if (hasError) {
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
            req.setAttribute("registerError", "Đăng ký thất bại, vui lòng thử lại");
            req.getRequestDispatcher("/view/auth/register.jsp").forward(req, resp);
        }
    }
}
