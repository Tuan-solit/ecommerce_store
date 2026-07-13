package com.example.ecommerce_store.controller.user;

import com.example.ecommerce_store.entities.Cart;
import com.example.ecommerce_store.entities.Product;
import com.example.ecommerce_store.entities.User;
import com.example.ecommerce_store.service.IProductService;
import com.example.ecommerce_store.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/cart")
public class CartController extends HttpServlet {

    private IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        User user = (User) session.getAttribute("user");

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        req.getRequestDispatcher("/view/cart/cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String action = req.getParameter("action");

        switch (action) {
            case "add":
                addToCart(req, resp);
                break;
            case "update":
                updateCart(req, resp);
                break;
            case "delete":
                deleteCart(req, resp);
                break;
        }
    }

    private void addToCart(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        Product product = productService.findById(id);

        HttpSession session = req.getSession();

        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
        }

        cart.add(product);

        session.setAttribute("cart", cart);

        resp.sendRedirect(req.getHeader("Referer"));
    }

    private void updateCart(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        int quantity = Integer.parseInt(req.getParameter("quantity"));

        Cart cart = (Cart) req.getSession().getAttribute("cart");

        if (cart != null) {
            cart.update(id, quantity);
        }

        resp.sendRedirect(req.getContextPath() + "/cart");
    }

    private void deleteCart(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));

        Cart cart = (Cart) req.getSession().getAttribute("cart");

        if (cart != null) {
            cart.remove(id);
        }

        resp.sendRedirect(req.getContextPath() + "/cart");
    }
}
