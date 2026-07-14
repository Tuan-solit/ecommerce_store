<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<html>

<head>

    <title>Giỏ hàng</title>

    <c:import url="/view/layout/library.jsp"/>

</head>

<body>

<c:import url="../component/header.jsp"/>
<c:import url="../component/navbar.jsp"/>

<div class="container mt-4">

    <h2>Giỏ hàng của bạn</h2>

    <c:choose>

        <c:when test="${empty sessionScope.cart.items}">

            <div class="alert alert-warning mt-3">
                Giỏ hàng đang trống.
            </div>

        </c:when>

        <c:otherwise>

            <table class="table table-bordered align-middle">

                <thead class="table-dark">

                <tr>

                    <th>Ảnh</th>
                    <th>Sản phẩm</th>
                    <th>Đơn giá</th>
                    <th width="170">Số lượng</th>
                    <th>Thành tiền</th>
                    <th width="120">Thao tác</th>

                </tr>

                </thead>

                <tbody>

                <c:forEach items="${sessionScope.cart.items}" var="item">

                    <tr>

                        <td width="120">

                            <img src="${pageContext.request.contextPath}${item.product.image}"
                                 alt="${item.product.name}"
                                 width="100">

                        </td>

                        <td>

                                ${item.product.name}

                        </td>

                        <td>

                            <fmt:formatNumber
                                    value="${item.product.price}"
                                    maxFractionDigits="0"/>

                            đ

                        </td>

                        <td>

                            <input
                                    class="form-control quantity-input"
                                    type="number"
                                    min="1"
                                    value="${item.quantity}"
                                    data-id="${item.product.id}">

                        </td>

                        <td class="subtotal">

                            <fmt:formatNumber
                                    value="${item.subTotal}"
                                    maxFractionDigits="0"/>

                            đ

                        </td>

                        <td>

                            <form action="${pageContext.request.contextPath}/cart"
                                  method="post">

                                <input type="hidden"
                                       name="action"
                                       value="delete">

                                <input type="hidden"
                                       name="id"
                                       value="${item.product.id}">

                                <button type="submit"
                                        class="btn btn-danger">

                                    Xóa

                                </button>

                            </form>

                        </td>

                    </tr>

                </c:forEach>

                </tbody>

            </table>

            <div class="d-flex justify-content-end mt-3">

                <h4>

                    Tổng tiền:

                    <span id="cart-total"
                          class="text-danger">

                        <fmt:formatNumber
                                value="${sessionScope.cart.total}"
                                maxFractionDigits="0"/>

                        đ

                    </span>

                </h4>

            </div>

        </c:otherwise>

    </c:choose>

    <div class="d-flex justify-content-between mt-4">

        <a href="${pageContext.request.contextPath}/home"
           class="btn btn-secondary">

            ← Tiếp tục mua

        </a>

        <a href="${pageContext.request.contextPath}/checkout"
           class="btn btn-danger">

            Thanh toán

        </a>

    </div>

</div>

<c:import url="../component/footer.jsp"/>

<script>

    document.querySelectorAll(".quantity-input").forEach(input => {

        input.addEventListener("change", function () {

            const id = this.dataset.id;
            const quantity = this.value;

            fetch("${pageContext.request.contextPath}/cart", {

                method: "POST",

                headers: {
                    "Content-Type": "application/x-www-form-urlencoded"
                },

                body:
                    "action=update&id="
                    + id
                    + "&quantity="
                    + quantity

            })
                .then(response => response.json())

                .then(data => {

                    if (data.success) {

                        location.reload();

                    }

                });

        });

    });

</script>

</body>

</html>