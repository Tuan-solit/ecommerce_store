<%@ page import="com.example.ecommerce_store.service.ICategoryService" %>
<%@ page import="com.example.ecommerce_store.service.CategoryService" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.ecommerce_store.entities.Category" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <c:import url="/view/layout/library.jsp"/>
</head>
<body>
<%--<%--%>
<%--    ICategoryService categoryService = new CategoryService();--%>
<%--    List<Category> categoryList = categoryService.getCategoryList();--%>
<%--    pageContext.setAttribute("categoryList", categoryList);--%>
<%--%>--%>
<div class="card sidebar-card">

    <div class="card-header bg-primary text-white">
        <i class="fas fa-list"></i>
        DANH MỤC SẢN PHẨM
    </div>

    <div class="list-group list-group-flush">

        <c:forEach items="${categoryList}" var="category">
            
        <a href="#" class="list-group-item list-group-item-action">
            <i class="${category.icon}"></i>
            ${category.name}
        </a>
        </c:forEach>

    </div>

</div>
</body>
</html>
