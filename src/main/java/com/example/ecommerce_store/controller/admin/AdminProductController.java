package com.example.ecommerce_store.controller.admin;

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

@WebServlet(name = "AdminProductController",value = "/admin/product/list")
public class AdminProductController extends HttpServlet {
    IProductService productService = new ProductService();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> productList = productService.getProductList();
        req.setAttribute("productList",productList);
        req.getRequestDispatcher("/view/component/admin/product/list.jsp").forward(req,resp);
    }
}
