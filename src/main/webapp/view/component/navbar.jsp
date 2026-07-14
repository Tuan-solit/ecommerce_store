<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <c:import url="/view/layout/library.jsp"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">

    <div class="container">

        <button class="navbar-toggler"
                data-toggle="collapse"
                data-target="#menu">

            <span class="navbar-toggler-icon"></span>

        </button>

        <div class="collapse navbar-collapse"
             id="menu">

            <ul class="navbar-nav d-flex flex-row gap-4 ps-3">
                <li class="nav-item">
                    <a class="nav-link active"
                       href="${pageContext.request.contextPath}/home">
                        <i class="fas fa-home me-1"></i>
                        Trang chủ
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="products">
                        <i class="fas fa-box-open me-1"></i> Sản phẩm
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="hot-deals">
                        <i class="fas fa-fire text-warning me-1"></i> Khuyến mãi
                    </a>
                </li>
                <li class="nav-item">
                    <c:if test="${sessionScope.user != null && sessionScope.user.role == 'user'}">
                <li class="nav-item">
                    <a class="nav-link"
                       href="${pageContext.request.contextPath}/orders">
                        <i class="fas fa-history me-1"></i>
                        Lịch sử đơn hàng
                    </a>
                </li>
                </c:if>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contact.jsp">
                        <i class="fas fa-headset me-1"></i> Liên hệ
                    </a>
                </li>
            </ul>

        </div>

    </div>

</nav>
</body>
</html>
