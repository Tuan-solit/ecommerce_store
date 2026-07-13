<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>

    <title>Dashboard</title>

    <c:import url="library.jsp"/>

</head>

<body>

<div class="container-fluid">

    <div class="row">

        <c:import url="sidebar.jsp"/>

        <div class="col-md-10 content">

            <c:import url="navbar.jsp"/>

            <h3 class="mt-4">

                Dashboard

            </h3>

            <p class="text-muted">

                Xin chào Admin, chúc bạn một ngày làm việc hiệu quả.

            </p>

            <!-- Statistic -->

            <div class="row mt-4">

                <div class="col-md-4">

                    <div class="card shadow">

                        <div class="card-body text-center">

                            <i class="fa-solid fa-box fa-2x text-primary"></i>

                            <h5 class="mt-3">

                                Product

                            </h5>

                            <h2>

                                <%--                ${productCount}--%>
                                20

                            </h2>

                        </div>

                    </div>

                </div>

                <div class="col-md-4">

                    <div class="card shadow">

                        <div class="card-body text-center">

                            <i class="fa-solid fa-layer-group fa-2x text-success"></i>

                            <h5 class="mt-3">

                                Category

                            </h5>

                            <h2>

                                <%--${categoryCount}--%>
                                20
                            </h2>

                        </div>

                    </div>

                </div>

                <div class="col-md-4">

                    <div class="card shadow">

                        <div class="card-body text-center">

                            <i class="fa-solid fa-cart-shopping fa-2x text-danger"></i>

                            <h5 class="mt-3">

                                Order

                            </h5>

                            <h2>

                                <%--${orderCount}--%>
                                20
                            </h2>

                        </div>

                    </div>

                </div>

            </div>

            <!-- Product mới -->

            <div class="card shadow mt-5">

                <div class="card-header bg-white">

                    <h5>

                        Sản phẩm mới nhất

                    </h5>

                </div>

                <div class="card-body">

                    <table class="table table-hover">

                        <thead>

                        <tr>

                            <th>STT</th>

                            <th>Tên sản phẩm</th>

                            <th>Giá</th>

                            <th>Danh mục</th>

                        </tr>

                        </thead>

                        <tbody>

                        <c:forEach items="${latestProducts}"
                                   var="p"
                                   varStatus="status">

                            <tr>

                                <td>${status.count}</td>

                                <td>${p.productName}</td>

                                <td>${p.price}</td>

                                <td>${p.categoryName}</td>

                            </tr>

                        </c:forEach>

                        </tbody>

                    </table>

                </div>

            </div>

        </div>

    </div>

</div>

</body>

</html>