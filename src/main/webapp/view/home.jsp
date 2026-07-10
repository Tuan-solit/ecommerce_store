<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:import url="component/header.jsp"/>
<c:import url="component/navbar.jsp"/>
<div class="container">

    <div class="row">

        <div class="col-lg-3">

            <c:import url="component/sidebar.jsp"/>
        </div>

        <div class="col-lg-9">

            <c:import url="component/banner.jsp"/>

        </div>

    </div>

    <div id="productCarousel" 
         class="carousel slide my-5" 
         data-bs-ride="false"
         data-bs-interval="false">
        <div class="carousel-inner">
            <c:forEach items="${randomProducts}" var="p" varStatus="status">
                <c:if test="${status.index % 4 == 0}">
                    <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                    <div class="row">
                </c:if>
                <c:set var="p" value="${p}" scope="request"/>
                <c:import url="component/product-card.jsp"/>
                <c:if test="${status.index % 4 == 3 || status.last}">
                    </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#productCarousel" data-bs-slide="prev"
                style="width: 5%;">
            <span class="carousel-control-prev-icon bg-dark rounded-circle p-3" aria-hidden="true"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#productCarousel" data-bs-slide="next"
                style="width: 5%;">
            <span class="carousel-control-next-icon bg-dark rounded-circle p-3" aria-hidden="true"></span>
        </button>
    </div>
</div>
<c:import url="component/footer.jsp"/>

<c:if test="${not empty successMessage}">

    <div class="toast-container position-fixed top-0 end-0 p-3">

        <div id="loginToast"
             class="toast text-bg-success border-0">

            <div class="d-flex">

                <div class="toast-body">

                        ${successMessage}

                </div>

                <button class="btn-close btn-close-white me-2 m-auto"
                        data-bs-dismiss="toast">
                </button>

            </div>

        </div>

    </div>

    <script>

        document.addEventListener("DOMContentLoaded", function () {

            const toast = new bootstrap.Toast(
                document.getElementById("loginToast"),
                {
                    delay:3000
                });

            toast.show();

        });

    </script>

</c:if>
</body>
</html>
