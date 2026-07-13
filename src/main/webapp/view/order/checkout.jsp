<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<html>

<head>

    <title>Thanh toán</title>

</head>

<body>

<c:import url="../component/header.jsp"/>
<c:import url="../component/navbar.jsp"/>

<div class="container mt-4">

    <h2 class="mb-4">

        Xác nhận đơn hàng

    </h2>

    <div class="row">

        <!-- Thông tin người nhận -->

        <div class="col-md-7">

            <div class="card">

                <div class="card-header bg-primary text-white">

                    Thông tin giao hàng

                </div>

                <div class="card-body">

                    <form action="${pageContext.request.contextPath}/checkout"
                          method="post">

                        <div class="mb-3">

                            <label class="form-label">

                                Người nhận

                            </label>

                            <input type="text"
                                   class="form-control"
                                   name="receiverName"
                                   value="${receiverName}">

                            <small class="text-danger">

                                ${receiverNameError}

                            </small>

                        </div>

                        <div class="mb-3">

                            <label class="form-label">

                                Số điện thoại

                            </label>

                            <input type="text"
                                   class="form-control"
                                   name="phone"
                                   value="${phone}">

                            <small class="text-danger">

                                ${phoneError}

                            </small>

                        </div>

                        <div class="mb-3">

                            <label class="form-label">

                                Địa chỉ

                            </label>

                            <textarea class="form-control"
                                      rows="3"
                                      name="address">${address}</textarea>

                            <small class="text-danger">

                                ${addressError}

                            </small>

                        </div>

                        <div class="mb-3">

                            <label class="form-label">

                                Ghi chú

                            </label>

                            <textarea class="form-control"
                                      rows="3"
                                      name="note">${note}</textarea>

                        </div>

                        <button class="btn btn-danger">

                            Đặt hàng

                        </button>

                    </form>

                </div>

            </div>

        </div>
        <div class="col-md-5">

            <div class="card">

                <div class="card-header bg-dark text-white">

                    Đơn hàng

                </div>

                <div class="card-body">

                    <table class="table">

                        <thead>

                        <tr>

                            <th>Sản phẩm</th>

                            <th>SL</th>

                            <th>Tiền</th>

                        </tr>

                        </thead>

                        <tbody>

                        <c:forEach items="${sessionScope.cart.items}"
                                   var="item">

                            <tr>

                                <td>

                                        ${item.product.name}

                                </td>

                                <td>

                                        ${item.quantity}

                                </td>

                                <td>

                                    <fmt:formatNumber
                                            value="${item.subTotal}"
                                            maxFractionDigits="0"/>

                                    đ

                                </td>

                            </tr>

                        </c:forEach>

                        </tbody>

                    </table>

                    <hr>

                    <div class="d-flex justify-content-between">

                        <h5>

                            Tổng tiền

                        </h5>

                        <h5 class="text-danger">

                            <fmt:formatNumber
                                    value="${sessionScope.cart.total}"
                                    maxFractionDigits="0"/>

                            đ

                        </h5>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

<c:import url="../component/footer.jsp"/>

</body>

</html>