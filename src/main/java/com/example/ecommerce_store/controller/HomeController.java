package com.example.ecommerce_store.controller;

import com.example.ecommerce_store.entities.Product;
import com.example.ecommerce_store.service.CategoryService;
import com.example.ecommerce_store.service.ICategoryService;
import com.example.ecommerce_store.service.IProductService;
import com.example.ecommerce_store.service.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController",value = "/home")
public class HomeController extends HttpServlet {
    private IProductService productService = new ProductService();
    private ICategoryService categoryService = new CategoryService();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();

        if (session != null) {
            String successMessage = (String) session.getAttribute("successMessage");
            if (successMessage != null) {
                req.setAttribute("successMessage", successMessage);
                session.removeAttribute("successMessage");
            }
        }

        List<Product> randomProducts = productService.getProductRandomList();
        req.setAttribute("randomProducts",randomProducts);
        req.getRequestDispatcher("/view/home.jsp").forward(req,resp);
    }
}
