<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<html>

<head>

    <title>Chi tiết đơn hàng</title>

    <jsp:include page="/view/layout/library.jsp"/>

</head>

<body>

<jsp:include page="/view/component/header.jsp"/>

<jsp:include page="/view/component/navbar.jsp"/>

<div class="container mt-4 mb-5">

    <h2 class="mb-4">

        Chi tiết đơn hàng #${order.orderId}

    </h2>

    <!-- Thông tin đơn hàng -->

    <div class="card mb-4">

        <div class="card-header bg-dark text-white">

            Thông tin giao hàng

        </div>

        <div class="card-body">

            <div class="row">

                <div class="col-md-6">

                    <p>

                        <strong>Người nhận:</strong>

                        ${order.receiverName}

                    </p>

                    <p>

                        <strong>Số điện thoại:</strong>

                        ${order.phone}

                    </p>

                    <p>

                        <strong>Địa chỉ:</strong>

                        ${order.address}

                    </p>

                </div>

                <div class="col-md-6">

                    <p>

                        <strong>Ngày đặt:</strong>

                        <fmt:formatDate
                                value="${order.orderDate}"
                                pattern="dd/MM/yyyy HH:mm"/>

                    </p>

                    <p>

                        <strong>Trạng thái:</strong>

                        <span class="badge bg-warning">

                            ${order.status}

                        </span>

                    </p>

                </div>

            </div>

            <c:if test="${not empty order.note}">

                <hr>

                <p>

                    <strong>Ghi chú:</strong>

                        ${order.note}

                </p>

            </c:if>

        </div>

    </div>

    <!-- Danh sách sản phẩm -->

    <table class="table table-bordered align-middle">

        <thead class="table-dark">

        <tr>

            <th width="120">Ảnh</th>

            <th>Sản phẩm</th>

            <th width="140">Đơn giá</th>

            <th width="120">Số lượng</th>

            <th width="160">Thành tiền</th>

        </tr>

        </thead>

        <tbody>

        <c:forEach items="${details}" var="detail">

            <tr>

                <td>

                    <img src="${pageContext.request.contextPath}${detail.product.image}"
                         alt="${detail.product.name}"
                         width="100">

                </td>

                <td>

                        ${detail.product.name}

                </td>

                <td>

                    <fmt:formatNumber
                            value="${detail.price}"
                            maxFractionDigits="0"/>

                    đ

                </td>

                <td>

                        ${detail.quantity}

                </td>

                <td>

                    <fmt:formatNumber
                            value="${detail.subTotal}"
                            maxFractionDigits="0"/>

                    đ

                </td>

            </tr>

        </c:forEach>

        </tbody>

    </table>

    <!-- Tổng tiền -->

    <div class="d-flex justify-content-end mt-4">

        <h4>

            Tổng tiền:

            <span class="text-danger">

                <fmt:formatNumber
                        value="${order.totalAmount}"
                        maxFractionDigits="0"/>

                đ

            </span>

        </h4>

    </div>

    <!-- Nút quay lại -->

    <div class="mt-4">

        <a href="${pageContext.request.contextPath}/orders"

           class="btn btn-secondary">

            ← Quay lại lịch sử đơn hàng

        </a>

    </div>

</div>

<jsp:include page="/view/component/footer.jsp"/>

</body>

</html>