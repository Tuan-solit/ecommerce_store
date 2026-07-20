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

                    <h4>

                        Order Detail

                    </h4>

                </div>

                <div class="card-body">

                    <div class="row">

                        <div class="col-md-6">

                            <p>

                                <strong>Order Code:</strong>

                                ${order.id}

                            </p>

                            <p>

                                <strong>Customer:</strong>

                                ${order.userName}

                            </p>

                            <p>

                                <strong>Phone:</strong>

                                ${order.phone}

                            </p>

                        </div>

                        <div class="col-md-6">

                            <p>

                                <strong>Date:</strong>

                                ${order.created}

                            </p>

                            <p>

                                <strong>Total:</strong>

                                <fmt:formatNumber value="${order.total}" maxFractionDigits="0"/> đ

                            </p>

                        </div>

                    </div>

                    <hr>


                    <table class="table table-bordered align-middle"> 
                        <thead>
                        <tr class="table-light text-center">
                            <th style="width: 100px;">Image</th> 
                            <th class="text-start">Product</th>

                            <th>Price</th>

                            <th>Quantity</th>

                            <th>Subtotal</th>

                        </tr>

                        </thead>

                        <tbody>

                        <c:forEach items="${orderDetails}"

                                   var="d">

                            <tr>
                                <td class="text-center">
                                    <c:choose>
                                        <c:when test="${not empty d.product.image}">
                                            <img src="${d.product.image}"
                                                 alt="${d.product.name}"
                                                 class="img-thumbnail"
                                                 style="max-width: 80px; max-height: 80px; object-fit: cover;">
                                        </c:when>
                                        <c:otherwise>
                                            <div class="bg-light text-muted d-flex align-items-center justify-content-center rounded"
                                                 style="width: 80px; height: 80px;">
                                                <i class="fa-solid fa-image fa-lg"></i>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </td>

                                <td>${d.product.name}</td>

                                <td><fmt:formatNumber value="${d.price}" maxFractionDigits="0"/> đ</td>

                                <td>${d.quantity}</td>

                                <td><fmt:formatNumber value="${d.subTotal}" maxFractionDigits="0"/> đ</td>

                            </tr>

                        </c:forEach>

                        </tbody>

                    </table>

                    <form action="/admin/order?action=update"

                          method="post">

                        <input

                                type="hidden"

                                name="orderId"

                                value="${order.id}">

                        <div class="row mt-4">

                            <div class="col-md-4">

                                <select

                                        class="form-select"

                                        name="status">

                                    <option value="pending" ${order.status == 'pending' ? 'selected' : ''}>Pending</option>

                                    <option value="processing" ${order.status == 'processing' ? 'selected' : ''}>Processing</option>

                                    <option value="shipping" ${order.status == 'shipping' ? 'selected' : ''}>Shipping</option>

                                    <option value="completed" ${order.status == 'completed' ? 'selected' : ''}>Completed</option>

                                    <option value="cancelled" ${order.status == 'cancelled' ? 'selected' : ''}>Cancelled</option>

                                </select>

                            </div>

                            <div class="col-md-3">

                                <button

                                        class="btn btn-success">

                                    Cập nhật

                                </button>

                            </div>

                        </div>

                    </form>

                </div>

            </div>
        </div>

    </div>

</div>


</body>

</html>