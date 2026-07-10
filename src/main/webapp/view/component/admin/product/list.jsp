<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<html>

<head>

  <c:import url="../library.jsp"/>

</head>

<body>

<div class="container-fluid">

  <div class="row">

    <c:import url="../sidebar.jsp"/>

    <div class="col-md-10 content">

      <c:import url="../navbar.jsp"/>

      <div class="card mt-4 shadow">

        <div class="card-header bg-white">

          <div class="d-flex justify-content-between">

            <h4>

              Product Management

            </h4>

            <a href="/product?action=add"
               class="btn btn-success">

              <i class="fa-solid fa-plus"></i>

              Add Product

            </a>

          </div>

        </div>

        <div class="card-body">

          <div class="row mb-3">

            <div class="col-md-4">

              <input type="text"
                     class="form-control"
                     placeholder="Search product...">

            </div>

          </div>

          <table class="table table-hover align-middle">

            <thead>

            <tr>

              <th>#</th>

              <th>ID</th>

              <th>Name</th>
              
              <th>Category</th>

              <th>Price</th>

              <th>Created At</th>
              
              <th>Status</th>

              <th>Action</th>

            </tr>

            </thead>

            <tbody>

            <c:forEach items="${productList}"
                       var="product"
                       varStatus="status">

              <tr>

                <td>${status.count}</td>

                <td>${product.productCode}</td>

                <td>${product.name}</td>
                
                <td>${product.category.name}</td>

                <td><fmt:formatNumber value="${product.price}" maxFractionDigits="0"/> đ</td>

                <td>${product.created}</td>
                
                <td>${product.active?"Published":"Inactive"}</td>

                <td>

                  <a class="btn btn-warning btn-sm">

                    <i class="fa-solid fa-pen"></i>

                  </a>

                  <button class="btn btn-danger btn-sm">

                    <i class="fa-solid fa-trash"></i>

                  </button>

                </td>

              </tr>

            </c:forEach>

            </tbody>

          </table>

        </div>

      </div>

    </div>

  </div>

</div>

</body>

</html>
