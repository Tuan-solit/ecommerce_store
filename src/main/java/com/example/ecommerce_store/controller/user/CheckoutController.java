package com.example.ecommerce_store.controller.user;

import com.example.ecommerce_store.entities.Cart;
import com.example.ecommerce_store.entities.Order;
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

@WebServlet("/checkout")
public class CheckoutController extends HttpServlet {

    IOderService oderService = new OderService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        User user = (User) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("cart");

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        if (cart == null || cart.getItems().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/cart");
        }

        req.setAttribute("user", user);

        req.getRequestDispatcher("/view/order/checkout.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        User user = (User) session.getAttribute("user");
        Cart cart = (Cart) session.getAttribute("cart");

        // Chưa đăng nhập hoặc giỏ hàng rỗng
        if (user == null || cart == null || cart.getItems().isEmpty()) {
            resp.sendRedirect(req.getContextPath() + "/cart");
            return;
        }

        // Lấy thông tin giao hàng
        String receiverName = req.getParameter("receiverName");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String note = req.getParameter("note");

        // Kiểm tra dữ liệu
        boolean hasError = false;

        if (receiverName == null || receiverName.trim().isEmpty()) {
            req.setAttribute("receiverNameError", "Tên người nhận không được để trống");
            hasError = true;
        }

        if (phone == null || phone.trim().isEmpty()) {
            req.setAttribute("phoneError", "Số điện thoại không được để trống");
            hasError = true;
        }

        if (address == null || address.trim().isEmpty()) {
            req.setAttribute("addressError", "Địa chỉ không được để trống");
            hasError = true;
        }

        //Giữ lại dữ liệu nếu có lỗi
        req.setAttribute("receiverName", receiverName);
        req.setAttribute("phone", phone);
        req.setAttribute("address", address);
        req.setAttribute("note", note);

        if (hasError) {
            req.getRequestDispatcher("/view/order/checkout.jsp").forward(req, resp);
            return;
        }

        // Tạo order
        Order order = new Order();

        order.setReceiverName(receiverName);
        order.setPhone(phone);
        order.setAddress(address);
        order.setNote(note);

        // Thanh toán
        boolean success = oderService.checkout(user, cart, order);

        if (success) {

            // Xóa giỏ hàng
            session.removeAttribute("cart");

            // Flash Message
            session.setAttribute("successMessage", "Đặt hàng thành công!");

            resp.sendRedirect(req.getContextPath() + "/home");

        } else {

            req.setAttribute("error",
                    "Đặt hàng thất bại. Có thể sản phẩm đã hết hàng.");

            req.getRequestDispatcher("/view/order/checkout.jsp")
                    .forward(req, resp);

        }
    }
}
