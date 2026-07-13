package com.example.ecommerce_store.controller.admin;

import com.example.ecommerce_store.entities.Category;
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

@WebServlet(name = "AdminCategoryController", value = "/admin/category")
public class AdminCategoryController extends HttpServlet {
    private ICategoryService categoryService = new CategoryService();
    private IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
//                
                break;
            case "edit":
//                
                break;
            case "search":
//                
                break;
            default:
                showList(req, resp);
        }
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) {
        List<Category> categoryList = categoryService.getCategoryList();
        req.setAttribute("categoryList", categoryList);
        try {
            req.getRequestDispatcher("/view/component/admin/category/list.jsp").forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                save(req, resp);
                break;
            case "delete":
                delete(req, resp);
                break;
            case "edit":
                edit(req,resp);
                break;
            default:
                showList(req, resp);
        }
    }

    private void edit(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        Category category = new Category(id,name);
        boolean isSuccess = categoryService.edit(category);
        if (isSuccess) {
            try {
                HttpSession session = req.getSession();
                session.setAttribute("message", "update_success");
                resp.sendRedirect(req.getContextPath() + "/admin/category");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            HttpSession session = req.getSession();
            session.setAttribute("message", "update_failed");
            req.setAttribute("category", category);
            try {
                resp.sendRedirect(req.getContextPath() + "/admin/category");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }

        }
    }
    private void save(HttpServletRequest req, HttpServletResponse resp) {
        String name = req.getParameter("name");
        Category category = new Category(name);
        boolean isSuccess = categoryService.add(category);
        if (isSuccess) {
            try {
                HttpSession session = req.getSession();
                session.setAttribute("message", "insert_success");
                resp.sendRedirect(req.getContextPath() + "/admin/category");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            HttpSession session = req.getSession();
            session.setAttribute("message", "insert_failed");
            req.setAttribute("category", category);
            try {
                    resp.sendRedirect(req.getContextPath() + "/admin/category");             
            } catch (IOException e) {
                throw new RuntimeException(e);
            }

        }
    }


private void delete(HttpServletRequest req, HttpServletResponse resp) {
    int id = Integer.parseInt(req.getParameter("id"));
    int productCount = productService.countProductByCategoryId(id);
    if (productCount > 0) {
        HttpSession session = req.getSession();
        session.setAttribute("deleteError", "Không thể xóa danh mục này do đang có " + productCount + " sản phẩm trực thuộc!");
        try {
            resp.sendRedirect(req.getContextPath() + "/admin/category");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    } else {
        boolean isDelete = categoryService.delete(id);
        if (isDelete) {
            try {
                HttpSession session = req.getSession();
                session.setAttribute("message", "delete_success");
                resp.sendRedirect(req.getContextPath() + "/admin/category");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            try {
                HttpSession session = req.getSession();
                session.setAttribute("message", "delete_failed");
                resp.sendRedirect(req.getContextPath() + "/admin/category");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
}
