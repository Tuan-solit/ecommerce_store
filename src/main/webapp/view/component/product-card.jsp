<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<div class="col-lg-3 col-md-4 col-sm-6 mb-4">

    <div class="product-card">


        <span class="badge-sale">
            -10%
        </span>

        <!-- Product Image -->

        <div class="product-image">

            <img src="${pageContext.request.contextPath}${p.image}"
                 alt="${p.name}">

        </div>

        <!-- Product Info -->

        <div class="product-body">

            <h6 class="product-name">

                ${p.name}

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
                    <fmt:formatNumber value="${p.price * 1.1}" maxFractionDigits="0"/> đ
                </span>

                <span class="new-price">
                    <fmt:formatNumber value="${p.price}" maxFractionDigits="0"/> đ
                </span>
            </div>

            <div class="d-grid gap-2 mt-3">

                <a class="btn btn-outline-danger"
                   href="${pageContext.request.contextPath}/products?action=detail&id=${p.id}">
                        <i class="fas fa-eye"></i>
                        Chi tiết
                </a>

                <form action="${pageContext.request.contextPath}/cart"
                      method="post"
                      class="d-grid">

                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="id" value="${p.id}">

                    <button type="submit" class="btn btn-danger">
                        <i class="fas fa-cart-plus"></i>
                        Thêm vào giỏ
                    </button>

                </form>
            </div>

        </div>

    </div>

</div>