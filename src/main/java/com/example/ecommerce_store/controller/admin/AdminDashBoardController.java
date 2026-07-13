package com.example.ecommerce_store.controller.admin;

import com.example.ecommerce_store.service.CategoryService;
import com.example.ecommerce_store.service.ICategoryService;
import com.example.ecommerce_store.service.IProductService;
import com.example.ecommerce_store.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AdminDashBoardController", value = "/admin/dashboard")
public class AdminDashBoardController extends HttpServlet {
    private IProductService productService = new ProductService();
    private ICategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/component/admin/dashboard.jsp").forward(req,resp);
    }
}
