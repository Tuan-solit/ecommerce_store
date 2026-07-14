<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>

    <title>Order Management</title>

    <c:import url="../library.jsp"/>

</head>

<body>

<div class="container-fluid">

    <div class="row">

        <c:import url="../sidebar.jsp"/>

        <div class="col-md-10 content">

            <c:import url="../navbar.jsp"/>

            <div class="card shadow mt-4">

                <div class="card-header bg-white">

                    <div class="d-flex justify-content-between">

                        <h4>

                            Order Management

                        </h4>

                        <form class="d-flex">

                            <input class="form-control me-2"

                                   placeholder="Search order...">

                            <button class="btn btn-primary">

                                Search

                            </button>

                        </form>

                    </div>

                </div>

                <div class="card-body">

                    <c:choose>

                        <c:when test="${empty orderList}">

                            <div class="text-center py-5">

                                <i class="fa-solid fa-cart-shopping fa-5x text-secondary mb-3"></i>

                                <h4>Chưa có đơn hàng</h4>

                                <p class="text-muted">

                                    Đơn hàng sẽ xuất hiện sau khi khách đặt hàng.

                                </p>

                            </div>

                        </c:when>

                        <c:otherwise>

                            <table class="table table-hover align-middle">

                                <thead>

                                <tr>

                                    <th>#</th>

                                    <th>Mã đơn</th>

                                    <th>Khách hàng</th>

                                    <th>Ngày đặt</th>

                                    <th>Tổng tiền</th>

                                    <th>Trạng thái</th>

                                    <th></th>

                                </tr>

                                </thead>

                                <tbody>

                                <c:forEach items="${orderList}"

                                           var="o"

                                           varStatus="status">

                                    <tr>

                                        <td>${status.count}</td>

                                        <td>${o.orderCode}</td>

                                        <td>${o.customerName}</td>

                                        <td>${o.orderDate}</td>

                                        <td>${o.totalAmount}</td>

                                        <td>

                                            <!-- Badge -->

                                        </td>

                                        <td>

                                            <a

                                                    href="/order?action=detail&id=${o.id}"

                                                    class="btn btn-outline-primary btn-sm">

                                                <i class="fa-solid fa-eye"></i>

                                            </a>

                                        </td>

                                    </tr>

                                </c:forEach>

                                </tbody>

                            </table>

                        </c:otherwise>

                    </c:choose>

                </div>

            </div>

        </div>

    </div>

</div>

</body>

</html>