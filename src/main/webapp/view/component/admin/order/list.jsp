<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

                            <table id="tableOrder" class="table table-hover align-middle datatable">

                                <thead>

                                <tr>

                                    <th>#</th>

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

                                        <td>${o.userName}</td>

                                        <td>${o.created}</td>

                                        <td><fmt:formatNumber value="${o.total}" maxFractionDigits="0"/> đ</td>

                                        <td>

                                            <c:choose>

                                                <c:when test="${o.status=='pending'}">

                                                    <span class="badge bg-warning text-dark">

                                                        Pending
                                                    </span>

                                                </c:when>

                                                <c:when test="${o.status=='processing'}">

                                                    <span class="badge bg-info">

                                                        Processing

                                                    </span>

                                                </c:when>

                                                <c:when test="${o.status=='shipping'}">

                                                    <span class="badge bg-primary">

                                                        Shipping

                                                    </span>

                                                </c:when>

                                                <c:when test="${o.status=='completed'}">

                                                    <span class="badge bg-success">

                                                        Completed

                                                    </span>

                                                </c:when>

                                                <c:otherwise>

                                                    <span class="badge bg-danger">

                                                        Cancelled

                                                    </span>

                                                </c:otherwise>

                                            </c:choose>

                                        </td>

                                        <td>

                                            <a

                                                    href="/admin/order?action=detail&id=${o.id}"

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
<c:if test="${not empty sessionScope.message}">

    <c:set var="toastClass" value="text-bg-success"/>
    <c:if test="${fn:contains(sessionScope.message, 'failed')}">
        <c:set var="toastClass" value="text-bg-danger"/>
    </c:if>

    <div class="toast-container position-fixed top-0 end-0 p-3">

        <div id="successToast"
             class="toast ${toastClass} border-0">

            <div class="d-flex">

                <div class="toast-body">

                    <c:choose>

                        <c:when test="${sessionScope.message == 'update_success'}">
                            Cập nhật trạng thái thành công!
                        </c:when>
                        <c:when test="${sessionScope.message == 'update_failed'}">
                            Cập nhật trạng thái thất bại!
                        </c:when>
                        <c:otherwise>
                            ${sessionScope.message}
                        </c:otherwise>
                    </c:choose>

                </div

                <button
                        type="button"
                        class="btn-close btn-close-white me-2 m-auto"
                        data-bs-dismiss="toast">
                </button>
                <c:remove var="message" scope="session"/>

            </div>

        </div>

    </div>
</c:if>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        let toastElement = document.getElementById("successToast");
        if (toastElement) {
            let toast = new bootstrap.Toast(toastElement, {delay: 3000});
            toast.show();
        }
    });
</script>
<c:import url="/view/layout/libraryDataTable.jsp"/>
</body>

</html>