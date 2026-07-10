<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="col-lg-3 col-md-4 col-sm-6 mb-4">

    <div class="product-card">

        <!-- Badge -->

        <span class="badge-sale">
            -10%
        </span>

        <!-- Product Image -->

        <div class="product-image">

            <img src="/view/images/laptop-msi.png"
                 alt="iPhone">

        </div>

        <!-- Product Info -->

        <div class="product-body">

            <h6 class="product-name">

                iPhone 15 Pro Max 256GB

            </h6>

            <div class="product-rating">

                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>

            </div>

            <div class="product-price">

                <span class="old-price">
                    35.990.000đ
                </span>

                <span class="new-price">
                    31.990.000đ
                </span>

            </div>

            <div class="d-grid gap-2 mt-3">

                <a class="btn btn-outline-primary"
                   href="${pageContext.request.contextPath}/products?action=detail&id=${product.id}">

                    <i class="fas fa-eye"></i>

                    Chi tiết

                </a>

                <button class="btn btn-primary">

                    <i class="fas fa-cart-plus"></i>

                    Thêm vào giỏ

                </button>

            </div>

        </div>

    </div>

</div>
</body>
</html>
