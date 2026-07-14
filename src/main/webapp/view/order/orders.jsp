<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<html>

<head>

    <title>Lịch sử đơn hàng</title>

    <jsp:include page="/view/layout/library.jsp"/>

</head>

<body>

<jsp:include page="/view/component/header.jsp"/>

<jsp:include page="/view/component/navbar.jsp"/>

<div class="container mt-4 mb-5">

    <h2 class="mb-4">

        Lịch sử đơn hàng

    </h2>

    <c:choose>

        <c:when test="${empty orders}">

            <div class="alert alert-warning">

                Bạn chưa có đơn hàng nào.

            </div>

        </c:when>

        <c:otherwise>

            <table class="table table-bordered table-hover align-middle">

                <thead class="table-dark">

                <tr>

                    <th>Mã đơn</th>

                    <th>Người nhận</th>

                    <th>Điện thoại</th>

                    <th>Địa chỉ</th>

                    <th>Tổng tiền</th>

                    <th>Trạng thái</th>

                    <th width="150">Chi tiết</th>

                </tr>

                </thead>

                <tbody>

                <c:forEach items="${orders}" var="order">

                    <tr>

                        <td>#${order.orderId}</td>

                        <td>${order.receiverName}</td>

                        <td>${order.phone}</td>

                        <td>${order.address}</td>

                        <td>

                            <fmt:formatNumber
                                    value="${order.totalAmount}"
                                    maxFractionDigits="0"/>

                            đ

                        </td>

                        <td>

                            <span class="badge bg-warning text-dark">

                                    ${order.status}

                            </span>

                        </td>

                        <td>

                            <a class="btn btn-primary btn-sm"

                               href="${pageContext.request.contextPath}/orders?action=detail&id=${order.orderId}">

                                Xem

                            </a>

                        </td>

                    </tr>

                </c:forEach>

                </tbody>

            </table>

        </c:otherwise>

    </c:choose>

</div>

<jsp:include page="/view/component/footer.jsp"/>

</body>

</html>