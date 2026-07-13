<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>

    <title>${product.name}</title>

    <jsp:include page="/view/layout/library.jsp"/>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/css/style.css">

</head>

<body>

<jsp:include page="/view/component/header.jsp"/>

<jsp:include page="/view/component/navbar.jsp"/>

<div class="container mt-5 mb-5">

    <div class="card shadow">

        <div class="row g-0">

            <!-- Image -->

            <div class="col-md-5 text-center p-4">

                <img src="${product.image}"
                     class="img-fluid rounded"
                     style="max-height:450px;object-fit:contain;">

            </div>

            <!-- Info -->

            <div class="col-md-7">

                <div class="card-body">

                    <h2 class="fw-bold">

                        ${product.name}

                    </h2>

                    <p class="text-secondary">

                        Mã sản phẩm:
                        <strong>${product.productCode}</strong>

                    </p>

                    <div class="mb-3">

                        <span class="badge bg-primary">

                            ${product.category.name}

                        </span>

                    </div>

                    <h2 class="text-danger fw-bold">

                        ${product.price} VNĐ

                    </h2>

                    <hr>

                    <p>

                        <strong>Số lượng còn:</strong>

                        ${product.quantity}

                    </p>

                    <p>

                        <strong>Mô tả sản phẩm</strong>

                    </p>

                    <p class="text-muted">

                        ${product.description}

                    </p>

                    <div class="d-grid gap-2 mt-4">

                        <form action="${pageContext.request.contextPath}/cart"
                              method="post">

                            <input type="hidden"
                                   name="action"
                                   value="add">

                            <input type="hidden"
                                   name="id"
                                   value="${product.id}">

                            <button type="submit"
                                    class="btn btn-primary btn-lg w-100">

                                <i class="fas fa-cart-plus"></i>

                                Thêm vào giỏ hàng

                            </button>

                        </form>

                        <a class="btn btn-outline-secondary"
                           href="${pageContext.request.contextPath}/products">

                            <i class="fas fa-arrow-left"></i>

                            Quay lại

                        </a>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

<jsp:include page="/view/component/footer.jsp"/>

</body>

</html>