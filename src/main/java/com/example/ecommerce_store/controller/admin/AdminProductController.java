package com.example.ecommerce_store.controller.admin;

import com.example.ecommerce_store.entities.Category;
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

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminProductController",value = "/admin/product/list")
public class AdminProductController extends HttpServlet {
    IProductService productService = new ProductService();
    ICategoryService categoryService = new CategoryService();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action ==null){
            action ="";
        }
        switch (action){
            case "add":
                showAddForm(req,resp);
                break;
            case "edit":
                showEditForm(req,resp);
                break;
            case "search":
                search(req,resp);
                break;
            default:
                showList(req,resp);
        }
    }

    private void search(HttpServletRequest req, HttpServletResponse resp) {
        String keyword = req.getParameter("keyword");
        if (keyword == null) {
            keyword = "";
        }
        List<Product> filteredProducts = productService.search(keyword.trim());
        req.setAttribute("productList", filteredProducts);
        req.setAttribute("oldKeyword", keyword);
        try {
            req.getRequestDispatcher("/view/component/admin/product/list.jsp").forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            Product product = productService.findById(id);
            List<Category> categoryList = categoryService.getCategoryList();
            req.setAttribute("product", product);
            req.setAttribute("categoryList", categoryList);
            req.getRequestDispatcher("/view/component/admin/product/edit.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) {
        List<Product> productList = productService.getProductList();
        req.setAttribute("productList",productList);
        try {
            req.getRequestDispatcher("/view/component/admin/product/list.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showAddForm(HttpServletRequest req, HttpServletResponse resp) {
        try {
            List<Category> categoryList = categoryService.getCategoryList();
            req.setAttribute("categoryList", categoryList);
            req.getRequestDispatcher("/view/component/admin/product/add.jsp").forward(req,resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action ==null){
            action ="";
        }
        switch (action){
            case "add":
                save(req,resp);
                break;
            case "edit":
                editInfo(req,resp);
                break;
            case "delete":
                inActive(req,resp);
                break;
            default:
        }
    }

    private void inActive(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("productId"));
        boolean isSuccess = productService.delete(id);

        if (isSuccess) {
            try {
                resp.sendRedirect(req.getContextPath() + "/admin/product/list");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            try {
                resp.sendRedirect(req.getContextPath() + "/admin/product/list?error=true");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void editInfo(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String productCode = req.getParameter("productCode");
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        String description = req.getParameter("description");
        String image = req.getParameter("image");
        String status = req.getParameter("status");
        boolean isActive = "1".equals(status);
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        Category category = new Category();
        category.setId(categoryId);
        Product product = new Product(id,productCode,name,price,quantity,description,image,isActive,category);
        boolean isSuccess = productService.edit(product);
        if (isSuccess) {
            try {
                resp.sendRedirect(req.getContextPath() + "/admin/product/list");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            req.setAttribute("message", "Cập nhật sản phẩm thất bại!");
            req.setAttribute("product", product);
            try {
                req.getRequestDispatcher("/view/component/admin/product/edit.jsp").forward(req, resp);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private void save(HttpServletRequest req, HttpServletResponse resp) {
        String productCode = req.getParameter("productCode");
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        String description = req.getParameter("description");
        String image = req.getParameter("image");
        String status = req.getParameter("status");
        boolean isActive = "1".equals(status);
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        Category category = new Category();
        category.setId(categoryId);
        Product product = new Product(productCode,name,price,quantity,description,image,isActive,category);
        boolean isSuccess = productService.add(product);
        if (isSuccess) {
            try {
                resp.sendRedirect(req.getContextPath() + "/admin/product/list");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } else {
            req.setAttribute("message", "Tạo sản phẩm thất bại!");
            req.setAttribute("product", product);
            try {
                req.getRequestDispatcher("/view/admin/product/add.jsp").forward(req, resp);
            } catch (ServletException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
