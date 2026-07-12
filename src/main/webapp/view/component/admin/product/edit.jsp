<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<html>

<head>

    <title>Sửa thông tin sản phẩm</title>

    <c:import url="../library.jsp"/>

</head>

<body>

<div class="container-fluid">

    <div class="row">

        <c:import url="../sidebar.jsp"/>

        <div class="col-md-10 content">

            <c:import url="../navbar.jsp"/>

            <div class="card shadow mt-4">

                <div class="card-header">

                    <h3>

                        <i class="fa-solid fa-box"></i>

                        Sửa thông tin sản phẩm

                    </h3>

                </div>

                <div class="card-body">

                    <form action="/admin/product/list?action=edit"

                          method="post">

                        <div class="row">

                            <div class="col-md-6 mb-3">
                                <input

                                        type="hidden"

                                        name="id"

                                        value="${product.id}">
                                

                                <label>Mã sản phẩm</label>

                                <input

                                        class="form-control"

                                        name="productCode"

                                        value="${product.productCode}">

                            </div>

                            <div class="col-md-6 mb-3">

                                <label>Tên sản phẩm</label>

                                <input

                                        class="form-control"

                                        name="name"

                                        value="${product.name}">

                            </div>

                        </div>

                        <div class="row">

                            <div class="col-md-4 mb-3">

                                <label>Danh mục</label>

                                <select

                                        class="form-select"

                                        name="categoryId">

                                    <c:forEach items="${categoryList}" var="category">
                                        <option

                                                value="${category.id}"

                                            ${category.id==product.category.id?'selected':''}>

                                                ${category.name}

                                        </option>
                                    </c:forEach>

                                </select>

                            </div>

                            <div class="col-md-4 mb-3">

                                <label>Giá</label>

                                <input

                                        class="form-control"

                                        type="number"

                                        name="price"

                                        value="<fmt:formatNumber value="${product.price}" maxFractionDigits="0" groupingUsed="false"/>">

                            </div>

                            <div class="col-md-4 mb-3">

                                <label>Số lượng</label>

                                <input

                                        type="number"

                                        class="form-control"

                                        name="quantity"

                                        value="${product.quantity}">

                            </div>

                        </div>

                        <div class="mb-3">

                            <label>Hình ảnh</label>

                            <input

                                    class="form-control"

                                    type="text"

                                    name="image"
                                    
                                    value="${product.image}">

                        </div>

                        <div class="mb-3">

                            <img

                                    id="preview"

                                    class="img-thumbnail"

                                    style="width:220px;display:none;">

                        </div>

                        <div class="mb-3">

                            <label>Mô tả</label>

                            <textarea

                                    rows="5"

                                    class="form-control"

                                    name="description">${product.description}</textarea>

                        </div>

                        <div class="mb-4">

                            <label>Trạng thái</label>

                            <br>

                            <div class="form-check form-check-inline">

                                <input

                                        checked

                                        class="form-check-input"

                                        type="radio"

                                        name="status"

                                        value="1"

                                ${product.active?'checked':''}>

                                <label class="form-check-label">

                                    Đang bán

                                </label>

                            </div>

                            <div class="form-check form-check-inline">

                                <input

                                        class="form-check-input"

                                        type="radio"

                                        name="status"

                                        value="0"

                                ${!product.active?'checked':''}>

                                <label class="form-check-label">

                                    Ngừng bán

                                </label>

                            </div>

                        </div>

                        <button

                                class="btn btn-success">

                            <i class="fa-solid fa-floppy-disk"></i>

                            Lưu sản phẩm

                        </button>

                        <a

                                href="/admin/product/list"

                                class="btn btn-secondary">

                            Quay lại

                        </a>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>


</body>

</html>