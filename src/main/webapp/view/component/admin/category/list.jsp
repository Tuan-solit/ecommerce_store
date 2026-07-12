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

                            Category Management

                        </h4>

                        <a href="/admin/category/list?action=add"
                           class="btn btn-success">

                            <i class="fa-solid fa-plus"></i>

                            Add Category

                        </a>

                    </div>

                </div>

                <div class="card-body">

                    <div class="row mb-3">

                        <div class="col-md-5">

                            <form action="/admin/category/list?action=search" method="get">

                                <div class="input-group">

                                    <input
                                            type="text"
                                            class="form-control"
                                            name="keyword"
                                            value="${oldKeyword}"
                                            placeholder="Nhập tên danh mục...">

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

                            <th>Name</th>

                            <th>Action</th>

                        </tr>

                        </thead>

                        <tbody>

                        <c:forEach items="${categoryList}"
                                   var="category"
                                   varStatus="status">

                            <tr>

                                <td>${status.count}</td>
                                <td>
                                    <div class="fw-bold text-dark">${category.name}</div>
                                </td>
                                <td>
                                    <a href="/admin/category/list?action=edit&id=${category.id}"
                                       class="btn btn-outline-warning btn-sm">

                                        <i class="fa-solid fa-pen"></i>

                                    </a>
                                    <button class="btn btn-outline-secondary btn-sm"
                                            data-bs-toggle="modal"
                                            data-bs-target="#deleteModal"
                                            onclick="deleteCategory('${category.id}', '${category.name}')">
                                        <i class="fa-solid fa-trash"></i>
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
            <form action="/admin/category/list?action=delete" method="post">
                <div class="modal-header">
                    <h5>Xóa danh mục sản phẩm</h5>
                </div>

                <div class="modal-body">
                    <input type="hidden" id="statusProductId" name="productId">
                    Bạn có chắc chắn muốn xóa <b id="statusActionText" class="text-primary"></b> sản phẩm
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
    function deleteCategory(id,name){

        document.getElementById("deleteId").value=id;

        document.getElementById("deleteName").innerHTML=name;

    }
</script>

</body>

</html>

