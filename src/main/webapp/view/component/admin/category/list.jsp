<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

                        <button class="btn btn-success"
                                data-bs-toggle="modal"
                                data-bs-target="#addCategoryModal">

                            <i class="fa-solid fa-plus"></i>

                            Add Category

                        </button>

                    </div>

                </div>

                <div class="card-body">

                    <div class="row mb-3">

                        <div class="col-md-5">

                            <form action="/admin/category?action=search" method="get">

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
                                    <button class="btn btn-warning btn-sm"
                                            onclick="openEditModal('${category.id}',
                                                    '${category.name}')"
                                            data-bs-toggle="modal"
                                            data-bs-target="#editCategoryModal">

                                        <i class="fa-solid fa-pen"></i>
                                    </button>
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
<c:if test="${not empty sessionScope.message}">

    <c:set var="toastClass" value="text-bg-success"/>
    <c:if test="${fn:contains(sessionScope.message, 'failed')}">
        <c:set var="toastClass" value="text-bg-danger"/>
    </c:if>

    <div class="toast-container position-fixed top-0 end-0 p-3">

        <div id="successToast"
             class="toast ${toastClass} border-0">

            <div class="d-flex">

                <div class="toast-body">

                    <c:choose>
                        <c:when test="${sessionScope.message == 'insert_success'}">
                            Thêm mới danh mục thành công!
                        </c:when>
                        <c:when test="${sessionScope.message == 'update_success'}">
                            Cập nhật danh mục thành công!
                        </c:when>
                        <c:when test="${sessionScope.message == 'insert_failed'}">
                            Thêm mới danh mục thất bại!
                        </c:when>
                        <c:when test="${sessionScope.message == 'update_failed'}">
                            Cập nhật danh mục thất bại!
                        </c:when>
                        <c:when test="${sessionScope.message == 'delete_success'}">
                            Xóa danh mục thành công!
                        </c:when>
                        <c:when test="${sessionScope.message == 'delete_failed'}">
                            Xóa danh mục thất bại!
                        </c:when>
                        <c:otherwise>
                            ${sessionScope.message}
                        </c:otherwise>
                    </c:choose>

                </div

                <button
                        type="button"
                        class="btn-close btn-close-white me-2 m-auto"
                        data-bs-dismiss="toast">
                </button>
                <c:remove var="message" scope="session"/>

            </div>

        </div>

    </div>
</c:if>

<!-- Edit Category Modal -->
<div class="modal fade"
     id="editCategoryModal"
     tabindex="-1">

    <div class="modal-dialog modal-dialog-centered">

        <div class="modal-content">

            <form action="/admin/category?action=edit"
                  method="post">

                <div class="modal-header">

                    <h5 class="modal-title">

                        <i class="fa-solid fa-pen"></i>

                        Cập nhật danh mục

                    </h5>

                    <button class="btn-close"
                            data-bs-dismiss="modal">
                    </button>

                </div>

                <div class="modal-body">

                    <input type="hidden"
                           id="editId"
                           name="id">

                    <div class="mb-3">

                        <label class="form-label">

                            Tên danh mục

                        </label>

                        <input type="text"
                               id="editName"
                               class="form-control"
                               name="name"
                               required>

                    </div>

                </div>

                <div class="modal-footer">

                    <button type="button"
                            class="btn btn-secondary"
                            data-bs-dismiss="modal">

                        Hủy

                    </button>

                    <button type="submit"
                            class="btn btn-warning text-white">

                        <i class="fa-solid fa-pen"></i>

                        Cập nhật

                    </button>

                </div>

            </form>

        </div>

    </div>

</div>

<!-- Add Category Modal -->
<div class="modal fade"
     id="addCategoryModal"
     tabindex="-1">

    <div class="modal-dialog modal-dialog-centered">

        <div class="modal-content">

            <form action="/admin/category?action=add"
                  method="post">

                <div class="modal-header">

                    <h5 class="modal-title">

                        <i class="fa-solid fa-layer-group"></i>

                        Thêm danh mục

                    </h5>

                    <button class="btn-close"
                            data-bs-dismiss="modal">
                    </button>

                </div>

                <div class="modal-body">

                    <div class="mb-3">

                        <label class="form-label">

                            Tên danh mục

                        </label>

                        <input type="text"
                               class="form-control"
                               name="name"
                               placeholder="Nhập tên danh mục..."
                               required>

                    </div>

                </div>

                <div class="modal-footer">

                    <button type="button"
                            class="btn btn-secondary"
                            data-bs-dismiss="modal">

                        Hủy

                    </button>

                    <button type="submit"
                            class="btn btn-success">

                        <i class="fa-solid fa-floppy-disk"></i>

                        Lưu

                    </button>

                </div>

            </form>

        </div>

    </div>

</div>

<div class="modal fade" id="deleteModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/admin/category?action=delete" method="post">
                <div class="modal-header bg-warning text-dark">
                    <h5 class="modal-title">Xác nhận xóa danh mục</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="deleteCategoryId" name="id">
                    Bạn có chắc chắn muốn xóa danh mục <b id="deleteCategoryName" class="text-danger"></b> không?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-danger">Xác nhận</button>
                </div>
            </form>
        </div>
    </div>
</div>
<c:if test="${not empty sessionScope.deleteError}">
    <div class="modal fade" id="errorModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title"><i class="fa-solid fa-triangle-exclamation me-2"></i>Lỗi vi phạm nghiệp
                        vụ</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body text-center py-4">
                    <p class="fs-5 text-dark fw-bold">${sessionScope.deleteError}</p>
                    <p class="text-muted small mb-0">Vui lòng xóa hoặc di chuyển các sản phẩm thuộc danh mục này
                        trước khi thực hiện lại.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                </div>
            </div>
        </div>
    </div>

    <c:remove var="deleteError" scope="session"/>
</c:if>
<script>
    function openEditModal(id, name) {

        document.getElementById("editId").value = id;

        document.getElementById("editName").value = name;

    }

    function deleteCategory(id, name) {

        document.getElementById("deleteCategoryId").value = id;

        document.getElementById("deleteCategoryName").innerHTML = name;

    }

    document.addEventListener("DOMContentLoaded", function () {
        let toastElement = document.getElementById("successToast");
        if (toastElement) {
            let toast = new bootstrap.Toast(toastElement, {delay: 3000});
            toast.show();
        }

        let errorModalElement = document.getElementById('errorModal');
        if (errorModalElement) {
            let bootstrapErrorModal = new bootstrap.Modal(errorModalElement);
            bootstrapErrorModal.show();
        }
    });
</script>

</body>

</html>

