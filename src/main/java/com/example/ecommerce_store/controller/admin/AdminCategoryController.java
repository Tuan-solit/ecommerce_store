package com.example.ecommerce_store.controller.admin;

import com.example.ecommerce_store.entities.Category;
import com.example.ecommerce_store.service.CategoryService;
import com.example.ecommerce_store.service.ICategoryService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminCategoryController", value ="/admin/category/list")
public class AdminCategoryController extends HttpServlet {
    private ICategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action ==null){
            action ="";
        }
        switch (action){
            case "add":
                
                break;
            case "edit":
                
                break;
            case "search":
                
                break;
            default:
                showList(req,resp);
        }
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) {
        List<Category> categoryList = categoryService.getCategoryList();
        req.setAttribute("categoryList",categoryList);
        try {
            req.getRequestDispatcher("/view/component/admin/category/list.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
