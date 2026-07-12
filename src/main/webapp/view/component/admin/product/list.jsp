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

            <a href="/admin/product/list?action=add"
               class="btn btn-success">

              <i class="fa-solid fa-plus"></i>

              Add Product

            </a>

          </div>

        </div>

        <div class="card-body">

            <div class="row mb-3">

                <div class="col-md-5">

                    <form action="/admin/product/list?action=search" method="get">
                        
                        <div class="input-group">

                            <input
                                    type="text"
                                    class="form-control"
                                    name="keyword"
                                    value="${oldKeyword}"
                                    placeholder="Nhập tên sản phẩm...">

                            <button
                                    class="btn btn-primary">

                                <i class="fa-solid fa-magnifying-glass"></i>

                            </button>

                        </div>

                    </form>

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

                <td>
                  <div class="d-flex align-items-center">
                    <img src="${product.image}"
                         class="product-img-thumb me-3"
                         alt="${product.name}">

                    <div>
                      <div class="fw-bold text-dark">${product.name}</div>
                      <small class="text-muted">(${product.quantity})</small>
                    </div>
                  </div>
                </td>
                
                <td>${product.category.name}</td>

                <td><fmt:formatNumber value="${product.price}" maxFractionDigits="0"/> đ</td>

                <td>${product.created}</td>
                
                <td>${product.active?"Published":"Inactive"}</td>

                  <td>

                      <a href="/admin/product/list?action=edit&id=${product.id}"
                         class="btn btn-outline-warning btn-sm">

                          <i class="fa-solid fa-pen"></i>

                      </a>
                      <button class="btn btn-outline-secondary btn-sm"
                              data-bs-toggle="modal"
                              data-bs-target="#statusModal"
                              onclick="toggleStatusProduct('${product.id}', '${product.name}', ${product.active})">
                          <i class="fa-solid fa-toggle-on"></i>
                      </button>

                  </td>

              </tr>

            </c:forEach>

            </tbody>

          </table>

        </div>

      </div>
        <c:import url="/view/component/pagination.jsp"/>

    </div>

  </div>

</div>
<div class="modal fade" id="statusModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/admin/product/list?action=delete" method="post">
                <div class="modal-header">
                    <h5>Thay đổi trạng thái sản phẩm</h5>
                </div>

                <div class="modal-body">
                    <input type="hidden" id="statusProductId" name="productId">
                    Bạn có chắc chắn muốn <b id="statusActionText" class="text-primary"></b> sản phẩm
                    <b id="statusProductName"></b> không?
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-primary">Xác nhận</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function toggleStatusProduct(id, name, isActive) {
        document.getElementById('statusProductId').value = id;
        document.getElementById('statusProductName').innerText = name;
        if (isActive === true) {
            document.getElementById('statusActionText').innerText = "TẠM ẨN (Ngừng kích hoạt)";
            document.getElementById('statusActionText').className = "text-danger";
        } else {
            document.getElementById('statusActionText').innerText = "KÍCH HOẠT (Mở bán lại)";
            document.getElementById('statusActionText').className = "text-success";
        }
    }
</script>

</body>

</html>
