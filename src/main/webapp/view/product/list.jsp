<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>

    <title>Sản phẩm</title>

    <jsp:include page="/view/layout/library.jsp"/>

</head>

<body>

<jsp:include page="/view/component/header.jsp"/>

<jsp:include page="/view/component/navbar.jsp"/>

<div class="container mt-4">

    <div class="row">

        <c:if test="${empty products}">

            <div class="alert alert-warning">

                Không có sản phẩm nào.

            </div>

        </c:if>

        <c:forEach items="${products}" var="product">

            <div class="col-lg-3 col-md-4 col-sm-6 mb-4">

                <div class="card h-100 shadow-sm">

                    <img
                            src="${product.image}"
                            class="card-img-top"
                            style="height:220px;object-fit:cover;">

                    <div class="card-body">

                        <h5 class="card-title">

                                ${product.name}

                        </h5>

                        <p class="text-secondary">

                                ${product.category.name}

                        </p>

                        <h4 class="text-danger">

                                ${product.price} VNĐ

                        </h4>

                    </div>

                    <div class="card-footer text-center">

                        <a class="btn btn-outline-primary"

                           href="${pageContext.request.contextPath}/products?action=detail&id=${product.id}">

                            Xem chi tiết

                        </a>

                    </div>

                </div>

            </div>

        </c:forEach>

    </div>

</div>

<jsp:include page="/view/component/footer.jsp"/>

</body>

</html>