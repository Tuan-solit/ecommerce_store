<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <c:import url="/view/layout/library.jsp"/>
</head>
<body>
<div class="top-header">

    <div class="container">

        <div class="row align-items-center">

            <!-- Logo -->

            <div class="col-md-3">

                <a href="${pageContext.request.contextPath}/home">

                    <img src="${pageContext.request.contextPath}/view/images/logo.png"
                         class="logo"
                         alt="Logo">
                </a>

            </div>

            <!-- Search -->

            <div class="col-md-5">

                <form class="d-flex"
                      action="${pageContext.request.contextPath}/products"
                      method="get">

                    <input type="hidden"
                           name="action"
                           value="search">

                    <input class="form-control me-2"
                           type="search"
                           name="keyword"
                           placeholder="Tìm sản phẩm..."
                           value="${keyword}">

                    <button class="btn btn-primary">
                        <i class="fas fa-search"></i>
                    </button>

                </form>

            </div>

            <!-- Right -->

            <div class="col-md-4">

                <div class="header-right">

                    <!-- Account -->
                    <jsp:include page="/view/component/account.jsp"/>

                    <!-- Cart -->
                    <c:choose>

                        <c:when test="${sessionScope.user != null && sessionScope.user.role == 'user'}">

                            <a href="${pageContext.request.contextPath}/cart"
                               class="position-relative text-decoration-none">

                                <i class="fas fa-shopping-cart fa-lg"></i>

                                <span class="ms-1">
                                    Giỏ hàng
                                </span>

                                <c:if test="${not empty sessionScope.cart && sessionScope.cart.totalQuantity > 0}">

                                    <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">

                                            ${sessionScope.cart.totalQuantity}

                                    </span>

                                </c:if>

                            </a>

                        </c:when>

                        <c:otherwise>

                            <a href="#"
                               data-bs-toggle="modal"
                               data-bs-target="#loginRequiredModal">

                                <i class="fas fa-shopping-cart"></i>

                                Giỏ hàng

                            </a>

                        </c:otherwise>

                    </c:choose>

                </div>

            </div>

        </div>

    </div>

</div>
<div class="modal fade"
     id="loginRequiredModal"
     tabindex="-1">

    <div class="modal-dialog modal-dialog-centered">

        <div class="modal-content">

            <div class="modal-header">

                <h5 class="modal-title">

                    Thông báo

                </h5>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal">
                </button>

            </div>

            <div class="modal-body text-center">

                <i class="fas fa-lock fa-3x text-warning mb-3"></i>

                <h5>

                    Bạn cần đăng nhập để sử dụng giỏ hàng.

                </h5>

                <p>

                    Nếu chưa có tài khoản hãy đăng ký ngay.

                </p>

            </div>

            <div class="modal-footer">

                <a href="${pageContext.request.contextPath}/login"
                   class="btn btn-primary">

                    Đăng nhập

                </a>

                <a href="${pageContext.request.contextPath}/register"
                   class="btn btn-success">

                    Đăng ký

                </a>

                <button class="btn btn-secondary"
                        data-bs-dismiss="modal">

                    Đóng

                </button>

            </div>

        </div>

    </div>

</div>
</body>
</html>
