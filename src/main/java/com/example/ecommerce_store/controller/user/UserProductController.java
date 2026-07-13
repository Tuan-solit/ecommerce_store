package com.example.ecommerce_store.controller.user;

import com.example.ecommerce_store.entities.Product;
import com.example.ecommerce_store.service.IProductService;
import com.example.ecommerce_store.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class UserProductController extends HttpServlet {

    private IProductService productService = new ProductService();

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
            case "search":
                search(req, resp);
                break;
            default:
                resp.sendRedirect(req.getContextPath() + "/home");
                break;
        }
    }

    private void showHome(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("products", productService.findAll());
        req.getRequestDispatcher("/view/home.jsp").forward(req, resp);
    }

    private void search(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String keyword = req.getParameter("keyword");

        if (keyword == null) {
            keyword = "";
        }

        List<Product> products = productService.search(keyword);

        req.setAttribute("products", products);
        req.setAttribute("keyword", keyword);

        req.getRequestDispatcher("/view/home.jsp").forward(req, resp);
     }

    private void showDetail(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        req.setAttribute("product", product);
        req.getRequestDispatcher("/view/product/detail.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        }
}
